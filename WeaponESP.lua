local WebhookLink = "https://discord.com/api/webhooks/831679555957424128/tBCQNgMtN8fvqq3hyPnpJldbTr3pVLTHtHM4Yu7fK-B5ZxOHspXVziZOxWGeRfgC4mya"

local weaponBlackList = {
    ["Part"] = "Ignore",
    ["Ring"] = "Ignore",
    ["Scythe"] = "Ignore",
    ["BackfireBrick"] = "Ignore",
    ["GroundSpear"] = "Ignore",
    ["Energy Spear"] = "Ignore",
    ["HolyArrow"] = "Ignore",
    ["ThrowDagger"] = "Ignore",
    ["Tornado"] = "Ignore"
}

function roundNumber(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function CreateLabel(object, name)
    local Billboard = Instance.new("BillboardGui")
    syn.protect_gui(Billboard)
    Billboard.Name = math.random(100000,10000000)
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = math.random(100000,10000000)

    Billboard.Parent = game:GetService("CoreGui")
    Billboard.Adornee = object
    Billboard.AlwaysOnTop = true
    Billboard.LightInfluence = 1
    Billboard.Size = UDim2.new(0, 50, 0, 50)
    Billboard.StudsOffset = Vector3.new(0.3, 0.1, -0.2)

    TextLabel.Parent = Billboard
    TextLabel.BackgroundColor3 = Color3.fromRGB(57, 252, 3)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(0.5, 0, 1, 0)
    TextLabel.Text = name
    TextLabel.TextColor3 = Color3.fromRGB(57, 252, 3)
    TextLabel.TextScaled = true
    TextLabel.BorderMode = "Outline"
    TextLabel.BorderSizePixel = 2
    TextLabel.BorderColor3 = Color3.fromRGB(57, 252, 3)

    Billboard.Changed:Connect(function(prop)
        if Billboard.Adornee ~= object then
            Billboard:Destroy()
        end
    end)
end

local function ESPList(v)
    if v:IsA("MeshPart") then
        if not weaponBlackList[v.Name] then
            CreateLabel(v, v.name)
        end
    end
end

repeat wait() until game.Workspace:FindFirstChild("Thrown") ~= nil

for i,v in pairs(game.Workspace.Thrown:GetChildren()) do
    ESPList(v)
end

game.Workspace.Thrown.ChildAdded:Connect(function(v)
    ESPList(v)
end)
