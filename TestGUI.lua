local UserInputService = game:GetService("UserInputService")
local Player = game:GetService("Players").LocalPlayer

local FullBrightKey
local NoFogKey
local PlayerESPKey
local TrinketESPKey
local WeaponESPKey
local ToggleGUIKey
local AutoBardKey
local InstantLogKey
local GUILocation

--Load Settings
if syn then
	if isfile('SimpleGUI.txt') then
	else
		--Declare default settings
		writefile('SimpleGUI.txt', 'K\n')
		appendfile('SimpleGUI.txt', 'J\n')
		appendfile('SimpleGUI.txt', 'H\n')
		appendfile('SimpleGUI.txt', 'I\n')
		appendfile('SimpleGUI.txt', 'U\n')
		appendfile('SimpleGUI.txt', 'RightAlt\n')
		appendfile('SimpleGUI.txt', '0.0126300454, 0, 0.021802336, 0\n')
		appendfile('SimpleGUI.txt', 'O\n')
		appendfile('SimpleGUI.txt', 'X')
	end

	local settingsTable = {}
	-- Split file by line into each setting
	settingsTable = readfile('SimpleGUI.txt')
	settingsTable = string.split(settingsTable, "\n")
	for i, v in pairs(settingsTable) do
		print(v)
	end

	-- Set settings
	FullBrightKey = settingsTable[1]
	NoFogKey = settingsTable[2]
	PlayerESPKey = settingsTable[3]
	TrinketESPKey = settingsTable[4]
	WeaponESPKey = settingsTable[5]
	ToggleGUIKey = settingsTable[6]
	GUILocation = settingsTable[7]
	AutoBardKey = settingsTable[8]
	InstantLogKey = settingsTable[9]
end

-- Make the entire GUI
local ScreenGui = Instance.new("ScreenGui")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Dropdown = Instance.new("Frame")
syn.protect_gui(Dropdown)
Dropdown.Name = "Dropdown"
Dropdown.Parent = ScreenGui
Dropdown.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Dropdown.BorderColor3 = Color3.fromRGB(49, 49, 49)
Dropdown.BorderSizePixel = 4
Dropdown.Position = UDim2.new(GUILocation)
Dropdown.Size = UDim2.new(0, 200, 0, 40)

local Menu = Instance.new("Frame")
syn.protect_gui(Menu)
Menu.Name = "Menu"
Menu.Parent = Dropdown
Menu.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Menu.Position = UDim2.new(-0.00125549315, 0, 0.634418309, 0)
Menu.Size = UDim2.new(0, 200, 0, 232)

local UICorner = Instance.new("UICorner")
syn.protect_gui(UICorner)
UICorner.Parent = Menu

local PlayerESP = Instance.new("TextButton")
syn.protect_gui(PlayerESP)
PlayerESP.Name = "PlayerESP"
PlayerESP.Parent = Menu
PlayerESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
PlayerESP.Position = UDim2.new(0.0650000051, 0, 0.0871341676, 0)
PlayerESP.Size = UDim2.new(0, 76, 0, 50)
PlayerESP.Font = Enum.Font.SourceSans
PlayerESP.Text = "Player ESP"
PlayerESP.TextColor3 = Color3.fromRGB(103, 103, 103)
PlayerESP.TextScaled = true
PlayerESP.TextSize = 14.000
PlayerESP.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
PlayerESP.TextStrokeTransparency = 0.000
PlayerESP.TextWrapped = true

local UICorner_2 = Instance.new("UICorner")
syn.protect_gui(UICorner_2)
UICorner_2.Parent = PlayerESP

local FullBright = Instance.new("TextButton")
syn.protect_gui(FullBright)
FullBright.Name = "Full Bright"
FullBright.Parent = Menu
FullBright.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
FullBright.Position = UDim2.new(0.0650000051, 0, 0.310761571, 0)
FullBright.Size = UDim2.new(0, 76, 0, 50)
FullBright.Font = Enum.Font.SourceSans
FullBright.Text = "Full Bright"
FullBright.TextColor3 = Color3.fromRGB(103, 103, 103)
FullBright.TextScaled = true
FullBright.TextSize = 14.000
FullBright.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
FullBright.TextStrokeTransparency = 0.000
FullBright.TextWrapped = true

