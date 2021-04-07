local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer

local workout = false
local hidden = false
local stanim = player.Character.CurrentStamina
local keybindGui
local keybindWorkout
local dragging
local dragInput
local dragStart
local startPos

--Make settings file if it doesn't exist
local controlsArray = {}
if syn then
	if isfile('mregui.txt') then
	else
		--Declare default settings
		writefile('mregui.txt', 'RightAlt\n')
		appendfile('mregui.txt', 'M')
	end
	
	-- Split file by line into each setting
	controlsArray = readfile('mregui.txt')
	controlsArray = string.split(controlsArray, "\n")
	
	-- Set settings
	keybindGui = controlsArray[1]
	keybindWorkout = controlsArray[2]
end

local ScreenGui = Instance.new("ScreenGui")
if syn then
	syn.protect_gui(ScreenGui)
end
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
if syn then
	syn.protect_gui(ScreenGui)
end
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
MainFrame.BorderColor3 = Color3.fromRGB(38, 38, 38)
MainFrame.BorderSizePixel = 4
MainFrame.Position = UDim2.new(0.79854542, 0, 0.706395447, 0)
MainFrame.Size = UDim2.new(0, 254, 0, 175)

local UseRate = Instance.new("TextBox")
if syn then
	syn.protect_gui(ScreenGui)
end
UseRate.Name = "UseRate"
UseRate.Parent = MainFrame
UseRate.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
UseRate.BorderColor3 = Color3.fromRGB(48, 48, 48)
UseRate.BorderSizePixel = 4
UseRate.Position = UDim2.new(0.027559055, 0, 0.655420899, 0)
UseRate.Size = UDim2.new(0, 112, 0, 54)
UseRate.Font = Enum.Font.SourceSans
UseRate.Text = "0.01"
UseRate.TextColor3 = Color3.fromRGB(0, 0, 0)
UseRate.TextScaled = true
UseRate.TextSize = 14.000
UseRate.TextWrapped = true

local OnOff = Instance.new("TextButton")
if syn then
	syn.protect_gui(ScreenGui)
end
OnOff.Name = "On/Off"
OnOff.Parent = MainFrame
OnOff.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
OnOff.BorderColor3 = Color3.fromRGB(48, 48, 48)
OnOff.BorderSizePixel = 4
OnOff.Position = UDim2.new(0.027559055, 0, 0.283531755, 0)
OnOff.Size = UDim2.new(0, 112, 0, 54)
OnOff.Font = Enum.Font.SourceSans
OnOff.Text = "Off"
OnOff.TextColor3 = Color3.fromRGB(0, 0, 0)
OnOff.TextScaled = true
OnOff.TextSize = 14.000
OnOff.TextWrapped = true

local ToggleGuiKeybind = Instance.new("TextButton")
if syn then
	syn.protect_gui(ScreenGui)
end
ToggleGuiKeybind.Name = "ToggleGuiKeybind"
ToggleGuiKeybind.Parent = MainFrame
ToggleGuiKeybind.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
ToggleGuiKeybind.BorderColor3 = Color3.fromRGB(48, 48, 48)
ToggleGuiKeybind.BorderSizePixel = 4
ToggleGuiKeybind.Position = UDim2.new(0.535433054, 0, 0.280731231, 0)
ToggleGuiKeybind.Size = UDim2.new(0, 112, 0, 24)
ToggleGuiKeybind.Font = Enum.Font.SourceSans
ToggleGuiKeybind.Text = "ToggleGui("..keybindGui..")"
ToggleGuiKeybind.TextColor3 = Color3.fromRGB(0, 0, 0)
ToggleGuiKeybind.TextSize = 14.000

local OnOffKeybind = Instance.new("TextButton")
if syn then
	syn.protect_gui(ScreenGui)
end
OnOffKeybind.Name = "On/Off Keybind"
OnOffKeybind.Parent = MainFrame
OnOffKeybind.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
OnOffKeybind.BorderColor3 = Color3.fromRGB(48, 48, 48)
OnOffKeybind.BorderSizePixel = 4
OnOffKeybind.Position = UDim2.new(0.535433054, 0, 0.451482654, 0)
OnOffKeybind.Size = UDim2.new(0, 112, 0, 24)
OnOffKeybind.Font = Enum.Font.SourceSans
OnOffKeybind.Text = "On/Off("..keybindWorkout..")"
OnOffKeybind.TextColor3 = Color3.fromRGB(0, 0, 0)
OnOffKeybind.TextSize = 14.000

local KeybindsTitle = Instance.new("TextLabel")
if syn then
	syn.protect_gui(ScreenGui)
end
KeybindsTitle.Name = "Keybinds Title"
KeybindsTitle.Parent = MainFrame
KeybindsTitle.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
KeybindsTitle.BorderColor3 = Color3.fromRGB(48, 48, 48)
KeybindsTitle.BorderSizePixel = 4
KeybindsTitle.Position = UDim2.new(0.535433054, 0, 0.0331753567, 0)
KeybindsTitle.Size = UDim2.new(0, 112, 0, 29)
KeybindsTitle.Font = Enum.Font.SourceSans
KeybindsTitle.Text = "Keybinds"
KeybindsTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
KeybindsTitle.TextScaled = true
KeybindsTitle.TextSize = 14.000
KeybindsTitle.TextWrapped = true

local ControlsTitle = Instance.new("TextLabel")
if syn then
	syn.protect_gui(ScreenGui)
