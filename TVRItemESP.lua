local UserInputService = game:GetService("UserInputService")
local espList = {}
local WebhookLink = "https://discord.com/api/webhooks/831679555957424128/tBCQNgMtN8fvqq3hyPnpJldbTr3pVLTHtHM4Yu7fK-B5ZxOHspXVziZOxWGeRfgC4mya"
local tespOn = true

local hidden = false

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
local partColorList = { -- Not working
	[Color3.fromRGB(248, 248, 248)] = "Opal",
	[Color3.fromRGB(255, 0, 0)] = "Ruby",
	[Color3.fromRGB(16, 42, 220)] = "Sapphire",
	[Color3.fromRGB(0, 184, 49)] = "Emerald",
	[Color3.fromRGB(89, 34, 89)] = "???",
	[Color3.fromRGB(128, 187, 219)] = "Fairfrozen"
}

function roundNumber(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

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
	
		if tespOn == false then
			Billboard.Enabled = false
		end
	table.insert(espList, Billboard)

		Billboard.Changed:Connect(function(prop)
			if Billboard.Adornee ~= object then
				Billboard:Destroy()
				table.remove(espList, Billboard)
			end
		end)
end

local function hideESP()
	if hidden == true then
		hidden = false
		for i, v in pairs(espList) do
			v.Enabled = true
		end
	else
		hidden = true
		for i, v in pairs(espList) do
			v.Enabled = false
		end
	end
end



local function TrinketLog(object, meshId, color)
	local msg
	local r = roundNumber(tonumber(color.r)*255, 0)
	local g = roundNumber(tonumber(color.g)*255, 0)
	local b = roundNumber(tonumber(color.b)*255, 0)
	color = r.."   "..g.."   "..b
	if meshId ~= "No mesh" then
		msg = tostring(object).."    "..color.."    "..tostring(meshId)
	else
		msg = tostring(object).."    "..color
	end


	local Message = {
		["embeds"] = {
			{
				["title"] = "Found Unknown Item",
				["description"] = msg,
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

-- Finds out what trinket was found
local function TrinketESPList(object)
	if object:IsA("Part") or object:IsA("MeshPart") or object:IsA("UnionOperation") then
		if tostring(object) == "Part" then
			print(object.Color)
			if object:IsA("MeshPart") then
				local meshId = object.MeshId
				if espMeshList[meshId] then
					local name = espMeshList[meshId]
					local color = Color3.fromRGB(58, 58, 58)
					if colorList[name] then
						color = colorList[name]
					end
					CreateLabel(object, name, color, "Trinket")
				else
					if not meshId == "rbxassetid://520445343" then
						TrinketLog(object, object.MeshId, object.Color)
						CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58), "Trinket")
					end
				end
			elseif object:IsA("Part") then
				if object:FindFirstChild("Attachment") then
					if object.Attachment:FindFirstChild("ParticleEmitter") then
						if object.Attachment.ParticleEmitter.Texture == "rbxassetid://1536547385" then
							CreateLabel(object, "PD", Color3.fromRGB(255, 166, 0), "Trinket")
						else			
							TrinketLog(object, "No mesh", object.Color)
							CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58), "Trinket")
						end
					end
				end
				if object.Color == Color3.fromRGB(163, 162, 165) or object.Color == Color3.fromRGB(99, 95, 98) then
					-- If in the bad color list, nothing happens. Congrads!
				elseif object.Color == Color3.fromRGB(248, 248, 248) then
					CreateLabel(object, "Opal", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(255, 0, 0) then
					CreateLabel(object, "Ruby", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(16, 42, 220) then
					CreateLabel(object, "Sapphire", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(0, 184, 49) then
					CreateLabel(object, "Emerald", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(89, 34, 89) then
					CreateLabel(object, "???", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(128, 187, 219) then
					CreateLabel(object, "Fairfrozen", object.Color, "Trinket")
				else
					TrinketLog(object, "No mesh", object.Color)
					CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58), "Trinket")
				end
			elseif object:IsA("UnionOperation") then
				if object.Color == Color3.fromRGB(248, 217, 109) then
					CreateLabel(object, "Scroom Key", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(255, 89, 89) then
					CreateLabel(object, "Philo Stone", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(111, 113, 125) then
					CreateLabel(object, "Idol", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(98, 37, 209) then
					CreateLabel(object, "Lannis Amulet", object.Color, "Trinket")
				elseif object.Color == Color3.fromRGB(163, 162, 165) then
					CreateLabel(object, "WKA", object.Color, "Trinket")
				else
					TrinketLog(object, "No mesh", object.Color)
					CreateLabel(object, "Unknown", Color3.fromRGB(58, 58, 58), "Trinket")
				end
			end
		end
	end
end

local function keyboardInput(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.RightAlt then
			hideESP()
		end
	end
end

for i,v in pairs(game.Workspace:GetChildren()) do
	TrinketESPList(v)
end

game.Workspace.ChildAdded:Connect(function(v)
	TrinketESPList(v)
end)

UserInputService.InputBegan:Connect(keyboardInput)