local UICorner_3 = Instance.new("UICorner")
syn.protect_gui(UICorner_3)
UICorner_3.Parent = FullBright

local TrinketESP = Instance.new("TextButton")
syn.protect_gui(TrinketESP)
TrinketESP.Name = "TrinketESP"
TrinketESP.Parent = Menu
TrinketESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TrinketESP.Position = UDim2.new(0.549651265, 0, 0.0902868658, 0)
TrinketESP.Size = UDim2.new(0, 76, 0, 50)
TrinketESP.Font = Enum.Font.SourceSans
TrinketESP.Text = "Trinket ESP"
TrinketESP.TextColor3 = Color3.fromRGB(103, 103, 103)
TrinketESP.TextScaled = true
TrinketESP.TextSize = 14.000
TrinketESP.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
TrinketESP.TextStrokeTransparency = 0.000
TrinketESP.TextWrapped = true

local UICorner_4 = Instance.new("UICorner")
syn.protect_gui(UICorner_4)
UICorner_4.Parent = TrinketESP

local NoFog = Instance.new("TextButton")
syn.protect_gui(NoFog)
NoFog.Name = "NoFog"
NoFog.Parent = Menu
NoFog.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
NoFog.Position = UDim2.new(0.550465107, 0, 0.314997971, 0)
NoFog.Size = UDim2.new(0, 76, 0, 50)
NoFog.Font = Enum.Font.SourceSans
NoFog.Text = "No Fog"
NoFog.TextColor3 = Color3.fromRGB(103, 103, 103)
NoFog.TextScaled = true
NoFog.TextSize = 14.000
NoFog.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
NoFog.TextStrokeTransparency = 0.000
NoFog.TextWrapped = true

local UICorner_5 = Instance.new("UICorner")
syn.protect_gui(UICorner_5)
UICorner_5.Parent = NoFog

local Selection = Instance.new("TextButton")
syn.protect_gui(Selection)
Selection.Name = "Selection"
Selection.Parent = Dropdown
Selection.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Selection.Position = UDim2.new(0.0149999997, 1, 0.0900000036, 1)
Selection.Size = UDim2.new(0, 192, 0, 30)
Selection.Font = Enum.Font.SourceSans
Selection.Text = "Simple GUI"
Selection.TextColor3 = Color3.fromRGB(103, 103, 103)
Selection.TextScaled = true
Selection.TextSize = 18.000
Selection.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
Selection.TextStrokeTransparency = 0.000
Selection.TextWrapped = true

local UICorner_6 = Instance.new("UICorner")
syn.protect_gui(UICorner_6)
UICorner_6.Parent = Selection

local UICorner_7 = Instance.new("UICorner")
syn.protect_gui(UICorner_7)
UICorner_7.Parent = Dropdown

local WeaponESP = Instance.new("TextButton")
syn.protect_gui(Selection)
WeaponESP.Name = "WeaponESP"
WeaponESP.Parent = Menu
WeaponESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
WeaponESP.Position = UDim2.new(0.0650000051, 0, 0.53084892, 0)
WeaponESP.Size = UDim2.new(0, 76, 0, 50)
WeaponESP.Font = Enum.Font.SourceSans
WeaponESP.Text = "Weapon ESP"
WeaponESP.TextColor3 = Color3.fromRGB(103, 103, 103)
WeaponESP.TextScaled = true
WeaponESP.TextSize = 14.000
WeaponESP.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
WeaponESP.TextStrokeTransparency = 0.000
WeaponESP.TextWrapped = true

local UICorner_8 = Instance.new("UICorner")
syn.protect_gui(UICorner_7)
UICorner_8.Parent = WeaponESP

