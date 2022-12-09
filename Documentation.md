# Documentation
The Documentation of M7 UI Library.

## Call the Library
```lua
local M7Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/M7ilan/M7-UI-Library/main/Source.lua')))()
```

## Create Window
```lua
local Window = M7Lib:Window({
    Name = "M7 UI Library",
    Version = "v1.0.0",
    Logo = "11711400437",
    Color = Color3.fromRGB(50, 200, 100),
    Intro = true
})
```

```
Name = <String> - The Title of the window.
Version = <String> - The version of the window.
Logo = <String> - The Image ID that will displays on the window.
Color = <Color3> - The color of the window.
Intro = <Boolean> - Intro.
```

## Create Tab
```lua
local Tab = Window:Tab({
    Name = "Tab"
})
```

```
Name = <String> - The name of the tab.
```

## Create Section
```lua
local Section = Tab:Section({
    Name = "Section"
})
```
```
Name = <String> - The name of the section.
```

## Create Label
```lua
Section:Label({
    Description = "Description"
})
```

```
Description = <String> - The description of the label.
```

## Create Paragraph
```lua
Section:Paragraph({
    Title = "Title",
    Description = "Description"
})
```

```
Title = <String> - The title of the paragraph.
Description = <String> - The description of the paragraph.
```

## Create Button
```lua
Section:Button({
    Name = "Button",
    Callback = function()
        print("Button Pressed")
    end
})
```

```
Name = <String> - the name of the button.
Callback = <Function> - the function of the button.
```

## Create Toggle
```lua
Section:Toggle({
    Name = "Toggle",
    Default = false,
    Callback = function(e)
        print(e)
    end
})
```

```
Name = <String> - the name of the toggle.
Default = <Boolean> - the default value of the toggle.
Callback = <Function> - the function of the toggle.
```

## Create Keybind
```lua
Section:KeyBind({
    Name = "KeyBind",
    Default = Enum.KeyCode.M,
    Callback = function(e)
        print(e)
    end
})
```

```
Name = <String> - the name of the keybind.
Default = <KeyCode> - the default key of the keybind.
Callback = <Function> - the function of the keybind.
```

## Create Slider
```lua
Section:Slider({
    Name = "Player Speed",
    Min = 16,
    Max = 100,
    Callback = function(e)
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").WalkSpeed = e
    end
})
```

```
Name = <String> - the name of the slider.
Min = <Number> - the min value of the slider.
Max = <Number> - the max value of the slider.
Callback = <Function> - the function of the slider.
```

## Create TextBox
```lua
Section:TextBox({
    Name = "TextBox",
    Default = "Text Box",
    Clear = true,
    Callback = function(e)
        print(e)
    end
})
```

```
Name = <String> - the name of the textBox.
Default = <String> - the default value of the textBox.
Clear = <Boolean> - Clears the value after losing focus.
Callback = <Function> - the function of the textBox.
```

## Create Color Picker
```lua
Section:ColorPicker({
    Name = "Color Picker",
    Callback = function(e)
        print(e)
    end
})
```

```
Name = <String> - the name of the color picker.
Callback = <Function> - the function of the color picker.
```

## Create Dropdown
```lua
local dd1 = Section:Dropdown({
    Name = "Difficult",
    Items = {"Easy", "Normal", "Hard"},
    Callback = function(e)
        print(e)
    end
})
```

```
Name = <String> - the name of the dropdown.
Items = <Table> - the Items of the dropdown.
Callback = <Function> - the function of the dropdown.
```

## Add Item to Dropdown
```lua
Section:Button({
    Name = "Add Item to Dropdown",
    Callback = function()
        dd1:Add({"Extreme", "Impossible"})
    end
})
```

```
Add(<Table>)
```

## Remove Item from Dropdown
```lua
Section:Button({
    Name = "Remove Item from Dropdown",
    Callback = function()
        dd1:Remove({"Extreme", "Easy"})
    end
})
```

```
Remove(<Table>)
```

## Create Elements Dropdown
```lua
local ed1 = Section:ElementsDropdown({
    Name = "Elements Dropdown",
})
```

```
Name = <String> - the name of the elements dropdown.
```

## Add Button to Elements Dropdown
```lua
ed1:Button({
    Name = "Button",
    Callback = function()
        print("Button Pressed!")
    end
})
```
You can add the following elements to the elements dropdown:
- Button
- KeyBind
- Toggle
- Slider
- Label
- Paragraph

## Create Notification
```lua
M7Lib:Notify({
    Title = "Title",
    Desctiption = "Desctiption",
    Time = 3
})
```

```
Title = <String> - the title of the Notify.
Desctiption = <Table> - the desctiption of the Notify.
Time = <Function> - the Time of the Notify.
```

## Destroy UI
```lua
M7Lib:DestroyUI()
```
