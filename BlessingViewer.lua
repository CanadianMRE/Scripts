local player = game:GetService("Players").LocalPlayer
repeat wait() until player.Character ~= nil
local character = player.Character
local blessingsFolder = character:WaitForChild("Blessings")
local blessings = blessingsFolder:GetChildren()

local ScreenGui = Instance.new("ScreenGui")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Frame = Instance.new("Frame")
syn.protect_gui(Frame)
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 204, 0)
Frame.BackgroundTransparency = 0.500
Frame.Position = UDim2.new(0.864957273, 0, 0.444881886, 0)
Frame.Size = UDim2.new(0, 132, 0, 248)

local Blessing1 = Instance.new("TextLabel")
syn.protect_gui(Blessing1)
Blessing1.Name = "Blessing1"
Blessing1.Parent = Frame
Blessing1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blessing1.BackgroundTransparency = 1.000
Blessing1.Position = UDim2.new(0.0075757578, 0, 0.177419364, 0)
Blessing1.Size = UDim2.new(0, 131, 0, 50)
Blessing1.Font = Enum.Font.SourceSans
Blessing1.Text = "Blessing"
Blessing1.TextColor3 = Color3.fromRGB(0, 0, 0)
Blessing1.TextSize = 14.000

local Blessing4 = Instance.new("TextLabel")
syn.protect_gui(Blessing4)
Blessing4.Name = "Blessing4"
Blessing4.Parent = Frame
Blessing4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blessing4.BackgroundTransparency = 1.000
Blessing4.Position = UDim2.new(0.0075757578, 0, 0.793676555, 0)
Blessing4.Size = UDim2.new(0, 131, 0, 50)
Blessing4.Font = Enum.Font.SourceSans
Blessing4.Text = "Blessing"
Blessing4.TextColor3 = Color3.fromRGB(0, 0, 0)
Blessing4.TextSize = 14.000

local Blessing3 = Instance.new("TextLabel")
syn.protect_gui(Blessing3)
Blessing3.Name = "Blessing3"
Blessing3.Parent = Frame
Blessing3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blessing3.BackgroundTransparency = 1.000
Blessing3.Position = UDim2.new(0.0075757578, 0, 0.588257432, 0)
Blessing3.Size = UDim2.new(0, 131, 0, 50)
Blessing3.Font = Enum.Font.SourceSans
Blessing3.Text = "Blessing"
Blessing3.TextColor3 = Color3.fromRGB(0, 0, 0)
Blessing3.TextSize = 14.000

local Blessing2 = Instance.new("TextLabel")
syn.protect_gui(Blessing2)
Blessing2.Name = "Blessing2"
Blessing2.Parent = Frame
Blessing2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blessing2.BackgroundTransparency = 1.000
Blessing2.Position = UDim2.new(0.0075757578, 0, 0.382838458, 0)
Blessing2.Size = UDim2.new(0, 131, 0, 50)
Blessing2.Font = Enum.Font.SourceSans
Blessing2.Text = "Blessing"
Blessing2.TextColor3 = Color3.fromRGB(0, 0, 0)
Blessing2.TextSize = 14.000

local Blessings = Instance.new("TextLabel")
syn.protect_gui(Blessings)
Blessings.Name = "Blessings"
Blessings.Parent = Frame
Blessings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blessings.BackgroundTransparency = 1.000
Blessings.Position = UDim2.new(0.0075757578, 0, -0.0241935402, 0)
Blessings.Size = UDim2.new(0, 131, 0, 50)
Blessings.Font = Enum.Font.SourceSans
Blessings.Text = "Blessing"
Blessings.TextColor3 = Color3.fromRGB(0, 0, 0)
Blessings.TextSize = 14.000

if blessings[1] then
	Blessing1.Text = blessings[1].Name
end
if blessings[2] then
	Blessing2.Text = blessings[2].Name
end
if blessings[3] then
	Blessing3.Text = blessings[3].Name
end
if blessings[4] then
	Blessing4.Text = blessings[4].Name
end

wait("10")
ScreenGui:Destroy()