local AutoBard = Instance.new("TextButton")
syn.protect_gui(AutoBard)
AutoBard.Name = "AutoBard"
AutoBard.Parent = Menu
AutoBard.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
AutoBard.Position = UDim2.new(0.549651265, 0, 0.534001589, 0)
AutoBard.Size = UDim2.new(0, 76, 0, 50)
AutoBard.Font = Enum.Font.SourceSans
AutoBard.Text = "Auto Bard"
AutoBard.TextColor3 = Color3.fromRGB(103, 103, 103)
AutoBard.TextScaled = true
AutoBard.TextSize = 14.000
AutoBard.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
AutoBard.TextStrokeTransparency = 0.000
AutoBard.TextWrapped = true

local CloseGui = Instance.new("TextButton")
syn.protect_gui(CloseGui)
CloseGui.Name = "Other"
CloseGui.Parent = Menu
CloseGui.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
CloseGui.Position = UDim2.new(0.550465107, 0, 0.754997969, 0)
CloseGui.Size = UDim2.new(0, 76, 0, 50)
CloseGui.Font = Enum.Font.SourceSans
CloseGui.Text = "Close GUI"
CloseGui.TextColor3 = Color3.fromRGB(103, 103, 103)
CloseGui.TextScaled = true
CloseGui.TextSize = 14.000
CloseGui.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
CloseGui.TextStrokeTransparency = 0.000
CloseGui.TextWrapped = true

local UICorner_11 = Instance.new("UICorner")
syn.protect_gui(UICorner_11)
UICorner_11.Parent = CloseGui

local InstantLog = Instance.new("TextButton")
syn.protect_gui(InstantLog)
InstantLog.Name = "InstantLog"
InstantLog.Parent = Menu
InstantLog.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
InstantLog.Position = UDim2.new(0.0650000051, 0, 0.750761628, 0)
InstantLog.Size = UDim2.new(0, 76, 0, 50)
InstantLog.Font = Enum.Font.SourceSans
InstantLog.Text = "Instant Log"
InstantLog.TextColor3 = Color3.fromRGB(103, 103, 103)
InstantLog.TextScaled = true
InstantLog.TextSize = 14.000
InstantLog.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
InstantLog.TextStrokeTransparency = 0.000
InstantLog.TextWrapped = true

local UICorner_10 = Instance.new("UICorner")
syn.protect_gui(UICorner_10)
UICorner_10.Parent = InstantLog

local UICorner_9 = Instance.new("UICorner")
syn.protect_gui(UICorner_7)
UICorner_9.Parent = AutoBard

-- Handles UI dragging physics
local dragging
local dragInput
local dragStart
local startPos
local function update(input)
	local delta = input.Position - dragStart
	Dropdown.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Dropdown.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Dropdown.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Dropdown.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Handles gui collapse physics
local open = true
local defSize = Menu.Size
Selection.MouseButton1Click:Connect(function()
	if not open then
		Menu:TweenSize(defSize, "Out", "Sine", 0.25, true)
		for _, button in pairs(Menu:GetChildren()) do
			if button:IsA("TextButton") then
				button.Active = true
				button.Visible = true
			end
		end
		open = true
	else
		Menu:TweenSize(UDim2.new(0, 200, 0, 0), "Out", "Sine", 0.25, true)
		wait(0.05)
		for _, button in pairs(Menu:GetChildren()) do
			if button:IsA("TextButton") then
				button.Active = true
				button.Visible = false
			end
		end
		open = false
	end
end)

-- if true, the next button to be clicked will have its keybind changed
local changeKey = false
local keyChanged = "Nothing"
-- Full bright toggle
local fbOn = false
local function ToggleFullBright()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "FullBright"
	else
		if fbOn == true then
			fbOn = false
			FullBright.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offbright")
		else
			fbOn = true
			FullBright.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("onbright")
		end
	end
end

-- No fog toggle
local nfOn = false
local function ToggleNoFog()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "NoFog"
	else
		if nfOn == true then
			nfOn = false
			NoFog.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offfog")
		else
			nfOn = true
			NoFog.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("onfog")
		end
	end
end

