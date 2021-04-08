local espList = {}
local WebhookLink = "https://discord.com/api/webhooks/791912583577206784/6hWeseY_iRunXQdmWLDu-lnTkwlRhM7jklAZ9nCRYB9JUZkTLClrxKeWBOBNknHpKYlg"

local baitLocations = {
	["5775.13, 250.869, 640.897"] = "Bait",
	["-423.74, 150.329, 310.483"] = "Bait"
}

local espMeshList = {
	["rbxassetid://5204003946"] = "Goblet",
	["rbxassetid://5196782997"] = "Old Ring",
	["rbxassetid://5196776695"] = "Ring",
	["rbxassetid://5196551436"] = "Amulet",
	["rbxassetid://5196577540"] = "Old Amulet",
	["rbxassetid://5204453430"] = "Scroll"
}

local colorList = {
	["Goblet"] = Color3.fromRGB(80, 51, 31),
	["Old Ring"] = Color3.fromRGB(116, 116, 116),
	["Ring"] = Color3.fromRGB(134, 134, 134),
	["Amulet"] = Color3.fromRGB(66, 66, 66),
	["Old Amulet"] = Color3.fromRGB(116, 116, 116),
	["Scroll"] = Color3.fromRGB(255, 166, 0)
}

local espNameIgnore = {
	["SolanSpawn"] = "Ignore",
	["WorldEater"] = "Ignore",
	["PurgatorySpawn"] = "Ignore",
	["SpawnLocation"] = "Ignore",
	["DragonWing"] = "Ignore",
	["SmokeParticle"] = "Ignore",
	["ExplosionRing"] = "Ignore",
	["ExplosionBall"] = "Ignore",
	["DisarmSpell"] = "Ignore",
	["FlatGround"] = "Ignore"
}

-- Makes a label when called
local function CreateLabel(object, name, color)
	local Billboard = Instance.new("BillboardGui")
	syn.protect_gui(Billboard)
	Billboard.Name = math.random(100000,10000000)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Name = math.random(100000,10000000)

	Billboard.Parent = game:GetService("CoreGui")
	Billboard.Adornee = object
	Billboard.Active = true
	Billboard.AlwaysOnTop = true
	Billboard.LightInfluence = 1
	Billboard.Size = UDim2.new(0, 100, 0, 50)
	Billboard.StudsOffset = Vector3.new(0, 0.1, 0)

	TextLabel.Parent = Billboard
	TextLabel.BackgroundTransparency = 1
	TextLabel.BorderSizePixel = 4
	TextLabel.Size = UDim2.new(0, 100, 0, 50)
	TextLabel.Font = Enum.Font.Roboto
	TextLabel.TextColor3 = color
	TextLabel.Text = name
	TextLabel.TextSize = 14
	TextLabel.TextStrokeColor3 = Color3.fromRGB(30, 30, 30)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextWrapped = true

	table.insert(espList, Billboard)

	Billboard.Changed:Connect(function(prop)
		if Billboard.Adornee ~= object then
			Billboard:Destroy()
			table.remove(espList, Billboard)
		end
	end)
end

local function log(object)
	local Message = {
		["embeds"] = {
			{
				["title"] = "Found Unknown Item",
				["description"] = tostring(object),
				["color"] = 16711680,
			}
		}
	}

	syn.request({
		Url = tostring(WebhookLink),
		Method = 'POST',
		Headers = {
			['Content-Type'] = 'application/json'
		},
		Body = game:GetService('HttpService'):JSONEncode(Message)
	});
end

local function ESPList(object)
	if object:IsA("Part") or object:IsA("MeshPart") or object:IsA("UnionOperation") then
		if baitLocations[object.Position] then
			print("Bro thats bait")
		else
			if object:IsA("MeshPart") then
				local meshId = object.MeshId
				if espMeshList[meshId] then
					local name = espMeshList[meshId]
					local color = Color3.fromRGB(58, 58, 58)
					if colorList[name] then
						color = colorList[name]
					end
					CreateLabel(object, name, color)
				else
					if not meshId == "rbxassetid://520445343" then
						log(meshId)
						CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58))
					end
				end
			elseif object:IsA("Part") then
				local color = object.Color
				if espNameIgnore[object.Name] then
				else
					if object:FindFirstChild("Attachment") then
						if object.Attachment:FindFirstChild("ParticleEmitter") then
							print("Found attachment")
							if object.Attachment.ParticleEmitter.Texture == "rbxassetid://1536547385" then
								CreateLabel(object, "PD", Color3.fromRGB(255, 166, 0))
							else			
								log(tostring(object)..tostring(object.Position))
								CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58))
							end
						end
					elseif object.Color == Color3.fromRGB(248, 248, 248) then
						CreateLabel(object, "Opal", color)
					elseif object.Color == Color3.fromRGB(255, 0, 0) then
						CreateLabel(object, "Ruby", color)
					elseif object.Color == Color3.fromRGB(16, 42, 220) then
						CreateLabel(object, "Sapphire", color)
					else			
						log(tostring(object)..tostring(object.Position))
						CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58))
					end
				end
			elseif object:IsA("UnionOperation") then
				if object.Color == Color3.fromRGB(111, 113, 125) then
					CreateLabel(object, "Idol of the Forgotten", object.Color)
				end
			end
		end
	end
end

for i,v in pairs(game.Workspace:GetChildren()) do
	ESPList(v)
end

game.Workspace.ChildAdded:Connect(function(v)
	ESPList(v)
end)
