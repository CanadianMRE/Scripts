local UserInputService = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer

local workout = false
local hidden = false
local stanim = player.Character.CurrentStamina
local keybindGui
local keybindWorkout
local fatigueCheck = true
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
local MainFrame = Instance.new("Frame")
if syn then
	syn.protect_gui(MainFrame)
end
local AutoEat = Instance.new("TextButton")
if syn then
	syn.protect_gui(AutoEat)
end
local ToggleGuiKeybind = Instance.new("TextButton")
if syn then
	syn.protect_gui(ToggleGuiKeybind)
end
local OnOffKeybind = Instance.new("TextButton")
if syn then
	syn.protect_gui(OnOffKeybind)
end
local KeybindsTitle = Instance.new("TextLabel")
if syn then
	syn.protect_gui(KeybindsTitle)
end
local ControlsTitle = Instance.new("TextLabel")
if syn then
	syn.protect_gui(ControlsTitle)
end
local HorizontalSplit = Instance.new("Frame")
if syn then
	syn.protect_gui(HorizontalSplit)
end
local VerticalSplit = Instance.new("Frame")
if syn then
	syn.protect_gui(VerticalSplit)
end
local Unused = Instance.new("TextButton")
if syn then
	syn.protect_gui(Unused)
end
local Unused_2 = Instance.new("TextButton")
if syn then
	syn.protect_gui(Unused_2)
end
local Notification = Instance.new("TextButton")
if syn then
	syn.protect_gui(Notification)
end
local Notification2 = Instance.new("TextLabel")
if syn then
	syn.protect_gui(Notification2)
end
local UseRate = Instance.new("TextBox")
if syn then
	syn.protect_gui(UseRate)
end
local OnOff = Instance.new("TextButton")
if syn then
	syn.protect_gui(OnOff)
end
local doFatigueCheck = Instance.new("TextButton")
if syn then
	syn.protect_gui(doFatigueCheck)
end

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
MainFrame.BorderColor3 = Color3.fromRGB(38, 38, 38)
MainFrame.BorderSizePixel = 4
MainFrame.Position = UDim2.new(0.795636296, 0, 0.597383857, 0)
MainFrame.Size = UDim2.new(0, 254, 0, 175)

AutoEat.Name = "AutoEat"
AutoEat.Parent = MainFrame
AutoEat.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
AutoEat.BorderColor3 = Color3.fromRGB(48, 48, 48)
AutoEat.BorderSizePixel = 4
AutoEat.Position = UDim2.new(0.027559055, 0, 0.823588312, 0)
AutoEat.Size = UDim2.new(0, 112, 0, 23)
AutoEat.Font = Enum.Font.SourceSans
AutoEat.Text = "Disabled"
AutoEat.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoEat.TextScaled = true
AutoEat.TextSize = 14.000
AutoEat.TextWrapped = true

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

HorizontalSplit.Name = "HorizontalSplit"
HorizontalSplit.Parent = MainFrame
HorizontalSplit.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
HorizontalSplit.BorderSizePixel = 0
HorizontalSplit.Position = UDim2.new(0, 0, 0.22190927, 0)
HorizontalSplit.Size = UDim2.new(0, 254, 0, 4)

VerticalSplit.Name = "VerticalSplit"
VerticalSplit.Parent = MainFrame
VerticalSplit.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
VerticalSplit.BorderSizePixel = 0
VerticalSplit.Position = UDim2.new(0.496062994, 0, 0, 0)
VerticalSplit.Size = UDim2.new(0, 4, 0, 175)

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

Notification.Name = "Notification"
Notification.Parent = MainFrame
Notification.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Notification.BorderColor3 = Color3.fromRGB(38, 38, 38)
Notification.BorderSizePixel = 4
Notification.Position = UDim2.new(0, 0, -0.285714298, 0)
Notification.Size = UDim2.new(0, 254, 0, 50)
Notification.Visible = false
Notification.Font = Enum.Font.SourceSans
Notification.TextColor3 = Color3.fromRGB(0, 0, 0)
Notification.TextSize = 14.000
Notification.TextScaled = true

