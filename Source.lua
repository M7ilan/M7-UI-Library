local M7ilanLib = {
    Connections = {}
}

local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local UIS = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()
local viewPort = workspace.CurrentCamera.ViewportSize

local M7ilanUI = Instance.new("ScreenGui")
M7ilanUI.Name = "M7ilanUI"

if syn then
    syn.protect_gui(M7ilanUI)
    M7ilanUI.Parent = game:GetService("CoreGui")
else
    M7ilanUI.Parent = gethui() or game:GetService("CoreGui")
end

if gethui then
    for _, v in ipairs(gethui():GetChildren()) do
        if v.Name == M7ilanUI.Name and v ~= M7ilanUI then
            v:Destroy()
        end
    end
else
    for _, v in ipairs(game.CoreGui:GetChildren()) do
        if v.Name == M7ilanUI.Name and v ~= M7ilanUI then
            v:Destroy()
        end
    end
end

function M7ilanLib:IsRunning()
    if gethui then
        return M7ilanUI.Parent == gethui()
    else
        return M7ilanUI.Parent == game:GetService("CoreGui")
    end
end

local function AddConnection(Signal, Function)
    if (not M7ilanLib:IsRunning()) then
        return
    end
    local SignalConnect = Signal:Connect(Function)
    table.insert(M7ilanLib.Connections, SignalConnect)
    return SignalConnect
end

task.spawn(function()
    while (M7ilanLib:IsRunning()) do
        task.wait()
    end
    
    for _, Connection in pairs(M7ilanLib.Connections) do
        Connection:Disconnect()
    end
end)

