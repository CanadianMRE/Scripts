-- Stuff you can change
-- You must be in Palmyra Oasis for this to work properly btw

-- Weapon name
local toolname = "Wooden Shortsword"

-- How long the script holds the heavy button
local attackdelay = 1

-- Change these for the names of the dummy accounts
local dummy1 = "BossRaidOniTime"
local dummy2 = ""
local dummy3 = ""
local dummy4 = ""

-- Changes the name of the attacker. Change this to the name of the account you want to attack
-- The window of the account attacking MUST be selected for this to work. It will not hit if you do not select it.
local attackerName = ""

-- Changes how close a player can get to you
local nearDistance = 600


------------------------------------------------------------------------------------------------------------------------------------------------------

-- Teleport once we hit menu
if game.PlaceId == 1383356634 then
	local Teleport = game:GetService("ReplicatedStorage"):WaitForChild("Teleport")
	Teleport:FireServer();
elseif game.PlaceId == 1383406692 then
	wait(3)
	local players = game:GetService("Players")
	local player = players.LocalPlayer

	local safeplayers = {
		[dummy1] = "",
		[dummy2] = "",
		[dummy3] = "",
		[dummy4] = "",
		[attackerName] = ""
	}

	local gameid = 1383356634
	local gameGroup = 1160789
	local badroles = {
		["Developer"] = "",
		["Moderator"] = "",
		["Community Consultant/Tester"] = "",
		["Overseer"] = "",
		["Administrator"] = "",
		["Advanced Developer"] = "",
		["Manager"] = "",
		["Owner"] = ""
	}

	local function hopservers(reason)
		player:Kick(reason)
		while true do
			wait(0.1)
			game:GetService("TeleportService"):Teleport(gameid)
		end
	end

	-- Checks if mod is in server
	players.PlayerAdded:Connect(function(plr)
		local group = plr:GetRoleInGroup(gameGroup)
		if badroles[group] then
			hopservers("Mod in server")
		end
	end)

	for i, plr in pairs(players:GetChildren()) do
		local group = plr:GetRoleInGroup(gameGroup)
		if badroles[group] then
			hopservers("Mod in server")
		end
	end

	-- Hops if player is nearby
	coroutine.wrap(function()
		game:GetService("RunService").Stepped:Connect(function()
			for i,v in pairs(players:GetPlayers()) do
				if not safeplayers[v.Name] then
					if v.Character ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						local Distance = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

						if Distance <= nearDistance then
							hopservers("Player too close")
						end
					end
				end
			end
		end)
	end)()

	-- Account being attacked
	if player.Name == dummy1 or player.Name == dummy2 or player.Name == dummy3 or player.Name == dummy4 then
		print("Attack Dummy")
		repeat wait() until player.Character ~= nil
		local character = player.Character
		game:GetService('RunService').Stepped:connect(function()
			game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			local hrp = character:WaitForChild("HumanoidRootPart")
			hrp.CFrame = CFrame.new(-852.341, 562.477, 743.371)
		end)
		player.CharacterAdded:Connect(function(char)
			game:GetService('RunService').Stepped:connect(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
				local hrp = char:WaitForChild("HumanoidRootPart")
				hrp.CFrame = CFrame.new(-852.341, 562.477, 743.371)
			end)
		end)
	end

	-- Account attacking


	if player.Name == attackerName then
		print("Attacker")
		while true do
			wait(0.1)
			if player.Character then
				local backpack = player.Backpack
				local character = player.Character
				local hrp = character:WaitForChild("HumanoidRootPart")
				hrp.CFrame = CFrame.new(-848.778564, 561.602295, 744.339478, 0.194356024, 0, 0.980931044, 0, 1, 0, -0.980931044, 0, 0.194356024)

				local humanoid = character:WaitForChild("Humanoid")
				if character:FindFirstChild(toolname) then
					print("Weapon Equipped")
					if isrbxactive() then
						mouse1press()
						wait(attackdelay)
						mouse1release()
					end
				else
					local items = backpack:GetChildren()
					for i, v in pairs(items) do
						print(v.Name)
					end
					if backpack:FindFirstChild(toolname) then
						print("Found Tool in bp")
						humanoid:EquipTool(backpack[toolname])
					else
						print("No tool in bp")
					end
				end
			end
		end
	end
end