Notification2.Name = "Notification2"
Notification2.Parent = Notification
Notification2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Notification2.BackgroundTransparency = 1.000
Notification2.Position = UDim2.new(0, 0, 0.751428545, 0)
Notification2.Size = UDim2.new(0, 254, 0, 12)
Notification2.Font = Enum.Font.SourceSans
Notification2.Text = "Click to Close"
Notification2.TextColor3 = Color3.fromRGB(0, 0, 0)
Notification2.TextSize = 14.000

UseRate.Name = "UseRate"
UseRate.Parent = MainFrame
UseRate.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
UseRate.BorderColor3 = Color3.fromRGB(48, 48, 48)
UseRate.BorderSizePixel = 4
UseRate.Position = UDim2.new(0.027559055, 0, 0.280054271, 0)
UseRate.Size = UDim2.new(0, 112, 0, 24)
UseRate.Font = Enum.Font.SourceSans
UseRate.Text = "1"
UseRate.TextColor3 = Color3.fromRGB(0, 0, 0)
UseRate.TextScaled = true
UseRate.TextSize = 14.000
UseRate.TextWrapped = true

OnOff.Name = "On/Off"
OnOff.Parent = MainFrame
OnOff.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
OnOff.BorderColor3 = Color3.fromRGB(48, 48, 48)
OnOff.BorderSizePixel = 4
OnOff.Position = UDim2.new(0.027559042, 0, 0.452159762, 0)
OnOff.Size = UDim2.new(0, 112, 0, 23)
OnOff.Font = Enum.Font.SourceSans
OnOff.Text = "Workout: off"
OnOff.TextColor3 = Color3.fromRGB(0, 0, 0)
OnOff.TextScaled = true
OnOff.TextSize = 14.000
OnOff.TextWrapped = true

doFatigueCheck.Name = "doFatigueCheck"
doFatigueCheck.Parent = MainFrame
doFatigueCheck.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
doFatigueCheck.BorderColor3 = Color3.fromRGB(48, 48, 48)
doFatigueCheck.BorderSizePixel = 4
doFatigueCheck.Position = UDim2.new(0.027559042, 0, 0.65215975, 0)
doFatigueCheck.Size = UDim2.new(0, 112, 0, 23)
doFatigueCheck.Font = Enum.Font.SourceSans
doFatigueCheck.Text = "Fatigue Check: On"
doFatigueCheck.TextColor3 = Color3.fromRGB(0, 0, 0)
doFatigueCheck.TextScaled = true
doFatigueCheck.TextSize = 14.000
doFatigueCheck.TextWrapped = true

local function notify(message)
	Notification.Visible = true
	Notification.Active = true
	Notification.Text = message
end

local function CloseNotify()
	Notification.Visible = false
	Notification.Active = false
end

local function saveSettings()
	writefile('mregui.txt', keybindGui.."\n")
	appendfile('mregui.txt', keybindWorkout)
end

local function getFatigue()
	return tonumber(string.match(player.PlayerGui:WaitForChild("MainGui").Utility:FindFirstChild("BodyFatigue").Text:sub(1, -2), '%S+$'))
end

local function getHunger()
	
end

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

local function stopWorkout()
	workout = false
	OnOff.Text = "Workout: Off"
end

local function startWorkout()
	workout = true
	OnOff.Text = "Workout: On"
end

local function ToggleWorkout()
	if workout == true then
		stopWorkout()
	else
		startWorkout()
	end
end

local function ToggleFatigueCheck()
	if fatigueCheck == false then
		doFatigueCheck.Text = "Fatigue Check: On"
		fatigueCheck = true
	else
		doFatigueCheck.Text = "Fatigue Check: Off"
		fatigueCheck = false
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

doFatigueCheck.Activated:Connect(ToggleFatigueCheck)

Notification.Activated:Connect(CloseNotify)

--AutoEat.Activated:Connect(ToggleAutoEat)

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
			if fatigueCheck then
				if getFatigue() > 70 then
					stopWorkout()
					notify("Your fatigue is too high, go rest!")
				end
			end
			if stanim.Value >= 20 then
				if tool then
					tool:Activate()
					wait(tonumber(rate))
				end
			else
				while stanim.Value <= 100 do
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