function M7ilanLib:CreateWindow(WindowName: string, WindowVersion: string, WindowLogo: string, CustomTheme: Color3)
    --
    WindowName = WindowName or "M7 UI Lib (Beta)"
    WindowVersion = WindowVersion or game.Players.LocalPlayer.Name
    WindowLogo = WindowLogo or ""
    CustomTheme = CustomTheme or Color3.fromRGB(50, 200, 100)
    --
    
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local LeftSideHolder = Instance.new("Frame")
    local UICorner_1 = Instance.new("UICorner")
    local CloseHolder = Instance.new("Frame")
    local UIPadding = Instance.new("UIPadding")
    local KeyBindFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local KeyBindText = Instance.new("TextLabel")
    local KeyBindButton = Instance.new("TextButton")
    local CloseText = Instance.new("TextLabel")
    local HeaderHolder = Instance.new("Frame")
    local UIPadding_2 = Instance.new("UIPadding")
    local Content = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Version = Instance.new("TextLabel")
    local Logo = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local LogoImage = Instance.new("ImageLabel")
    local Hide = Instance.new("Frame")
    local TabsHolder = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding_3 = Instance.new("UIPadding")
    local RightSideHolder = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local Hide_2 = Instance.new("Frame")
    local PagesHolder = Instance.new("Frame")
    local DropShadow = Instance.new("ImageLabel")

    M7ilanUI.Parent = game:GetService("CoreGui")
    M7ilanUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    M7ilanUI.IgnoreGuiInset = true

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = M7ilanUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.fromOffset((viewPort.X / 2) - (MainFrame.Size.X.Offset / 2), (viewPort.Y / 2) - (MainFrame.Size.Y.Offset / 2))

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    LeftSideHolder.Name = "LeftSideHolder"
    LeftSideHolder.Parent = MainFrame
    LeftSideHolder.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
    LeftSideHolder.BorderSizePixel = 0
    LeftSideHolder.Size = UDim2.new(0, 200, 1, 0)
    LeftSideHolder.ClipsDescendants = true

    -- Draggable
    local dragToggle
    local mouseStart
    local frameStart
    local function updateInput(input)
        local mouseEnd = input.Position - mouseStart
        local position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + mouseEnd.X, frameStart.Y.Scale, frameStart.Y.Offset + mouseEnd.Y)
        game:GetService('TweenService'):Create(MainFrame, TweenInfo.new(0.01), {Position = position}):Play()
    end

    AddConnection(LeftSideHolder.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            mouseStart = input.Position
            frameStart = MainFrame.Position

            AddConnection(input.Changed, function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    AddConnection(UIS.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragToggle then
                updateInput(input)
            end
        end
    end)
    --

    UICorner_1.CornerRadius = UDim.new(0, 10)
    UICorner_1.Parent = LeftSideHolder

    CloseHolder.Name = "CloseHolder"
    CloseHolder.Parent = LeftSideHolder
    CloseHolder.AnchorPoint = Vector2.new(0, 1)
    CloseHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseHolder.BackgroundTransparency = 1.000
    CloseHolder.BorderSizePixel = 0
    CloseHolder.Position = UDim2.new(0, 0, 1, 0)
    CloseHolder.Size = UDim2.new(1, 0, 0, 40)

    UIPadding.Parent = CloseHolder
    UIPadding.PaddingBottom = UDim.new(0, 10)
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingRight = UDim.new(0, 10)
    UIPadding.PaddingTop = UDim.new(0, 10)

    KeyBindFrame.Name = "KeyBindFrame"
    KeyBindFrame.Parent = CloseHolder
    KeyBindFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
    KeyBindFrame.BackgroundTransparency = 1.000
    KeyBindFrame.Size = UDim2.new(1, -60, 1, 0)

    -- KeyBindFrame Hover
    AddConnection(KeyBindFrame.MouseEnter, function()
        TweenService:Create(KeyBindFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
    end)

    AddConnection(KeyBindFrame.MouseLeave, function()
        TweenService:Create(KeyBindFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
    end)
    --

    UICorner_2.CornerRadius = UDim.new(1, 0)
    UICorner_2.Parent = KeyBindFrame

    KeyBindText.Name = "KeyBind"
    KeyBindText.Parent = KeyBindFrame
    KeyBindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyBindText.BackgroundTransparency = 1.000
    KeyBindText.Position = UDim2.new(0, 10, 0, 3)
    KeyBindText.Size = UDim2.new(0, 100, 1, -6)
    KeyBindText.Font = Enum.Font.GothamBold
    KeyBindText.Text = "RightControl"
    KeyBindText.TextColor3 = CustomTheme
    KeyBindText.TextScaled = true
    KeyBindText.TextSize = 14.000
    KeyBindText.TextWrapped = true

    KeyBindButton.Name = "KeyBindButton"
    KeyBindButton.Parent = KeyBindFrame
    KeyBindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyBindButton.BackgroundTransparency = 1.000
    KeyBindButton.BorderSizePixel = 0
    KeyBindButton.Size = UDim2.new(1, 0, 1, 0)
    KeyBindButton.AutoButtonColor = false
    KeyBindButton.Font = Enum.Font.SourceSans
    KeyBindButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    KeyBindButton.TextSize = 14.000
    KeyBindButton.TextTransparency = 1.000

    -- UI Visibility
    local KeyBindVisibility = Enum.KeyCode.RightControl.Name

    KeyBindButton.MouseButton1Click:connect(function()
        KeyBindText.Text = ". . ."
        local a = UIS.InputBegan:wait()
        if a.KeyCode.Name ~= "Unknown" then
            KeyBindText.Text = a.KeyCode.Name
            task.wait()
            KeyBindVisibility = a.KeyCode.Name
        end
    end)

    AddConnection(UIS.InputBegan, function(input)
        if input.KeyCode.Name == KeyBindVisibility then
            if M7ilanUI.Enabled == true then
                M7ilanUI.Enabled = false
            else
                M7ilanUI.Enabled = true
            end
        end
    end)
    --

    CloseText.Name = "CloseText"
    CloseText.Parent = CloseHolder
    CloseText.AnchorPoint = Vector2.new(1, 1)
    CloseText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    CloseText.BackgroundTransparency = 1.000
    CloseText.Position = UDim2.new(1, 0, 1, 0)
    CloseText.Size = UDim2.new(0, 60, 1, 0)
    CloseText.Font = Enum.Font.GothamMedium
    CloseText.Text = "Close"
    CloseText.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseText.TextSize = 14.000

    HeaderHolder.Name = "HeaderHolder"
    HeaderHolder.Parent = LeftSideHolder
    HeaderHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HeaderHolder.BackgroundTransparency = 1.000
    HeaderHolder.BorderSizePixel = 0
    HeaderHolder.Size = UDim2.new(1, 0, -0.100000001, 100)

    UIPadding_2.Parent = HeaderHolder
    UIPadding_2.PaddingBottom = UDim.new(0, 10)
    UIPadding_2.PaddingLeft = UDim.new(0, 10)
    UIPadding_2.PaddingRight = UDim.new(0, 10)
    UIPadding_2.PaddingTop = UDim.new(0, 10)

    Content.Name = "Content"
    Content.Parent = HeaderHolder
    Content.BackgroundColor3 = Color3.fromRGB(54, 57, 62)
    Content.BackgroundTransparency = 1.000
    Content.BorderSizePixel = 0
    Content.Position = UDim2.new(0, 50, 0, 0)
    Content.Size = UDim2.new(0, 130, 0, 40)

    Title.Name = "Title"
    Title.Parent = Content
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Size = UDim2.new(1, 0, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = WindowName
    Title.TextColor3 = CustomTheme
    Title.TextScaled = true
    Title.TextSize = 16.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Version.Name = "Version"
    Version.Parent = Content
    Version.AnchorPoint = Vector2.new(0, 1)
    Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Version.BackgroundTransparency = 1.000
    Version.Position = UDim2.new(0, 0, 1, 0)
    Version.Size = UDim2.new(1, 0, 0, 15)
    Version.Font = Enum.Font.Gotham
    Version.Text = WindowVersion
    Version.TextColor3 = CustomTheme
    Version.TextScaled = true
    Version.TextSize = 16.000
    Version.TextTransparency = 0.500
    Version.TextWrapped = true
    Version.TextXAlignment = Enum.TextXAlignment.Left

    Logo.Name = "Logo"
    Logo.Parent = HeaderHolder
    Logo.BackgroundColor3 = CustomTheme
    Logo.Size = UDim2.new(0, 40, 0, 40)

    UICorner_3.CornerRadius = UDim.new(1, 0)
    UICorner_3.Parent = Logo

    LogoImage.Name = "LogoImage"
    LogoImage.Parent = Logo
    LogoImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    LogoImage.BackgroundTransparency = 1.000
    LogoImage.Size = UDim2.new(1, 0, 1, 0)
    LogoImage.Image = "rbxassetid://"..WindowLogo

    Hide.Name = "Hide"
    Hide.Parent = LeftSideHolder
    Hide.AnchorPoint = Vector2.new(1, 0)
    Hide.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
    Hide.BorderSizePixel = 0
    Hide.Position = UDim2.new(1, 0, 0, 0)
    Hide.Size = UDim2.new(0, 10, 1, 0)
    Hide.ZIndex = 0

    TabsHolder.Name = "TabsHolder"
    TabsHolder.Parent = LeftSideHolder
    TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabsHolder.BackgroundTransparency = 1.000
    TabsHolder.BorderSizePixel = 0
    TabsHolder.Position = UDim2.new(0, 0, 0, 60)
    TabsHolder.Selectable = false
    TabsHolder.Size = UDim2.new(1, 0, 1, -100)
    TabsHolder.ScrollBarThickness = 0

    UIListLayout.Parent = TabsHolder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)

    -- Tabs Scrolling UpdateSize
    AddConnection(TabsHolder.Changed, function()
        TabsHolder.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 40)
    end)
    --

    UIPadding_3.Parent = TabsHolder
    UIPadding_3.PaddingBottom = UDim.new(0, 20)
    UIPadding_3.PaddingLeft = UDim.new(0, 20)
    UIPadding_3.PaddingRight = UDim.new(0, 20)
    UIPadding_3.PaddingTop = UDim.new(0, 20)

    RightSideHolder.Name = "RightSideHolder"
    RightSideHolder.Parent = MainFrame
    RightSideHolder.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
    RightSideHolder.BorderSizePixel = 0
    RightSideHolder.Position = UDim2.new(0, 200, 0, 0)
    RightSideHolder.Size = UDim2.new(1, -200, 1, 0)
    RightSideHolder.ClipsDescendants = true

    UICorner_4.CornerRadius = UDim.new(0, 10)
    UICorner_4.Parent = RightSideHolder

    Hide_2.Name = "Hide"
    Hide_2.Parent = RightSideHolder
    Hide_2.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
    Hide_2.BorderSizePixel = 0
    Hide_2.Size = UDim2.new(0, 10, 1, 0)
    Hide_2.ZIndex = 0

    PagesHolder.Name = "PagesHolder"
    PagesHolder.Parent = RightSideHolder
    PagesHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PagesHolder.BackgroundTransparency = 1.000
    PagesHolder.ClipsDescendants = true
    PagesHolder.Size = UDim2.new(1, 0, 1, 0)

    DropShadow.Name = "DropShadow"
    DropShadow.Parent = MainFrame
    DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropShadow.BackgroundTransparency = 1.000
    DropShadow.BorderSizePixel = 0
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    DropShadow.Size = UDim2.new(1, 47, 1, 47)
    DropShadow.ZIndex = 0
    DropShadow.Image = "rbxassetid://6014261993"
    DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    DropShadow.ImageTransparency = 0.500
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

    function M7ilanLib:DestroyUI()
        M7ilanUI:Destroy()
    end



    local TabsLib = {}

    function TabsLib:CreateTab(TabName)
        --
        TabName = TabName or "Tab"
        --

        local TabButtonFrame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local UIPadding = Instance.new("UIPadding")
        local TabButton = Instance.new("TextButton")
        local TabText = Instance.new("TextLabel")
        local Page = Instance.new("ScrollingFrame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding_1 = Instance.new("UIPadding")

        TabButtonFrame.Name = "TabButtonFrame"
        TabButtonFrame.Parent = TabsHolder
        TabButtonFrame.BackgroundColor3 = Color3.fromRGB(54, 57, 62)
        TabButtonFrame.BackgroundTransparency = 1.000
        TabButtonFrame.Size = UDim2.new(1, 0, 0, 30)
        
        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = TabButtonFrame
        
        UIPadding.Parent = TabButtonFrame
        UIPadding.PaddingBottom = UDim.new(0, 5)
        UIPadding.PaddingLeft = UDim.new(0, 10)
        UIPadding.PaddingRight = UDim.new(0, 10)
        UIPadding.PaddingTop = UDim.new(0, 5)
        
        TabButton.Name = "TabButton"
        TabButton.Parent = TabButtonFrame
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Position = UDim2.new(0, -10, 0, -5)
        TabButton.Size = UDim2.new(1, 20, 1, 10)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = ""
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.TextSize = 1.000
        TabButton.TextStrokeTransparency = 0.000
        TabButton.TextTransparency = 1.000
        
        TabText.Name = "TabText"
        TabText.Parent = TabButtonFrame
        TabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabText.BackgroundTransparency = 1.000
        TabText.Size = UDim2.new(1, 0, 1, 0)
        TabText.Font = Enum.Font.GothamMedium
        TabText.Text = TabName
        TabText.TextColor3 = CustomTheme
        TabText.TextScaled = true
        TabText.TextSize = 20.000
        TabText.TextWrapped = true
        
        Page.Name = TabName.." Page"
        Page.Parent = PagesHolder
        Page.Active = true
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.ScrollBarThickness = 0
        
        UIListLayout.Parent = Page
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)
        
        UIPadding_1.Parent = Page
        UIPadding_1.PaddingBottom = UDim.new(0, 10)
        UIPadding_1.PaddingLeft = UDim.new(0, 20)
        UIPadding_1.PaddingRight = UDim.new(0, 20)
        UIPadding_1.PaddingTop = UDim.new(0, 10)
        
        -- Pages Manager
        for _, v in pairs(PagesHolder:GetChildren()) do
            v.Visible = false
        end
        AddConnection(TabButton.Activated, function()
            for _, v in pairs(PagesHolder:GetChildren()) do
                v.Visible = false
            end
            Page.Visible = true
        end)

        AddConnection(UIListLayout.Changed, function() -- Page Scrolling UpdateSize
            Page.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 20)
        end)
        --
        
        -- Tab Click
        AddConnection(TabButton.MouseButton1Down, function()
            TweenService:Create(TabButtonFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
        end)

        AddConnection(TabButton.MouseButton1Up, function()
            TweenService:Create(TabButtonFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
            for _, v in pairs(TabsHolder:GetDescendants()) do
                if v:IsA("TextLabel") then
                    TweenService:Create(v, tweenInfo, {TextTransparency = 0.8}):Play()
                end
            end
            TweenService:Create(TabText, tweenInfo, {TextTransparency = 0}):Play()
        end)
        --
        
        -- Tab Hover
        AddConnection(TabButtonFrame.MouseEnter, function()
            TweenService:Create(TabButtonFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
        end)

        AddConnection(TabButtonFrame.MouseLeave, function()
            TweenService:Create(TabButtonFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
        end)
        --

        
        
        local SectionsLib = {}
        
        function SectionsLib:CreateSection(SectionName)
            --
            SectionName = SectionName or "Section"
            --
            
            local SectionFrame = Instance.new("Frame")
            local UIStroke = Instance.new("UIStroke")
            local UIPadding = Instance.new("UIPadding")
            local UICorner = Instance.new("UICorner")
            local ItemsFrame = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            local SectionButton = Instance.new("TextButton")
            local SectionImage = Instance.new("ImageLabel")
            local SectionText = Instance.new("TextLabel")
            
            SectionFrame.Name = SectionName.." Section"
            SectionFrame.Parent = Page
            SectionFrame.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
            SectionFrame.ClipsDescendants = true
            SectionFrame.Size = UDim2.new(1, 0, 0, 40)

            UIStroke.Parent = SectionFrame
            UIStroke.Color = CustomTheme
            UIStroke.Transparency = 1
            UIStroke.Thickness = 3
            
            UIPadding.Parent = SectionFrame
            UIPadding.PaddingBottom = UDim.new(0, 10)
            UIPadding.PaddingLeft = UDim.new(0, 10)
            UIPadding.PaddingRight = UDim.new(0, 10)
            UIPadding.PaddingTop = UDim.new(0, 5)
            
            UICorner.Parent = SectionFrame

            ItemsFrame.Name = "ItemsFrame"
            ItemsFrame.Parent = SectionFrame
            ItemsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ItemsFrame.BackgroundTransparency = 1
            ItemsFrame.Position = UDim2.new(0, 0, 0, 40)
            ItemsFrame.Visible = true
            
            UIListLayout.Parent = ItemsFrame
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 10)
            
            SectionButton.Name = "SectionButton"
            SectionButton.Parent = SectionFrame
            SectionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionButton.BackgroundTransparency = 1.000
            SectionButton.Position = UDim2.new(0, -10, 0, -5)
            SectionButton.Size = UDim2.new(1, 20, 0, 40)
            SectionButton.Font = Enum.Font.SourceSans
            SectionButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SectionButton.TextSize = 1.000
            SectionButton.TextStrokeTransparency = 0.000
            SectionButton.TextTransparency = 1.000
            
            SectionImage.Parent = SectionFrame
            SectionImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionImage.BackgroundTransparency = 1.000
            SectionImage.BorderSizePixel = 0
            SectionImage.Position = UDim2.new(1, -25, 0, 0)
            SectionImage.Size = UDim2.new(0, 30, 0, 30)
            SectionImage.ImageColor3 = CustomTheme
            SectionImage.Image = "rbxassetid://11585934208"
            
            SectionText.Parent = SectionFrame
            SectionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionText.BackgroundTransparency = 1.000
            SectionText.Position = UDim2.new(0, 0, 0, 5)
            SectionText.Size = UDim2.new(1, -30, 0, 20)
            SectionText.Font = Enum.Font.GothamMedium
            SectionText.Text = SectionName
            SectionText.TextColor3 = CustomTheme
            SectionText.TextScaled = true
            SectionText.TextSize = 20.000
            SectionText.TextWrapped = true
            SectionText.TextXAlignment = Enum.TextXAlignment.Left
            
            -- Section Manager
            AddConnection(UIListLayout.Changed, function() -- ItemsFrame UpdateSize
                ItemsFrame.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y)
            end)

            local Dropped = false
            AddConnection(SectionButton.Activated, function()
                if SectionFrame.Size == UDim2.new(1, 0, 0, 40) and not Dropped then
                    SectionFrame:TweenSize(UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 55), "Out", "Quint", 0.5)
                    TweenService:Create(SectionImage, tweenInfo, {Rotation = SectionImage.Rotation + 180}):Play()

                    task.wait(0.5)
                    Dropped = true
                elseif SectionFrame.Size == UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 55) and Dropped then
                    SectionFrame:TweenSize(UDim2.new(1, 0, 0, 40), "Out", "Quint", 0.5)
                    TweenService:Create(SectionImage, tweenInfo, {Rotation = SectionImage.Rotation + 180}):Play()

                    task.wait(0.5)
                    SectionImage.Rotation = 0
                    Dropped = false
                end
            end)

            AddConnection(UIListLayout.Changed, function(property) -- ItemsFrame UpdateSize
                if Dropped and property == "AbsoluteContentSize" then
                    SectionFrame.Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 55)
                end
            end)

            AddConnection(SectionFrame.MouseEnter, function()
                TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
            end)
            AddConnection(SectionFrame.MouseLeave, function()
                TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
            end)
            --



            local ItemsLib = {}
            
            function ItemsLib:Button(ButtonName, Callback)
                --
                ButtonName = ButtonName or "Button"
                Callback = Callback or function() end
                --
                
                local ButtonFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local ButtonText = Instance.new("TextLabel")
                local ButtonItem = Instance.new("TextButton")
                
                ButtonFrame.Name = "Button Item"
                ButtonFrame.Parent = ItemsFrame
                ButtonFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                ButtonFrame.BackgroundTransparency = 0.8
                ButtonFrame.Size = UDim2.new(1, 0, 0, 40)

                UICorner.Parent = ButtonFrame

                ButtonText.Parent = ButtonFrame
                ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonText.BackgroundTransparency = 1.000
                ButtonText.TextTransparency = 0.5
                ButtonText.Position = UDim2.new(0, 0, 0, 10)
                ButtonText.Size = UDim2.new(1, 0, 1, -20)
                ButtonText.Font = Enum.Font.GothamMedium
                ButtonText.Text = ButtonName
                ButtonText.TextColor3 = CustomTheme
                ButtonText.TextScaled = true
                ButtonText.TextSize = 14.000
                ButtonText.TextWrapped = true

                ButtonItem.Name = "Button"
                ButtonItem.Parent = ButtonFrame
                ButtonItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonItem.BackgroundTransparency = 1.000
                ButtonItem.Size = UDim2.new(1, 0, 1, 0)
                ButtonItem.Font = Enum.Font.SourceSans
                ButtonItem.TextColor3 = Color3.fromRGB(0, 0, 0)
                ButtonItem.TextSize = 14.000
                ButtonItem.TextTransparency = 1.000


                -- Button Manager
                AddConnection(ButtonFrame.MouseEnter, function()
                    TweenService:Create(ButtonFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(ButtonText, tweenInfo, {TextTransparency = 0}):Play()
                end)

                AddConnection(ButtonFrame.MouseLeave, function()
                    TweenService:Create(ButtonFrame, tweenInfo, {BackgroundTransparency = 0.8}):Play()
                    TweenService:Create(ButtonText, tweenInfo, {TextTransparency = 0.5}):Play()
                end)

                AddConnection(ButtonItem.MouseButton1Down, function()
                    TweenService:Create(ButtonFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
                end)
                
                AddConnection(ButtonItem.MouseButton1Up, function()
                    TweenService:Create(ButtonFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                end)

                AddConnection(ButtonItem.Activated, function()
                    Callback()
                end)
                --
            
            end

            function ItemsLib:Toggle(ToggleName, Callback)
                --
                ToggleName = ToggleName or "Toggle"
                Callback = Callback or function() end
                --
            
                local ToggleFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local ToggleText = Instance.new("TextLabel")
                local ToggleButton = Instance.new("TextButton")
                local UIPadding = Instance.new("UIPadding")
                local ToggleImage = Instance.new("ImageLabel")
                local UICorner_1 = Instance.new("UICorner")
                local UIStroke = Instance.new("UIStroke")
            
                ToggleFrame.Name = "Toggle Item"
                ToggleFrame.Parent = ItemsFrame
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
                ToggleFrame.BackgroundTransparency = 0.8
            
                UICorner.Parent = ToggleFrame
                
                ToggleText.Parent = ToggleFrame
                ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.BackgroundTransparency = 1.000
                ToggleText.Position = UDim2.new(0, 30, 0, 0)
                ToggleText.Size = UDim2.new(1, -30, 1, 0)
                ToggleText.Font = Enum.Font.GothamMedium
                ToggleText.Text = ToggleName
                ToggleText.TextColor3 = CustomTheme
                ToggleText.TextScaled = true
                ToggleText.TextSize = 14.000
                ToggleText.TextTransparency = 0.5
                ToggleText.TextWrapped = true
                ToggleText.TextXAlignment = Enum.TextXAlignment.Left
            
                ToggleButton.Name = "ToggleButton"
                ToggleButton.Parent = ToggleFrame
                ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleButton.BackgroundTransparency = 1.000
                ToggleButton.Position = UDim2.new(0, -10, 0, -10)
                ToggleButton.Size = UDim2.new(1, 20, 1, 20)
                ToggleButton.Font = Enum.Font.SourceSans
                ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ToggleButton.TextSize = 14.000
                ToggleButton.TextTransparency = 1.000
            
                UIPadding.Parent = ToggleFrame
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
                
                ToggleImage.Parent = ToggleFrame
                ToggleImage.BackgroundColor3 = CustomTheme
                ToggleImage.BackgroundTransparency = 1.000
                ToggleImage.Size = UDim2.new(0, 20, 0, 20)
                ToggleImage.ImageTransparency = 1.000
            
                UICorner_1.CornerRadius = UDim.new(0, 3)
                UICorner_1.Parent = ToggleImage
            
                UIStroke.Parent = ToggleImage
                UIStroke.Color = CustomTheme
                UIStroke.Thickness = 3
                UIStroke.Transparency = 0.5
            
                local on = false
                local ToggleDelay = false
                AddConnection(ToggleButton.MouseButton1Click, function()
                    if not ToggleDelay then
                        ToggleDelay = true
                        on = not on
                        Callback(on)
                        if on then
                            TweenService:Create(ToggleImage, tweenInfo, {ImageTransparency = 0, BackgroundTransparency = 0}):Play()
                        else
                            TweenService:Create(ToggleImage, tweenInfo, {ImageTransparency = 1, BackgroundTransparency = 1}):Play()
                        end
                        task.wait(0.5)
                        ToggleDelay = false
                    end
                end)
            
                AddConnection(ToggleButton.MouseButton1Down, function()
                    ToggleText:TweenPosition(UDim2.fromOffset(35, 0), "Out", "Linear", 0.1, true)
                    ToggleImage:TweenPosition(UDim2.fromOffset(5, 0), "Out", "Linear", 0.1, true)
                end)
            
                AddConnection(ToggleButton.MouseButton1Up, function()
                    ToggleText:TweenPosition(UDim2.fromOffset(30, 0), "Out", "Linear", 0.1, true)
                    ToggleImage:TweenPosition(UDim2.fromOffset(0, 0), "Out", "Linear", 0.1, true)
                end)
            
                AddConnection(ToggleFrame.MouseEnter, function()
                    TweenService:Create(ToggleFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(ToggleText, tweenInfo, {TextTransparency = 0}):Play()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                    if on then
                        TweenService:Create(ToggleImage, tweenInfo, {BackgroundTransparency = 0}):Play()
                    end
                end)
                
                AddConnection(ToggleFrame.MouseLeave, function()
                    TweenService:Create(ToggleFrame, tweenInfo, {BackgroundTransparency = 0.8}):Play()
                    TweenService:Create(ToggleText, tweenInfo, {TextTransparency = 0.5}):Play()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0.5}):Play()
                    if on then
                        TweenService:Create(ToggleImage, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    end
                end)
            
            end

            function ItemsLib:Label(LabelName)
                local LabelFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
            
                LabelFrame.Name = "Label Item"
                LabelFrame.Parent = ItemsFrame
                LabelFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                LabelFrame.BackgroundTransparency = 0.8
                LabelFrame.Size = UDim2.new(1, 0, 0, 40)
            
                UICorner.Parent = LabelFrame
            
                LabelText.Parent = LabelFrame
                LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelText.BackgroundTransparency = 1.000
                LabelText.TextTransparency = 0
                LabelText.Size = UDim2.new(1, 0, 1, 0)
                LabelText.Font = Enum.Font.GothamMedium
                LabelText.Text = LabelName
                LabelText.TextColor3 = CustomTheme
                LabelText.TextSize = 16
                LabelText.TextWrapped = true
            
                UIPadding.Parent = LabelText
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
            
                -- Label Manager
                AddConnection(LabelFrame.MouseEnter, function()
                    TweenService:Create(LabelFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                end)
            
                AddConnection(LabelFrame.MouseLeave, function()
                    TweenService:Create(LabelFrame, tweenInfo, {BackgroundTransparency = 0.8}):Play()
                end)
            
                while LabelText.TextFits == false do
                    LabelFrame.Size = UDim2.new(1, 0, 0, LabelFrame.Size.Y.Offset + 20)
                end
                --
            
            end
                    
            function ItemsLib:KeyBind(KeyBindInfo, DefaultKeyBind, Callback)
                --
                KeyBindInfo = KeyBindInfo or "KeyBind"
                DefaultKeyBind = DefaultKeyBind.Name or Enum.KeyCode.E.Name
                Callback = Callback or function() end
                --
            
                local KeyBindItem = Instance.new("Frame")
                local UIPadding = Instance.new("UIPadding")
                local UICorner = Instance.new("UICorner")
                local KeyBindFrame = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local KeyBindInput = Instance.new("TextButton")
                local UIPadding_2 = Instance.new("UIPadding")
                local KeyBindTextFrame = Instance.new("Frame")
                local KeyBindText = Instance.new("TextLabel")
            
                KeyBindItem.Name = "KeyBind Item"
                KeyBindItem.Parent = ItemsFrame
                KeyBindItem.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                KeyBindItem.BackgroundTransparency = 0.800
                KeyBindItem.Size = UDim2.new(1, 0, 0, 40)
            
                UIPadding.Parent = KeyBindItem
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
            
                UICorner.Parent = KeyBindItem
            
                KeyBindFrame.Name = "KeyBindFrame"
                KeyBindFrame.Parent = KeyBindItem
                KeyBindFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                KeyBindFrame.Size = UDim2.new(0, 100, 1, 0)
            
                UICorner_2.Parent = KeyBindFrame
            
                KeyBindInput.Name = "KeyBindInput"
                KeyBindInput.Parent = KeyBindFrame
                KeyBindInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeyBindInput.BackgroundTransparency = 1.000
                KeyBindInput.Position = UDim2.new(0, 0, 0, 2)
                KeyBindInput.Size = UDim2.new(1, 0, 1, -4)
                KeyBindInput.Font = Enum.Font.GothamMedium
                KeyBindInput.Text = DefaultKeyBind
                KeyBindInput.TextTransparency = 0.5
                KeyBindInput.TextColor3 = CustomTheme
                KeyBindInput.TextScaled = true
                KeyBindInput.TextSize = 14.000
                KeyBindInput.TextWrapped = true
            
                UIPadding_2.Parent = KeyBindInput
                UIPadding_2.PaddingLeft = UDim.new(0, 5)
                UIPadding_2.PaddingRight = UDim.new(0, 5)
            
                KeyBindTextFrame.Name = "KeyBindTextFrame"
                KeyBindTextFrame.Parent = KeyBindItem
                KeyBindTextFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeyBindTextFrame.BackgroundTransparency = 1.000
                KeyBindTextFrame.Position = UDim2.new(0, 110, 0, 0)
                KeyBindTextFrame.Size = UDim2.new(1, -110, 1, 0)
            
                KeyBindText.Name = "KeyBindText"
                KeyBindText.Parent = KeyBindTextFrame
                KeyBindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeyBindText.BackgroundTransparency = 1.000
                KeyBindText.Size = UDim2.new(1, 0, 1, 0)
                KeyBindText.Font = Enum.Font.GothamMedium
                KeyBindText.Text = KeyBindInfo
                KeyBindText.TextTransparency = 0.5
                KeyBindText.TextColor3 = CustomTheme
                KeyBindText.TextScaled = true
                KeyBindText.TextSize = 14.000
                KeyBindText.TextWrapped = true
                KeyBindText.TextXAlignment = Enum.TextXAlignment.Left
            
                AddConnection(KeyBindItem.MouseEnter, function()
                    TweenService:Create(KeyBindItem, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(KeyBindFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
                    TweenService:Create(KeyBindText, tweenInfo, {TextTransparency = 0}):Play()
                    TweenService:Create(KeyBindInput, tweenInfo, {TextTransparency = 0}):Play()
                end)
                
                AddConnection(KeyBindItem.MouseLeave, function()
                    TweenService:Create(KeyBindItem, tweenInfo, {BackgroundTransparency = 0.8}):Play()
                    TweenService:Create(KeyBindFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(KeyBindText, tweenInfo, {TextTransparency = 0.5}):Play()
                    TweenService:Create(KeyBindInput, tweenInfo, {TextTransparency = 0.5}):Play()
                end)
            
                -- KeyBind Manager
                local Key = DefaultKeyBind
                KeyBindInput.MouseButton1Click:connect(function()
                    KeyBindInput.Text = ". . ."
                    local a = UIS.InputBegan:wait()
                    if a.KeyCode.Name ~= "Unknown" then
                        KeyBindInput.Text = a.KeyCode.Name
                        task.wait()
                        Key = a.KeyCode.Name
                    end
                end)
            
                AddConnection(UIS.InputBegan, function(input)
                    if input.KeyCode.Name == Key then
                        Callback(Key)
                    end
                end)
                --
            
            end
                        
            function ItemsLib:Slider(SliderInfo, MaxValue, MinValue, Callback)
                --
                SliderInfo = SliderInfo or "Slider"
                MaxValue = MaxValue or 100
                MinValue = MinValue or 0
                Callback = Callback or function() end
                --
            
                local SliderItem = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local SliderText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local SliderValue = Instance.new("TextLabel")
                local SliderFrame = Instance.new("TextButton")
                local UICorner_1 = Instance.new("UICorner")
                local Slider = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                
                SliderItem.Name = "Slider Item"
                SliderItem.Parent = ItemsFrame
                SliderItem.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                SliderItem.BackgroundTransparency = 0.800
                SliderItem.Size = UDim2.new(1, 0, 0, 50)
            
                UICorner.Parent = SliderItem
                
                SliderText.Name = "SliderText"
                SliderText.Parent = SliderItem
                SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.BackgroundTransparency = 1.000
                SliderText.Position = UDim2.new(0, 5, 0, 0)
                SliderText.Size = UDim2.new(1, -40, 0, 20)
                SliderText.Font = Enum.Font.GothamMedium
                SliderText.Text = SliderInfo
                SliderText.TextColor3 = CustomTheme
                SliderText.TextScaled = true
                SliderText.TextSize = 14.000
                SliderText.TextWrapped = true
                SliderText.TextXAlignment = Enum.TextXAlignment.Left
                SliderText.TextTransparency = 0.5
                
                UIPadding.Parent = SliderItem
                UIPadding.PaddingBottom = UDim.new(0, 5)
                UIPadding.PaddingLeft = UDim.new(0, 5)
                UIPadding.PaddingRight = UDim.new(0, 5)
                UIPadding.PaddingTop = UDim.new(0, 6)
                
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = SliderItem
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(1, -40, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.GothamMedium
                SliderValue.Text = "50"
                SliderValue.TextColor3 = CustomTheme
                SliderValue.TextScaled = true
                SliderValue.TextSize = 14.000
                SliderValue.TextWrapped = true
                SliderValue.TextTransparency = 0.5
                
                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = SliderItem
                SliderFrame.AnchorPoint = Vector2.new(1, 1)
                SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                SliderFrame.Position = UDim2.new(1, 0, 1, 0)
                SliderFrame.Size = UDim2.new(1, 0, 0, 10)
                SliderFrame.AutoButtonColor = false
                SliderFrame.BackgroundTransparency = 0.8
                SliderFrame.TextTransparency = 1
                
                UICorner_1.Parent = SliderFrame
                
                Slider.Name = "Slider"
                Slider.Parent = SliderFrame
                Slider.BackgroundColor3 = CustomTheme
                Slider.Size = UDim2.new(0.5, 0, 1, 0)
                Slider.BackgroundTransparency = 0.5
                
                UICorner_2.Parent = Slider
                
                -- Slider Manager
                local Value
                AddConnection(SliderFrame.MouseButton1Down, function()
                    Value = math.ceil((((tonumber(MaxValue) - tonumber(MinValue)) / SliderFrame.AbsoluteSize.X) * Slider.AbsoluteSize.X) + tonumber(MinValue)) or 0
                    Slider.Size = UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 1, 0)
                        moveconnection = AddConnection(mouse.Move, function()
                        SliderValue.Text = Value
                        Value = math.ceil((((tonumber(MaxValue) - tonumber(MinValue)) / SliderFrame.AbsoluteSize.X) * Slider.AbsoluteSize.X) + tonumber(MinValue))
                        Callback(Value)
                        Slider.Size = UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 1, 0)
                    end)
                        releaseconnection = AddConnection(UIS.InputEnded, function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.ceil((((tonumber(MaxValue) - tonumber(MinValue)) / SliderFrame.AbsoluteSize.X) * Slider.AbsoluteSize.X) + tonumber(MinValue))
                            Slider.Size = UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 1, 0)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            
                AddConnection(SliderItem.MouseEnter, function()
                    TweenService:Create(SliderItem, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(SliderFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
                    TweenService:Create(Slider, tweenInfo, {BackgroundTransparency = 0}):Play()
                    TweenService:Create(SliderText, tweenInfo, {TextTransparency = 0}):Play()
                    TweenService:Create(SliderValue, tweenInfo, {TextTransparency = 0}):Play()
                end)
            
                AddConnection(SliderItem.MouseLeave, function()
                    TweenService:Create(SliderItem, tweenInfo, {BackgroundTransparency = 0.8}):Play()
                    TweenService:Create(SliderFrame, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(Slider, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(SliderText, tweenInfo, {TextTransparency = 0.5}):Play()
                    TweenService:Create(SliderValue, tweenInfo, {TextTransparency = 0.5}):Play()
                end)
                --
            
            end

            function ItemsLib:Dropdown(DropdownInfo, DropdownItems, Callback)
                --
                DropdownInfo = DropdownInfo or "Dropdown"
                DropdownItems = DropdownItems or {}
                Callback = Callback or function () end
                --
                
                local DropdownItem = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local DropdownButton = Instance.new("TextButton")
                local DropdownImage = Instance.new("ImageLabel")
                local DropdownText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local DropdownItemsFrame = Instance.new("Frame")
                local Items = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local SearchBar = Instance.new("Frame")
                local UICorner_1 = Instance.new("UICorner")
                local SearchBox = Instance.new("TextBox")
                local UIPadding_1 = Instance.new("UIPadding")
                
                DropdownItem.Name = "Dropdown Item"
                DropdownItem.Parent = ItemsFrame
                DropdownItem.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                DropdownItem.BackgroundTransparency = 0.8
                DropdownItem.ClipsDescendants = true
                DropdownItem.Size = UDim2.new(1, 0, 0, 40)
                
                UICorner.Parent = DropdownItem
                
                DropdownButton.Name = "DropdownButton"
                DropdownButton.Parent = DropdownItem
                DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownButton.BackgroundTransparency = 1.000
                DropdownButton.Position = UDim2.new(0, -10, 0, -5)
                DropdownButton.Size = UDim2.new(1, 20, 0, 40)
                DropdownButton.Font = Enum.Font.SourceSans
                DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.TextSize = 1.000
                DropdownButton.TextStrokeTransparency = 0.000
                DropdownButton.TextTransparency = 1.000
                
                DropdownImage.Name = "DropdownImage"
                DropdownImage.Parent = DropdownItem
                DropdownImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownImage.BackgroundTransparency = 1.000
                DropdownImage.BorderSizePixel = 0
                DropdownImage.Position = UDim2.new(1, -25, 0, 0)
                DropdownImage.Size = UDim2.new(0, 30, 0, 30)
                DropdownImage.Image = "rbxassetid://11585934208"
                DropdownImage.ImageColor3 = CustomTheme
                
                DropdownText.Name = "DropdownText"
                DropdownText.Parent = DropdownItem
                DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownText.BackgroundTransparency = 1.000
                DropdownText.Position = UDim2.new(0, 0, 0, 5)
                DropdownText.Size = UDim2.new(1, -30, 0, 20)
                DropdownText.Font = Enum.Font.GothamMedium
                DropdownText.Text = DropdownInfo
                DropdownText.TextColor3 = CustomTheme
                DropdownText.TextScaled = true
                DropdownText.TextSize = 20.000
                DropdownText.TextWrapped = true
                DropdownText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = DropdownItem
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 5)
                
                DropdownItemsFrame.Name = DropdownInfo.." Dropdown"
                DropdownItemsFrame.Parent = DropdownItem
                DropdownItemsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownItemsFrame.BackgroundTransparency = 1.000
                DropdownItemsFrame.BorderSizePixel = 0
                DropdownItemsFrame.ClipsDescendants = true
                DropdownItemsFrame.Position = UDim2.new(0, 0, 0, 40)
                DropdownItemsFrame.Size = UDim2.new(1, 0, 1, 0)
                
                Items.Name = "Items"
                Items.Parent = DropdownItemsFrame
                Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Items.BackgroundTransparency = 1.000
                Items.Position = UDim2.new(0, 0, 0, 40)
                Items.Size = UDim2.new(1, 0, 1, 0)

                UIListLayout.Parent = Items
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 5)

                SearchBar.Name = "Search Bar"
                SearchBar.Parent = DropdownItemsFrame
                SearchBar.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                SearchBar.Size = UDim2.new(1, 0, 0, 30)

                UICorner_1.CornerRadius = UDim.new(1, 0)
                UICorner_1.Parent = SearchBar

                SearchBox.Name = "Search Box"
                SearchBox.Parent = SearchBar
                SearchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SearchBox.BackgroundTransparency = 1.000
                SearchBox.Size = UDim2.new(1, 0, 1, 0)
                SearchBox.Font = Enum.Font.GothamMedium
                SearchBox.Text = ""
                SearchBox.PlaceholderText = "Search"
                SearchBox.PlaceholderColor3 = Color3.fromRGB(30, 120, 60)
                SearchBox.TextColor3 = Color3.fromRGB(50, 200, 100)
                SearchBox.TextScaled = true
                SearchBox.TextSize = 20.000
                SearchBox.TextWrapped = true
                
                UIPadding_1.Parent = SearchBar
                UIPadding_1.PaddingBottom = UDim.new(0, 5)
                UIPadding_1.PaddingLeft = UDim.new(0, 5)
                UIPadding_1.PaddingRight = UDim.new(0, 5)
                UIPadding_1.PaddingTop = UDim.new(0, 5)

                -- Dropdown Manager
                local Dropped = false
                local function UpdateSizeWhenSearch()
                    if Dropped then
                        DropdownItem:TweenSize(UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 95), "Out", "Quint", 0.5, true)
                    end
                end

                AddConnection(DropdownItem.MouseEnter, function()
                    TweenService:Create(DropdownItem, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                    TweenService:Create(DropdownText, tweenInfo, {TextTransparency = 0}):Play()
                    TweenService:Create(DropdownImage, tweenInfo, {ImageTransparency = 0}):Play()
                end)
            
                AddConnection(DropdownItem.MouseLeave, function()
                    TweenService:Create(DropdownItem, tweenInfo, {BackgroundTransparency = 0.8}):Play()
                    TweenService:Create(DropdownText, tweenInfo, {TextTransparency = 0.5}):Play()
                    TweenService:Create(DropdownImage, tweenInfo, {ImageTransparency = 0.5}):Play()
                end)
                
                for i, v in pairs(DropdownItems) do
                    --
                    v = v or "Item"
                    --
                
                    local DropdownItemFrame = Instance.new("Frame")
                    local DropdownItemButton = Instance.new("TextButton")
                    local UICorner = Instance.new("UICorner")
                    local DropdownItemText = Instance.new("TextLabel")
                    local UIPadding = Instance.new("UIPadding")
                    
                    DropdownItemFrame.Name = v.." Dropdown Item"
                    DropdownItemFrame.Parent = Items
                    DropdownItemFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                    DropdownItemFrame.Size = UDim2.new(1, 0, 0, 30)
                
                    DropdownItemButton.Name = "DropdownItemButton"
                    DropdownItemButton.Parent = DropdownItemFrame
                    DropdownItemButton.Position = UDim2.new(0, -5, 0, -5)
                    DropdownItemButton.Size = UDim2.new(1, 10, 1, 10)
                    DropdownItemButton.AutoButtonColor = false
                    DropdownItemButton.BackgroundTransparency = 1
                    DropdownItemButton.TextTransparency = 1
                    
                    UICorner.Parent = DropdownItemFrame
                    
                    DropdownItemText.Parent = DropdownItemFrame
                    DropdownItemText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    DropdownItemText.BackgroundTransparency = 1.000
                    DropdownItemText.Size = UDim2.new(1, 0, 1, 0)
                    DropdownItemText.Font = Enum.Font.GothamMedium
                    DropdownItemText.Text = v
                    DropdownItemText.TextTransparency = 0.5
                    DropdownItemText.TextColor3 = CustomTheme
                    DropdownItemText.TextScaled = true
                    DropdownItemText.TextSize = 20.000
                    DropdownItemText.TextWrapped = true
                
                    UIPadding.Parent = DropdownItemFrame
                    UIPadding.PaddingBottom = UDim.new(0, 5)
                    UIPadding.PaddingLeft = UDim.new(0, 5)
                    UIPadding.PaddingRight = UDim.new(0, 5)
                    UIPadding.PaddingTop = UDim.new(0, 5)
                
                    AddConnection(DropdownItemFrame.MouseEnter, function()
                        TweenService:Create(DropdownItemText, tweenInfo, {TextTransparency = 0}):Play()
                    end)
                
                    AddConnection(DropdownItemFrame.MouseLeave, function()
                        TweenService:Create(DropdownItemText, tweenInfo, {TextTransparency = 0.5}):Play()
                    end)
                
                    AddConnection(DropdownItemButton.Activated, function()
                        if DropdownItem.Size == UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 95) and Dropped then
                            DropdownText.Text = v
                            Callback(v)
                            DropdownItem:TweenSize(UDim2.new(1, 0, 0, 40), "Out", "Quint", 0.5)
                            TweenService:Create(DropdownImage, tweenInfo, {Rotation = DropdownImage.Rotation + 180}):Play()
                            
                            task.wait(0.5)
                            DropdownImage.Rotation = 0
                            Dropped = false
                            SearchBox.Text = ""
                        end
                    end)
                end
            
                AddConnection(DropdownButton.Activated, function()
                    if DropdownItem.Size == UDim2.new(1, 0, 0, 40) and not Dropped then
                        DropdownItem:TweenSize(UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 95), "Out", "Quint", 0.5)
                        TweenService:Create(DropdownImage, tweenInfo, {Rotation = DropdownImage.Rotation + 180}):Play()
                    
                        task.wait(0.5)
                        Dropped = true
                    elseif DropdownItem.Size == UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 95) and Dropped then
                        DropdownItem:TweenSize(UDim2.new(1, 0, 0, 40), "Out", "Quint", 0.5)
                        TweenService:Create(DropdownImage, tweenInfo, {Rotation = DropdownImage.Rotation + 180}):Play()
                    
                        task.wait(0.5)
                        DropdownImage.Rotation = 0
                        Dropped = false
                    end
                end)
                --
                -- Search Bar Manager
                AddConnection(SearchBox.Changed, function(property)
                    if property == "Text" then
                        local search = string.lower(SearchBox.Text)
                        for i, v in pairs(Items:GetDescendants()) do
                            if v:IsA("TextLabel") then
                                if search ~= "" then
                                    local item = string.lower(v.Text)
                                    if string.find(item, search) then
                                        v.Parent.Visible = true
                                    else
                                        v.Parent.Visible = false
                                    end
                                else
                                    v.Parent.Visible = true
                                end
                            end
                        end
                        UpdateSizeWhenSearch()
                    end
                end)
                --
            end
            return ItemsLib
        end
        return SectionsLib
    end
    return TabsLib
end
return M7ilanLib