local M7Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/M7ilan/M7-UI-Library/main/Source.lua')))()

local Window = M7Lib:Window({
    Name = "M7 UI Library",
    Version = "v1.0.0",
    Logo = "11711400437",
    Color = Color3.fromRGB(50, 200, 100),
    Intro = false
})

local Tab = Window:Tab({
    Name = "Tab"
})

local Section = Tab:Section({
    Name = "Section"
})

local label1 = Section:Label({
    Description = "Description"
})

local paragraph1 = Section:Paragraph({
    Title = "Title",
    Description = "Description"
})

Section:TextBox({
    Name = "Change Label",
    Default = "Text Box",
    Clear = false,
    Callback = function(e)
        label1:Set({
            Description = e
        })
    end
})

Section:Button({
    Name = "Change Paragraph",
    Callback = function()
        paragraph1:Set({
            Title = "Paragraph Title",
            Description = "Paragraph Changed"
        })
    end
})


Section:Button({
    Name = "Button",
    Callback = function()
        print("Button Pressed")
    end
})

Section:Toggle({
    Name = "Toggle",
    Default = false,
    Callback = function(e)
        print(e)
    end
})

Section:KeyBind({
    Name = "KeyBind",
    Default = Enum.KeyCode.M,
    Callback = function(e)
        print(e)
    end
})

Section:Slider({
    Name = "Player Speed",
    Min = 16,
    Max = 100,
    Callback = function(e)
        print(e)
    end
})

Section:TextBox({
    Name = "TextBox",
    Default = "Text Box",
    Clear = true,
    Callback = function(e)
        print(e)
    end
})

Section:ColorPicker({
    Name = "Color Picker",
    Callback = function(e)
        print(e)
    end
})

local dd1 = Section:Dropdown({
    Name = "Difficult",
    Items = {"Easy", "Normal", "Hard"},
    Callback = function(e)
        print(e)
    end
})

Section:Button({
    Name = "Add Item to Dropdown",
    Callback = function()
        dd1:Add({"Extreme", "Impossible"})
    end
})

Section:Button({
    Name = "Remove Item from Dropdown",
    Callback = function()
        dd1:Remove({"Extreme", "Easy"})
    end
})

local ed1 = Section:ElementsDropdown({
    Name = "Elements Dropdown",
})

local label1 = ed1:Label({
    Description = "Description"
})

local paragraph1 = ed1:Paragraph({
    Title = "Title",
    Description = "Description"
})

ed1:Button({
    Name = "Button",
    Callback = function()
        print("Button Pressed!")
    end
})

ed1:Toggle({
    Name = "Toggle",
    Default = false,
    Callback = function(e)
        print(e)
    end
})

ed1:KeyBind({
    Name = "KeyBind",
    Default = Enum.KeyCode.M,
    Callback = function(e)
        print(e)
    end
})

ed1:TextBox({
    Name = "TextBox",
    Default = "Text Box",
    Clear = true,
    Callback = function(e)
        print(e)
    end
})

ed1:ColorPicker({
    Name = "Color Picker",
    Callback = function(e)
        print(e)
    end
})

Section:Button({
    Name = "Notification",
    Callback = function()
        M7Lib:Notify({
            Title = "Title",
            Desctiption = "Desctiption",
            Time = 3
        })
    end
})

Section:Button({
    Name = "Destroy UI",
    Callback = function()
        M7Lib:DestroyUI()
    end
})

local SettingsTab = Window:Tab({
    Name = "Settings"
})

local SettingsSections = SettingsTab:Section({
    Name = "Settings"
})

SettingsSections:Button({
    Name = "Destroy UI",
    Callback = function()
        M7Lib:DestroyUI()
    end
})
