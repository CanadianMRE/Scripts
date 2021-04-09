local UserInputService = game:GetService("UserInputService")
local ScreenGui = Instance.new("ScreenGui")
--syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Dropdown = Instance.new("Frame")
--syn.protect_gui(Dropdown)
Dropdown.Name = "Dropdown"
Dropdown.Parent = ScreenGui
Dropdown.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Dropdown.BorderColor3 = Color3.fromRGB(49, 49, 49)
Dropdown.BorderSizePixel = 4
Dropdown.Position = UDim2.new(0.0126300454, 0, 0.021802336, 0)
Dropdown.Size = UDim2.new(0, 200, 0, 40)

local Menu = Instance.new("Frame")
--syn.protect_gui(Menu)
Menu.Name = "Menu"
Menu.Parent = Dropdown
Menu.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Menu.Position = UDim2.new(-0.00125549315, 0, 0.634418309, 0)
Menu.Size = UDim2.new(0, 200, 0, 162)

local UICorner = Instance.new("UICorner")
--syn.protect_gui(UICorner)
UICorner.Parent = Menu

local PlayerESP = Instance.new("TextButton")
--syn.protect_gui(PlayerESP)
PlayerESP.Name = "PlayerESP"
PlayerESP.Parent = Menu
PlayerESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
PlayerESP.Position = UDim2.new(0.0650000051, 0, 0.154077739, 0)
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
--syn.protect_gui(UICorner_2)
UICorner_2.Parent = PlayerESP

local FullBright = Instance.new("TextButton")
--syn.protect_gui(FullBright)
FullBright.Name = "Full Bright"
FullBright.Parent = Menu
FullBright.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
FullBright.Position = UDim2.new(0.0650000051, 0, 0.576780379, 0)
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
--syn.protect_gui(UICorner_3)
UICorner_3.Parent = FullBright

local TrinketESP = Instance.new("TextButton")
--syn.protect_gui(TrinketESP)
TrinketESP.Name = "TrinketESP"
TrinketESP.Parent = Menu
TrinketESP.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
TrinketESP.Position = UDim2.new(0.549651265, 0, 0.157230437, 0)
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
--syn.protect_gui(UICorner_4)
UICorner_4.Parent = TrinketESP

local NoFog = Instance.new("TextButton")
--syn.protect_gui(NoFog)
NoFog.Name = "NoFog"
NoFog.Parent = Menu
NoFog.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
NoFog.Position = UDim2.new(0.550465107, 0, 0.581016779, 0)
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
--syn.protect_gui(UICorner_5)
UICorner_5.Parent = NoFog

local Selection = Instance.new("TextButton")
--syn.protect_gui(Selection)
Selection.Name = "Selection"
Selection.Parent = Dropdown
Selection.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Selection.Position = UDim2.new(0.0149999997, 1, 0.0900000036, 1)
Selection.Size = UDim2.new(0, 192, 0, 30)
Selection.Font = Enum.Font.SourceSans
Selection.Text = "Simple"
Selection.TextColor3 = Color3.fromRGB(103, 103, 103)
Selection.TextScaled = true
Selection.TextSize = 18.000
Selection.TextStrokeColor3 = Color3.fromRGB(38, 38, 38)
Selection.TextStrokeTransparency = 0.000
Selection.TextWrapped = true

local UICorner_6 = Instance.new("UICorner")
--syn.protect_gui(UICorner_6)
UICorner_6.Parent = Selection

local UICorner_7 = Instance.new("UICorner")
--syn.protect_gui(UICorner_7)
UICorner_7.Parent = Dropdown

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

local open = true
Selection.MouseButton1Click:Connect(function()
	if not open then
		Menu:TweenSize(UDim2.new(0, 200,0, 162), "Out", "Sine", 0.25, true)
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