-- Player esp toggle
local pespOn = false
local function TogglePlayerESP()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "PlayerESP"
	else
		if pespOn == true then
			pespOn = false
			PlayerESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offplr")
		else
			pespOn = true
			PlayerESP.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("onplr")
		end
	end
end

-- Trinket esp toggle
local tespOn = false
local function ToggleTrinketESP()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "TrinketESP"
	else
		if tespOn == true then
			tespOn = false
			TrinketESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offtrink")
		else
			tespOn = true
			TrinketESP.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("ontrink")
		end
	end
end

-- Weapon esp toggle
local wespOn = false
local function ToggleWeaponESP()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "WeaponESP"
	else
		if wespOn == true then
			wespOn = false
			WeaponESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offweap")
		else
			wespOn = true
			WeaponESP.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("onweap")
		end
	end
end

-- Auto bard toggle
local autobOn = false
local function ToggleAutoBard()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "AutoBard"
	else
		if autobOn == true then
			autobOn = false
			AutoBard.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offbard")
		else
			autobOn = true
			AutoBard.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("onbard")
		end
	end
end

local function InsLog()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "InstantLog"
	else
		Player:Kick("Instant Logged")
	end
end

-- Gui toggle
local guiOn = true
local function ToggleGUI()
	if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 
		changeKey = true
		keyChanged = "ToggleGUI"
	else
		if guiOn == true then
			guiOn = false
			Dropdown.Visible = false
			CloseGui.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
			print("offgui")
		else
			guiOn = true
			Dropdown.Visible = true
			CloseGui.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
			print("ongui")
		end
	end	
end

-- Handles all keyboard input
local function keyboardInput(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if changeKey == false then
			if input.KeyCode == Enum.KeyCode[FullBrightKey] then
				ToggleFullBright()
			elseif input.KeyCode == Enum.KeyCode[NoFogKey] then
				ToggleNoFog()
			elseif input.KeyCode == Enum.KeyCode[PlayerESPKey] then
				TogglePlayerESP()
			elseif input.KeyCode == Enum.KeyCode[TrinketESPKey] then
				ToggleTrinketESP()
			elseif input.KeyCode == Enum.KeyCode[WeaponESPKey] then
				ToggleWeaponESP()
			elseif input.KeyCode == Enum.KeyCode[ToggleGUIKey] then
				ToggleGUI()
			elseif input.KeyCode == Enum.KeyCode[AutoBardKey] then
				ToggleAutoBard()
			elseif input.KeyCode == Enum.KeyCode[InstantLogKey] then
				InsLog()
			end
		else
			local splittedKey = string.split(tostring(input.KeyCode), ".")
			if keyChanged == "InstantLog" then
				InstantLogKey = splittedKey[3]
				changeKey = false
			elseif keyChanged == "FullBright" then
				FullBrightKey = splittedKey[3]
				changeKey = false
			elseif keyChanged == "NoFog" then
				NoFogKey = splittedKey[3]
				changeKey = false
			elseif keyChanged == "ToggleGUI" then
				ToggleGUIKey = splittedKey[3]
				changeKey = false
			elseif keyChanged == "PlayerESP" then
				PlayerESPKey = splittedKey[3]
				changeKey = false
			elseif keyChanged == "TrinketESP" then
				TrinketESP = splittedKey[3]
				changeKey = false
			elseif keyChanged == "AutoBard" then
				AutoBardKey = splittedKey[3]
				changeKey = false
			elseif keyChanged == "WeaponESP" then
				WeaponESP = splittedKey[3]
				changeKey = false
			end
		end
	end
end

UserInputService.InputBegan:Connect(keyboardInput)

FullBright.Activated:Connect(ToggleFullBright)
NoFog.Activated:Connect(ToggleNoFog)
PlayerESP.Activated:Connect(TogglePlayerESP)
TrinketESP.Activated:Connect(ToggleTrinketESP)
WeaponESP.Activated:Connect(ToggleWeaponESP)
AutoBard.Activated:Connect(ToggleAutoBard)
InstantLog.Activated:Connect(InsLog)
CloseGui.Activated:Connect(ToggleGUI)
