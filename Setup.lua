local M7Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/M7ilan/M7-UI-Library/main/Source.lua')))()
local Window = M7Lib:CreateWindow("Title", "Version", "Logo ID", Color3.fromRGB(50, 200, 100))

--------------------------------------------------

local Tab = Window:CreateTab("Tab")
local Section = Tab:CreateSection("Section")

Section:Label("Label")
Section:Button("Button", function()
    print("Button Pressed.")
end)

Section:Toggle("Toggle me", false, function(value)
    print(value)
end)

Section:Dropdown("Difficulty", {"Easy", "Medium", "Hard"}, function(Difficulty)
    print(Difficulty)
end)

Section:KeyBind("Print KeyBind", Enum.KeyCode.M, function(input)
    print(tostring(input).." Keybind Pressed.")
end)

Section:Slider("Speed", 100, 16, function(value)
    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = value
end)

--------------------------------------------------

local SettingsTab = Window:CreateTab("Settings")
local SettingsSection = SettingsTab:CreateSection("Settings")

SettingsSection:Button("Destroy UI", function()
    M7Lib:DestroyUI()
end)