end
ControlsTitle.Name = "ControlsTitle"
ControlsTitle.Parent = MainFrame
ControlsTitle.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
ControlsTitle.BorderColor3 = Color3.fromRGB(48, 48, 48)
ControlsTitle.BorderSizePixel = 4
ControlsTitle.Position = UDim2.new(0.027559042, 0, 0.0331753567, 0)
ControlsTitle.Size = UDim2.new(0, 112, 0, 29)
ControlsTitle.Font = Enum.Font.SourceSans
ControlsTitle.Text = "Controls"
ControlsTitle.TextColor3 = Color3.fromRGB(0, 0, 0)
ControlsTitle.TextScaled = true
ControlsTitle.TextSize = 14.000
ControlsTitle.TextWrapped = true

local HorizontalSplit = Instance.new("Frame")
if syn then
	syn.protect_gui(ScreenGui)
end
HorizontalSplit.Name = "HorizontalSplit"
HorizontalSplit.Parent = MainFrame
HorizontalSplit.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
HorizontalSplit.BorderSizePixel = 0
HorizontalSplit.Position = UDim2.new(0, 0, 0.22190927, 0)
HorizontalSplit.Size = UDim2.new(0, 254, 0, 4)

local VerticalSplit = Instance.new("Frame")
if syn then
	syn.protect_gui(ScreenGui)
end
VerticalSplit.Name = "VerticalSplit"
VerticalSplit.Parent = MainFrame
VerticalSplit.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
VerticalSplit.BorderSizePixel = 0
VerticalSplit.Position = UDim2.new(0.496062994, 0, 0, 0)
VerticalSplit.Size = UDim2.new(0, 4, 0, 175)

local Unused = Instance.new("TextButton")
if syn then
	syn.protect_gui(ScreenGui)
end
Unused.Name = "Unused"
Unused.Parent = MainFrame
Unused.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
Unused.BorderColor3 = Color3.fromRGB(48, 48, 48)
Unused.BorderSizePixel = 4
Unused.Position = UDim2.new(0.535433054, 0, 0.65215981, 0)
Unused.Size = UDim2.new(0, 112, 0, 24)
Unused.Font = Enum.Font.SourceSans
Unused.Text = "Unused"
Unused.TextColor3 = Color3.fromRGB(0, 0, 0)
Unused.TextSize = 14.000

local Unused_2 = Instance.new("TextButton")
if syn then
	syn.protect_gui(ScreenGui)
end
Unused_2.Name = "Unused"
Unused_2.Parent = MainFrame
Unused_2.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
Unused_2.BorderColor3 = Color3.fromRGB(48, 48, 48)
Unused_2.BorderSizePixel = 4
Unused_2.Position = UDim2.new(0.535433054, 0, 0.822911263, 0)
Unused_2.Size = UDim2.new(0, 112, 0, 24)
Unused_2.Font = Enum.Font.SourceSans
Unused_2.Text = "Unused"
Unused_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Unused_2.TextSize = 14.000

local function saveSettings()
	writefile('mregui.txt', keybindGui.."\n")
	appendfile('mregui.txt', keybindWorkout)
end

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

local function stopWorkout()
	workout = false
	OnOff.Text = "Off"
end

local function startWorkout()
	workout = true
	OnOff.Text = "On"
end

local function ToggleWorkout()
	if workout == true then
		stopWorkout()
	else
		startWorkout()
	end
end

local function ToggleGui()
	if hidden == false then
		ScreenGui.Enabled = false
		hidden = true
	else
		ScreenGui.Enabled = true
		hidden = false
	end
end

local changeKey = false
local keyChanged

local function keyboardInput(input, gameProcessed)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if changeKey == false then
			if input.KeyCode == Enum.KeyCode[keybindWorkout] then
				ToggleWorkout()
			elseif input.KeyCode == Enum.KeyCode[keybindGui] then
				ToggleGui()
			end
		else
			if keyChanged == "OnOff" then
				local splittedKey = string.split(tostring(input.KeyCode), ".")
				keybindWorkout = splittedKey[3]
				saveSettings()
				OnOffKeybind.Text = "On/Off("..keybindWorkout..")"
			elseif keyChanged == "gui" then
				local splittedKey = string.split(tostring(input.KeyCode), ".")
				keybindGui = splittedKey[3]
				saveSettings()
				ToggleGuiKeybind.Text = "ToggleGui("..keybindGui..")"
			end
			changeKey = false
		end
	end
end

local function changeOnOffKey()
	if changeKey == false then
		changeKey = true
		keyChanged = "OnOff"
		OnOffKeybind.Text = "[Type a Key]"
	end
end

local function changeGuiKey()
	if changeKey == false then
		changeKey = true
		keyChanged = "gui"
		ToggleGuiKeybind.Text = "[Type a Key]"
	end
end

local function StartChangeKey(key)
	changeKey = true
	keyChanged = key
	if keyChanged == "OnOff" then
		OnOffKeybind.Text = "[Type a Key]"

	elseif keyChanged == "ToggleGui" then
		ToggleGuiKeybind.Text = "[Type a Key]"

	end
end

UserInputService.InputBegan:connect(keyboardInput)

OnOff.Activated:Connect(ToggleWorkout)

OnOffKeybind.Activated:Connect(changeOnOffKey)

ToggleGuiKeybind.Activated:Connect(changeGuiKey)

MainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

MainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

while true do
	if workout then
		local rate = UseRate.Text
		if tonumber(rate) then
			local tool = player.Character:FindFirstChildWhichIsA("Tool")
			if stanim.Value >= 20 then
				if tool then
					tool:Activate()
					wait(tonumber(rate)) -- (2.5 for pushup, 3 for squat) Change this value to wait longer between each click. 0.01 to do fast workouts, however long the workout you are training is for slow workouts
				end
			else
				while stanim.Value <= 100 do -- change the value here to begin again at different stanima values
					wait(0.01)
				end
			end
		else
			UseRate.Text = "That is not a number"
			stopWorkout()
		end
	end
	wait(0.01)
end
