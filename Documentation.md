# M7 UI Library 
A Documentation of **[`M7 UI Library`](https://github.com/M7/M7-UI-Library)**.

## Call the Library
```lua
local M7Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/M7ilan/M7-UI-Library/main/Source.lua')))()
```

## Create Window
```lua
local Window = M7Lib:CreateWindow("Title", "Version", "Logo ID", "Theme")
```

## Create Tab
```lua
local Tab = Window:CreateTab("Tab Name")
```

## Create Section
```lua
local Section = Tab:CreateSection("Section Name")
```

## Create Label
```lua
Section:Label("Label")
```

## Create Button
```lua
Section:Button("Button", function()
    print("Button Pressed.")
end)
```

## Create Toggle
```lua
Section:Toggle("Toggle me", false, function(value)
    print(value)
end)
```

## Create Dropdown
```lua
Section:Dropdown("Difficulty", {"Easy", "Medium", "Hard"}, function(Difficulty)
    print(Difficulty)
end)
```

## Create Keybind
```lua
Section:KeyBind("Print KeyBind", Enum.KeyCode.M, function(input)
    print("Keybind Pressed.")
end)
```

## Create Slider
```lua
Section:Slider("Speed", 100, 16, function(value)
    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = value
end)
```

## Destroy UI
```lua
M7Lib:DestroyUI()
```
