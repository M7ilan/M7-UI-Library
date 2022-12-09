local M7Lib = {
    Connections = {}
    -- Callbacks = {}
}

local uis = game:GetService("UserInputService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local viewPort = workspace.CurrentCamera.ViewportSize
local mouse = game.Players.LocalPlayer:GetMouse()

local M7UILibrary = Instance.new("ScreenGui")
M7UILibrary.Name = "M7"
M7UILibrary.IgnoreGuiInset = true

if syn then
    syn.protect_gui(M7UILibrary)
    M7UILibrary.Parent = CoreGui
else
    M7UILibrary.Parent = gethui() or CoreGui
end

if gethui then
    for _, v in ipairs(gethui():GetChildren()) do
        if v.Name == M7UILibrary.Name and v ~= M7UILibrary then
            v:Destroy()
        end
    end
else
    for _, v in ipairs(game.CoreGui:GetChildren()) do
        if v.Name == M7UILibrary.Name and v ~= M7UILibrary then
            v:Destroy()
        end
    end
end

function M7Lib:IsRunning()
    if gethui then
        return M7UILibrary.Parent == gethui()
    else
        return M7UILibrary.Parent == CoreGui
    end
end

local function AddConnection(Signal, Function)
    if (not M7Lib:IsRunning()) then
        return
    end
    local SignalConnect = Signal:Connect(Function)
    table.insert(M7Lib.Connections, SignalConnect)
    return SignalConnect
end

task.spawn(function()
    while (M7Lib:IsRunning()) do
        task.wait()
    end
    
    for _, Connection in pairs(M7Lib.Connections) do
        Connection:Disconnect()
    end

    -- for _, Connection in pairs(M7Lib.Callbacks) do
    --     Connection(false)
    -- end
    -- Callbacks = nil
end)

function M7Lib:Window(WindowConfig)
    WindowConfig = WindowConfig or {}
    WindowConfig.Name = WindowConfig.Name or "M7 UI Library"
    WindowConfig.Version = WindowConfig.Version or "M7ilan#5185"
    WindowConfig.Logo = WindowConfig.Logo or ""
    WindowConfig.Color = WindowConfig.Color or Color3.fromRGB(50, 200, 100)
    if WindowConfig.Intro == nil then
		WindowConfig.Intro = true
	end
    WindowSize = UDim2.new(0, 600, 0, 400)

    local MainFrame = Instance.new("Frame")
	local NotificationsSection = Instance.new("Frame")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local UIPadding_1 = Instance.new("UIPadding")
    local UICorner = Instance.new("UICorner")
    local DropShadow = Instance.new("ImageLabel")
    local LeftSideFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Header = Instance.new("Frame")
    local UIPadding = Instance.new("UIPadding")
    local Title = Instance.new("TextLabel")
    local Version = Instance.new("TextLabel")
    local Logo = Instance.new("ImageButton")
    local UICorner_3 = Instance.new("UICorner")
    local TabsFrame = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding_3 = Instance.new("UIPadding")
    local Footer = Instance.new("Frame")
    local UIPadding_4 = Instance.new("UIPadding")
    local UIKeyBindFrame = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local UIKeyBindTextButton = Instance.new("TextButton")
    local UIPadding_5 = Instance.new("UIPadding")
    local Close = Instance.new("TextLabel")
    local Hide = Instance.new("Frame")
    local RightSideFrame = Instance.new("Frame")
    local PagesHolder = Instance.new("Frame")

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = M7UILibrary
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
    MainFrame.Size = UDim2.new(0, 200, 0, 60)
    MainFrame.Position = UDim2.fromOffset((viewPort.X / 2) - (MainFrame.Size.X.Offset / 2), (viewPort.Y / 2) - (MainFrame.Size.Y.Offset / 2))

    UICorner.Parent = MainFrame

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

    LeftSideFrame.Name = "LeftSideFrame"
    LeftSideFrame.Parent = MainFrame
    LeftSideFrame.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
    LeftSideFrame.ClipsDescendants = true
    LeftSideFrame.Size = UDim2.new(0, 200, 1, 0)

	NotificationsSection.Name = "Notifications Section"
	NotificationsSection.Parent = M7UILibrary
	NotificationsSection.AnchorPoint = Vector2.new(1, 1)
	NotificationsSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NotificationsSection.BackgroundTransparency = 1.000
	NotificationsSection.Position = UDim2.new(1, 0, 1, 0)
	NotificationsSection.Size = UDim2.new(0, 360, 1, 0)
	
	UIListLayout_1.Parent = NotificationsSection
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout_1.Padding = UDim.new(0, 10)
	
	UIPadding_1.Parent = NotificationsSection
	UIPadding_1.PaddingBottom = UDim.new(0, 10)
	UIPadding_1.PaddingLeft = UDim.new(0, 10)
	UIPadding_1.PaddingRight = UDim.new(0, 10)
	UIPadding_1.PaddingTop = UDim.new(0, 10)

    UICorner_2.Parent = LeftSideFrame

    Header.Name = "Header"
    Header.Parent = LeftSideFrame
    Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Header.BackgroundTransparency = 1.000
    Header.Size = UDim2.new(1, 0, 0, 60)

    UIPadding.Parent = Header
    UIPadding.PaddingBottom = UDim.new(0, 10)
    UIPadding.PaddingLeft = UDim.new(0, 10)
    UIPadding.PaddingRight = UDim.new(0, 10)
    UIPadding.PaddingTop = UDim.new(0, 10)

    Title.Name = "Title"
    Title.Parent = Header
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.Position = UDim2.new(0, 50, 0, 0)
    Title.Size = UDim2.new(1, -50, 0, 25)
    Title.Font = Enum.Font.GothamBold
    Title.Text = WindowConfig.Name
    Title.TextColor3 = WindowConfig.Color
    Title.TextScaled = true
    Title.TextSize = 20.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextYAlignment = Enum.TextYAlignment.Top

    Version.Name = "Version"
    Version.Parent = Header
    Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Version.BackgroundTransparency = 1.000
    Version.Position = UDim2.new(0, 50, 0, 25)
    Version.Size = UDim2.new(1, -50, 0, 15)
    Version.Font = Enum.Font.GothamMedium
    Version.Text = WindowConfig.Version
    Version.TextColor3 = WindowConfig.Color
    Version.TextScaled = true
    Version.TextSize = 20.000
    Version.TextTransparency = 0.500
    Version.TextWrapped = true
    Version.TextXAlignment = Enum.TextXAlignment.Left

    Logo.Name = "Logo"
    Logo.Parent = Header
    Logo.BackgroundColor3 = WindowConfig.Color
    Logo.Size = UDim2.new(0, 40, 0, 40)
    Logo.AutoButtonColor = false
    Logo.Image = "rbxassetid://"..WindowConfig.Logo

    UICorner_3.CornerRadius = UDim.new(1, 0)
    UICorner_3.Parent = Logo

    TabsFrame.Name = "TabsFrame"
    TabsFrame.Parent = LeftSideFrame
    TabsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabsFrame.BackgroundTransparency = 1.000
    TabsFrame.Position = UDim2.new(0, 0, 0, 60)
    TabsFrame.Size = UDim2.new(0, 200, 0, 300)
    TabsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabsFrame.ScrollBarThickness = 0

    UIListLayout.Parent = TabsFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)
    
    UIPadding_3.Parent = TabsFrame
    UIPadding_3.PaddingBottom = UDim.new(0, 20)
    UIPadding_3.PaddingLeft = UDim.new(0, 20)
    UIPadding_3.PaddingRight = UDim.new(0, 20)
    UIPadding_3.PaddingTop = UDim.new(0, 20)

    Footer.Name = "Footer"
    Footer.Parent = LeftSideFrame
    Footer.AnchorPoint = Vector2.new(0, 1)
    Footer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Footer.BackgroundTransparency = 1.000
    Footer.Position = UDim2.new(0, 0, 1, 0)
    Footer.Size = UDim2.new(1, 0, 0, 40)
    Footer.Visible = false
    
    UIPadding_4.Parent = Footer
    UIPadding_4.PaddingBottom = UDim.new(0, 10)
    UIPadding_4.PaddingLeft = UDim.new(0, 10)
    UIPadding_4.PaddingRight = UDim.new(0, 10)
    UIPadding_4.PaddingTop = UDim.new(0, 10)
    
    UIKeyBindFrame.Name = "UIKeyBindFrame"
    UIKeyBindFrame.Parent = Footer
    UIKeyBindFrame.BackgroundTransparency = 1
    UIKeyBindFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
    UIKeyBindFrame.Size = UDim2.new(1, -60, 1, 0)

    UICorner_4.Parent = UIKeyBindFrame

    UIKeyBindTextButton.Name = "UIKeyBindTextButton"
    UIKeyBindTextButton.Parent = UIKeyBindFrame
    UIKeyBindTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UIKeyBindTextButton.BackgroundTransparency = 1.000
    UIKeyBindTextButton.Size = UDim2.new(1, 0, 1, 0)
    UIKeyBindTextButton.Font = Enum.Font.GothamBold
    UIKeyBindTextButton.Text = "RightControl"
    UIKeyBindTextButton.TextColor3 = WindowConfig.Color
    UIKeyBindTextButton.TextScaled = true
    UIKeyBindTextButton.TextSize = 14.000

    UIPadding_5.Parent = UIKeyBindTextButton
    UIPadding_5.PaddingBottom = UDim.new(0, 3)
    UIPadding_5.PaddingLeft = UDim.new(0, 5)
    UIPadding_5.PaddingRight = UDim.new(0, 5)
    UIPadding_5.PaddingTop = UDim.new(0, 3)    

    Close.Name = "Close"
    Close.Parent = Footer
    Close.AnchorPoint = Vector2.new(1, 0)
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.Position = UDim2.new(1, -10, 0, 0)
    Close.Size = UDim2.new(1, -130, 1, 0)
    Close.Font = Enum.Font.GothamMedium
    Close.Text = "Close"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.TextSize = 14.000
    Close.TextWrapped = true

    Hide.Name = "Hide"
    Hide.Parent = LeftSideFrame
    Hide.AnchorPoint = Vector2.new(1, 0)
    Hide.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
    Hide.BorderSizePixel = 0
    Hide.Position = UDim2.new(1, 0, 0, 0)
    Hide.Size = UDim2.new(0, 8, 1, 0)
    Hide.Visible = false

    RightSideFrame.Name = "RightSideFrame"
    RightSideFrame.Parent = MainFrame
    RightSideFrame.AnchorPoint = Vector2.new(1, 0)
    RightSideFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    RightSideFrame.BackgroundTransparency = 1.000
    RightSideFrame.ClipsDescendants = true
    RightSideFrame.Position = UDim2.new(1, 0, 0, 0)
    RightSideFrame.Size = UDim2.new(1, -200, 1, 0)
    
    PagesHolder.Name = "PagesHolder"
    PagesHolder.Parent = RightSideFrame
    PagesHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PagesHolder.BackgroundTransparency = 1.000
    PagesHolder.Size = UDim2.new(1, 0, 1, 0)
    
    
    
    local function Minimize()
        local MinimizeSpeed = 0.5
        if MainFrame.Size == WindowSize then
            TweenService:Create(MainFrame, TweenInfo.new(MinimizeSpeed, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, 60)}):Play()
            Hide.Visible = false
            Footer.Visible = false
            PagesHolder.Visible = false
        end

        if MainFrame.Size == UDim2.new(0, 200, 0, 60) then
            TweenService:Create(MainFrame, TweenInfo.new(MinimizeSpeed, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = WindowSize}):Play()
            Footer.Visible = true
            Hide.Visible = true
            PagesHolder.Visible = true
        end
    end

    local function StartUp(e)
        if e then
            Logo.Active = false
            task.wait(2)
            TweenService:Create(MainFrame, tweenInfo, {Position = UDim2.fromOffset((viewPort.X / 2) - (WindowSize.X.Offset / 2), (viewPort.Y / 2) - (WindowSize.Y.Offset / 2))}):Play()
            if MainFrame.Size == WindowSize then
                TweenService:Create(MainFrame, tweenInfo, {Size = UDim2.new(0, 200, 0, 60)}):Play()
                PagesHolder.Visible = false
                task.wait(0.1)
                Footer.Visible = false
                Hide.Visible = false
            elseif MainFrame.Size == UDim2.new(0, 200, 0, 60) then
                TweenService:Create(MainFrame, tweenInfo, {Size = WindowSize}):Play()
                PagesHolder.Visible = true
                task.wait(0.1)
                Footer.Visible = true
                Hide.Visible = true
            end
            while task.wait() do
                if MainFrame.Size == WindowSize then
                    Logo.Active = true
                    break
                end
            end
        else
            MainFrame.Size = WindowSize
            MainFrame.Position = UDim2.fromOffset((viewPort.X / 2) - (WindowSize.X.Offset / 2), (viewPort.Y / 2) - (WindowSize.Y.Offset / 2))
            PagesHolder.Visible = true
            Footer.Visible = true
            Hide.Visible = true
        end
    end

    AddConnection(UIKeyBindFrame.MouseEnter, function()
        TweenService:Create(UIKeyBindFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
    end)

    AddConnection(UIKeyBindFrame.MouseLeave, function()
        TweenService:Create(UIKeyBindFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
    end)

    local UIKeyBind = Enum.KeyCode.RightControl.Name
    AddConnection(UIKeyBindTextButton.Activated, function()
        UIKeyBindTextButton.Text = ". . ."
        UIKeyBind = nil
        local e = uis.InputBegan:wait()
        if e.KeyCode.Name ~= "Unknown" then
            UIKeyBindTextButton.Text = e.KeyCode.Name
            task.wait()
            UIKeyBind = e.KeyCode.Name
        end
    end)

    AddConnection(uis.InputBegan, function(input, e)
        if input.KeyCode.Name == UIKeyBind and not e then
            if M7UILibrary.Enabled == true then
                M7UILibrary.Enabled = false
            else
                M7UILibrary.Enabled = true
            end
        end
    end)

    AddConnection(UIListLayout.Changed, function()
        TabsFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 40)
    end)

    local dragToggle
    local mouseStart
    local mainFrameStart
    local function updateInput(input)
        local mouseEnd = input.Position - mouseStart
        local position = UDim2.new(mainFrameStart.X.Scale, mainFrameStart.X.Offset + mouseEnd.X, mainFrameStart.Y.Scale, mainFrameStart.Y.Offset + mouseEnd.Y)
        game:GetService('TweenService'):Create(MainFrame, TweenInfo.new(0.01), {Position = position}):Play()
    end
    AddConnection(LeftSideFrame.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragToggle = true
            mouseStart = input.Position
            mainFrameStart = MainFrame.Position

            AddConnection(input.Changed, function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)
    AddConnection(uis.InputChanged, function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            if dragToggle then
                updateInput(input)
            end
        end
    end)

    AddConnection(Logo.Activated, function()
        Minimize()
    end)

    function M7Lib:DestroyUI()
        M7UILibrary:Destroy()
    end

    function M7Lib:Notify(NotifyConfig)
        NotifyConfig = NotifyConfig or {}
        NotifyConfig.Title = NotifyConfig.Title or "Title"
        NotifyConfig.Description = NotifyConfig.Description or "Description"
        NotifyConfig.Time = NotifyConfig.Time or 3

        local Notification = Instance.new("Frame")
        local UIStroke = Instance.new("UIStroke")
        local Title = Instance.new("TextLabel")
        local Description = Instance.new("TextLabel")
        local UIPadding = Instance.new("UIPadding")
        local UICorner = Instance.new("UICorner")
        
        Notification.Name = "Notification"
        Notification.Parent = NotificationsSection
        Notification.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
        Notification.Size = UDim2.new(1, 0, 0, 60)
        
        UIStroke.Parent = Notification
        UIStroke.Color = WindowConfig.Color
        UIStroke.Thickness = 2
        UIStroke.Transparency = 0
        
        Title.Name = "Title"
        Title.Parent = Notification
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.Size = UDim2.new(1, 0, 0, 20)
        Title.Font = Enum.Font.GothamBold
        Title.Text = NotifyConfig.Title
        Title.TextColor3 = Color3.fromRGB(50, 200, 100)
        Title.TextScaled = true
        Title.TextSize = 20.000
        Title.TextWrapped = true
        Title.TextXAlignment = Enum.TextXAlignment.Left
        
        Description.Name = "Description"
        Description.Parent = Notification
        Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Description.BackgroundTransparency = 1.000
        Description.Position = UDim2.new(0, 0, 0, 25)
        Description.Size = UDim2.new(1, 0, 1, -25)
        Description.Font = Enum.Font.GothamMedium
        Description.Text = NotifyConfig.Description
        Description.TextColor3 = Color3.fromRGB(50, 200, 100)
        Description.TextSize = 15.000
        Description.TextTransparency = 0.500
        Description.TextWrapped = true
        Description.TextXAlignment = Enum.TextXAlignment.Left
        Description.TextYAlignment = Enum.TextYAlignment.Top
        
        UIPadding.Parent = Notification
        UIPadding.PaddingBottom = UDim.new(0, 10)
        UIPadding.PaddingLeft = UDim.new(0, 10)
        UIPadding.PaddingRight = UDim.new(0, 10)
        UIPadding.PaddingTop = UDim.new(0, 10)
        
        UICorner.Parent = Notification
        
        while Description.TextFits == false do
            Notification.Size = UDim2.new(1, 0, 0, Notification.Size.Y.Offset + 15)
            task.wait()
        end
    
        task.wait(0.15)
        TweenService:Create(Notification, tweenInfo, {BackgroundColor3 = Color3.fromRGB(40, 43, 48)}):Play()
    
        task.wait(NotifyConfig.Time)
        TweenService:Create(Notification, tweenInfo, {Transparency = 1}):Play()
        TweenService:Create(Title, tweenInfo, {TextTransparency = 1}):Play()
        TweenService:Create(Description, tweenInfo, {TextTransparency = 1}):Play()
        TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
    
        task.wait(0.4)
        Notification:Destroy()
    end

    local TabsLib = {}
    function TabsLib:Tab(TabConfig)
        TabConfig = TabConfig or {}
        TabConfig.Name = TabConfig.Name or "Tab"

        local Page = Instance.new("ScrollingFrame")
        local UIPadding_6 = Instance.new("UIPadding")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local TextBox = Instance.new("TextBox")
        local UIPadding_7 = Instance.new("UIPadding")
        local Tab = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local TabTextButton = Instance.new("TextButton")
        local UIPadding = Instance.new("UIPadding")

        Page.Name = "Page"
        Page.Parent = PagesHolder
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.ClipsDescendants = false
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.ScrollBarThickness = 0
        Page.Visible = false
        
        UIPadding_6.Parent = Page
        UIPadding_6.PaddingBottom = UDim.new(0, 10)
        UIPadding_6.PaddingLeft = UDim.new(0, 20)
        UIPadding_6.PaddingRight = UDim.new(0, 20)
        UIPadding_6.PaddingTop = UDim.new(0, 10)
        
        UIListLayout_2.Parent = Page
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 10)
        
        UIPadding_7.Parent = TextBox
        UIPadding_7.PaddingBottom = UDim.new(0, 5)
        UIPadding_7.PaddingLeft = UDim.new(0, 10)
        UIPadding_7.PaddingRight = UDim.new(0, 10)
        UIPadding_7.PaddingTop = UDim.new(0, 5)

        Tab.Name = "Tab"
        Tab.Parent = TabsFrame
        Tab.BackgroundTransparency = 1
        Tab.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
        Tab.Size = UDim2.new(1, 0, 0, 30)
        
        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = Tab
        
        TabTextButton.Name = "TabTextButton"
        TabTextButton.Parent = Tab
        TabTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabTextButton.BackgroundTransparency = 1.000
        TabTextButton.Size = UDim2.new(1, 0, 1, 0)
        TabTextButton.Font = Enum.Font.GothamMedium
        TabTextButton.Text = TabConfig.Name
        TabTextButton.TextColor3 = WindowConfig.Color
        TabTextButton.TextScaled = true
        
        UIPadding.Parent = TabTextButton
        UIPadding.PaddingBottom = UDim.new(0, 5)
        UIPadding.PaddingLeft = UDim.new(0, 5)
        UIPadding.PaddingRight = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)

        
        AddConnection(Tab.MouseEnter, function()
            TweenService:Create(Tab, tweenInfo, {BackgroundTransparency = 0.2}):Play()
        end)
        
        AddConnection(Tab.MouseLeave, function()
            TweenService:Create(Tab, tweenInfo, {BackgroundTransparency = 1}):Play()
        end)

        AddConnection(TabTextButton.MouseButton1Down, function()
            TweenService:Create(Tab, tweenInfo, {BackgroundTransparency = 0}):Play()
        end)

        AddConnection(TabTextButton.MouseButton1Up, function()
            TweenService:Create(Tab, tweenInfo, {BackgroundTransparency = 0.2}):Play()
        end)

        AddConnection(TabTextButton.Activated, function()
            for _, v in pairs(TabsFrame:GetDescendants()) do
                if v:IsA("TextButton") then
                    TweenService:Create(v, tweenInfo, {TextTransparency = 0.8}):Play()
                end
            end
            TweenService:Create(TabTextButton, tweenInfo, {TextTransparency = 0}):Play()

            for _, v in pairs(PagesHolder:GetChildren()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
                Page.Visible = true
            end
        end)

        AddConnection(UIListLayout_2.Changed, function()
            Page.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 20)
        end)


        local SectionsLib = {}
        function SectionsLib:Section(SectionConfig)
            SectionConfig = SectionConfig or {}
            SectionConfig.Name = SectionConfig.Name or "Section"

            local Section = Instance.new("Frame")
            local UIPadding_7 = Instance.new("UIPadding")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local SectionTitle = Instance.new("TextLabel")
            

            Section.Name = "Section"
            Section.Parent = Page
            Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Section.BackgroundTransparency = 1.000
            Section.ClipsDescendants = true
            Section.Position = UDim2.new(0, 0, 0, 40)
            Section.Size = UDim2.new(1, 0, 0, 0)
            
            UIPadding_7.Parent = Section
            UIPadding_7.PaddingBottom = UDim.new(0, 10)
            UIPadding_7.PaddingLeft = UDim.new(0, 10)
            UIPadding_7.PaddingRight = UDim.new(0, 10)
            UIPadding_7.PaddingTop = UDim.new(0, 10)
            
            UIListLayout_3.Parent = Section
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 6)
            
            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = Section
            SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.BackgroundTransparency = 1.000
            SectionTitle.Size = UDim2.new(1, 0, 0, 18)
            SectionTitle.Font = Enum.Font.GothamMedium
            SectionTitle.Text = SectionConfig.Name
            SectionTitle.TextColor3 = WindowConfig.Color
            SectionTitle.TextScaled = true
            SectionTitle.TextWrapped = true
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left

            AddConnection(UIListLayout_3.Changed, function()
                Section.Size = UDim2.new(1, 0, 0, UIListLayout_3.AbsoluteContentSize.Y + 20)
            end)
            
            
            StartUp(WindowConfig.Intro)
            
            
            local ItemsLib = {}
            function ItemsLib:Button(ButtonConfig, ButtonParent, ButtonBackgroundColor)
                ButtonConfig = ButtonConfig or {}
                ButtonConfig.Name = ButtonConfig.Name or "Button"
                ButtonConfig.Callback = ButtonConfig.Callback or function() end
                ButtonParent = ButtonParent or Section
                ButtonBackgroundColor = ButtonBackgroundColor or Color3.fromRGB(30, 33, 36)
                
                local ButtonItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local ButtonImage = Instance.new("ImageLabel")
                local ButtonText = Instance.new("TextLabel")
                local UIPadding_8 = Instance.new("UIPadding")
                local ButtonButton = Instance.new("TextButton")
                local UICorner_6 = Instance.new("UICorner")
                
                ButtonItem.Name = "ButtonItem"
                ButtonItem.Parent = ButtonParent
                ButtonItem.BackgroundColor3 = ButtonBackgroundColor
                ButtonItem.Size = UDim2.new(1, 0, 0, 40)
                ButtonItem.BackgroundTransparency = 0

                UIStroke.Parent = ButtonItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                ButtonImage.Name = "ButtonImage"
                ButtonImage.Parent = ButtonItem
                ButtonImage.AnchorPoint = Vector2.new(1, 0)
                ButtonImage.BackgroundColor3 = WindowConfig.Color
                ButtonImage.BackgroundTransparency = 1
                ButtonImage.BorderSizePixel = 0
                ButtonImage.Position = UDim2.new(1, -8, 0, 5)
                ButtonImage.Size = UDim2.new(0, 30, 0, 30)
                ButtonImage.Image = "rbxassetid://11711934517"
                ButtonImage.ImageColor3 = WindowConfig.Color
                ButtonImage.ImageTransparency = 0
                
                ButtonText.Name = "ButtonText"
                ButtonText.Parent = ButtonItem
                ButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonText.BackgroundTransparency = 1
                ButtonText.Size = UDim2.new(1, -50, 1, 0)
                ButtonText.Font = Enum.Font.GothamMedium
                ButtonText.Text = ButtonConfig.Name
                ButtonText.TextColor3 = WindowConfig.Color
                ButtonText.TextScaled = true
                ButtonText.TextSize = 14.000
                ButtonText.TextWrapped = true
                ButtonText.TextXAlignment = Enum.TextXAlignment.Left
                ButtonText.TextTransparency = 0
                
                UIPadding_8.Parent = ButtonText
                UIPadding_8.PaddingBottom = UDim.new(0, 10)
                UIPadding_8.PaddingLeft = UDim.new(0, 10)
                UIPadding_8.PaddingRight = UDim.new(0, 10)
                UIPadding_8.PaddingTop = UDim.new(0, 10)
                
                ButtonButton.Name = "ButtonButton"
                ButtonButton.Parent = ButtonItem
                ButtonButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonButton.BackgroundTransparency = 1.000
                ButtonButton.Size = UDim2.new(1, 0, 1, 0)
                ButtonButton.Font = Enum.Font.SourceSans
                ButtonButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ButtonButton.TextSize = 14.000
                ButtonButton.TextTransparency = 1.000
                
                UICorner_6.CornerRadius = UDim.new(0, 10)
                UICorner_6.Parent = ButtonItem

                AddConnection(ButtonItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(ButtonItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)
                
                AddConnection(ButtonButton.MouseButton1Down, function()
                    TweenService:Create(ButtonItem, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                end)
                
                AddConnection(ButtonButton.MouseButton1Up, function()
                    TweenService:Create(ButtonItem, tweenInfo, {BackgroundTransparency = 0}):Play()
                end)

                AddConnection(ButtonButton.Activated, function()
                    ButtonConfig.Callback()
                end)
            end

            
            function ItemsLib:Toggle(ToggleConfig, ToggleParent, ToggleBackgroundColor)
                ToggleConfig = ToggleConfig or {}
                ToggleConfig.Name = ToggleConfig.Name or "Toggle"
                ToggleConfig.Defualt = ToggleConfig.Defualt or false
                ToggleConfig.Callback = ToggleConfig.Callback or function() end
                ToggleParent = ToggleParent or Section
                ToggleBackgroundColor = ToggleBackgroundColor or Color3.fromRGB(30, 33, 36)

                local ToggleItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local ToggleButton = Instance.new("TextButton")
                local ToggleText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local UICorner = Instance.new("UICorner")
                local Switch = Instance.new("Frame")
                local Stroke = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local UIStroke_2 = Instance.new("UIStroke")

                ToggleItem.Name = "ToggleItem"
                ToggleItem.Parent = ToggleParent
                ToggleItem.BackgroundColor3 = ToggleBackgroundColor
                ToggleItem.Size = UDim2.new(1, 0, 0, 40)

                UIStroke.Parent = ToggleItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1

                ToggleButton.Name = "ToggleButton"
                ToggleButton.Parent = ToggleItem
                ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleButton.BackgroundTransparency = 1.000
                ToggleButton.Size = UDim2.new(1, 0, 1, 0)
                ToggleButton.Font = Enum.Font.SourceSans
                ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ToggleButton.TextSize = 14.000
                ToggleButton.TextTransparency = 1.000

                ToggleText.Name = "ToggleText"
                ToggleText.Parent = ToggleItem
                ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleText.BackgroundTransparency = 1.000
                ToggleText.Size = UDim2.new(1, -50, 1, 0)
                ToggleText.Font = Enum.Font.GothamMedium
                ToggleText.Text = ToggleConfig.Name
                ToggleText.TextColor3 = WindowConfig.Color
                ToggleText.TextScaled = true
                ToggleText.TextSize = 14.000
                ToggleText.TextWrapped = true
                ToggleText.TextXAlignment = Enum.TextXAlignment.Left

                UIPadding.Parent = ToggleText
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)

                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = ToggleItem

                Switch.Name = "Switch"
                Switch.Parent = ToggleItem
                Switch.AnchorPoint = Vector2.new(1, 0)
                Switch.BackgroundColor3 = WindowConfig.Color
                Switch.BackgroundTransparency = 1.000
                Switch.BorderSizePixel = 0
                Switch.Position = UDim2.new(1, -13, 0, 10)
                Switch.Size = UDim2.new(0, 20, 0, 20)

                Stroke.Name = "Stroke"
                Stroke.Parent = Switch
                Stroke.BackgroundColor3 = WindowConfig.Color
                Stroke.BackgroundTransparency = 1.000
                Stroke.BorderSizePixel = 0
                Stroke.Size = UDim2.new(0, 20, 0, 20)

                UICorner_2.CornerRadius = UDim.new(0, 5)
                UICorner_2.Parent = Stroke

                UIStroke_2.Parent = Stroke
                UIStroke_2.Color = WindowConfig.Color
                UIStroke_2.Thickness = 3

                AddConnection(ToggleItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(ToggleItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)
                
                AddConnection(ToggleButton.MouseButton1Down, function()
                    TweenService:Create(ToggleItem, tweenInfo, {BackgroundTransparency = 0.5}):Play()
                end)
                local on = ToggleConfig.Defualt
                if on then
                    Switch.BackgroundTransparency = 0
                else
                    Switch.BackgroundTransparency = 1
                end
                AddConnection(ToggleButton.Activated, function()
                    TweenService:Create(ToggleItem, tweenInfo, {BackgroundTransparency = 0}):Play()
                    on = not on
                    ToggleConfig.Callback(on)
                    if on then
                        TweenService:Create(Switch, tweenInfo, {BackgroundTransparency = 0}):Play()
                    else
                        TweenService:Create(Switch, tweenInfo, {BackgroundTransparency = 1}):Play()
                    end
                end)
            end

            function ItemsLib:Slider(SliderConfig, SliderParent, SliderBackgroundColor, SliderFrameBackgroundColor)
                SliderConfig = SliderConfig or {}
                SliderConfig.Name = SliderConfig.Name or "Slider"
                SliderConfig.Min = SliderConfig.Min or 0
                SliderConfig.Max = SliderConfig.Max or 100
                SliderConfig.Callback = SliderConfig.Callback or function() end
                SliderParent = SliderParent or Section
                SliderBackgroundColor = SliderBackgroundColor or Color3.fromRGB(30, 33, 36)
                SliderFrameBackgroundColor = SliderFrameBackgroundColor or Color3.fromRGB(40, 43, 48)

                local SliderItem = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local UIStroke = Instance.new("UIStroke")
                local SliderText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local SliderValue = Instance.new("TextLabel")
                local SliderFrame = Instance.new("TextButton")
                local Slider = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local UICorner_3 = Instance.new("UICorner")
                
                SliderItem.Name = "SliderItem"
                SliderItem.Parent = SliderParent
                SliderItem.BackgroundColor3 = SliderBackgroundColor
                SliderItem.Size = UDim2.new(1, 0, 0, 55)
                
                UIStroke.Parent = SliderItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = SliderItem
                
                SliderText.Name = "SliderText"
                SliderText.Parent = SliderItem
                SliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderText.BackgroundTransparency = 1.000
                SliderText.Size = UDim2.new(1, -50, 0, 20)
                SliderText.Font = Enum.Font.GothamMedium
                SliderText.Text = SliderConfig.Name
                SliderText.TextColor3 = WindowConfig.Color
                SliderText.TextSize = 20.000
                SliderText.TextWrapped = true
                SliderText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = SliderItem
                UIPadding.PaddingBottom = UDim.new(0, 8)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 8)
                
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = SliderItem
                SliderValue.AnchorPoint = Vector2.new(1, 0)
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Position = UDim2.new(1, 0, 0, 0)
                SliderValue.Size = UDim2.new(0, 40, 0, 20)
                SliderValue.Font = Enum.Font.GothamMedium
                SliderValue.Text = tostring((SliderConfig.Max + SliderConfig.Min) / 2)
                SliderValue.TextColor3 = WindowConfig.Color
                SliderValue.TextScaled = true
                SliderValue.TextSize = 20.000
                SliderValue.TextWrapped = true
                SliderValue.TextXAlignment = Enum.TextXAlignment.Right
                
                SliderFrame.Name = "SliderFrame"
                SliderFrame.Parent = SliderItem
                SliderFrame.AnchorPoint = Vector2.new(0, 1)
                SliderFrame.BackgroundColor3 = SliderFrameBackgroundColor
                SliderFrame.Position = UDim2.new(0, 0, 1, 0)
                SliderFrame.Size = UDim2.new(1, 0, 0, 10)
                SliderFrame.TextTransparency = 1
                SliderFrame.AutoButtonColor = false
                
                Slider.Name = "Slider"
                Slider.Parent = SliderFrame
                Slider.AnchorPoint = Vector2.new(0, 1)
                Slider.BackgroundColor3 = WindowConfig.Color
                Slider.BorderSizePixel = 0
                Slider.Position = UDim2.new(0, 0, 1, 0)
                Slider.Size = UDim2.new(0.5, 0, 0, 10)
                
                UICorner_2.CornerRadius = UDim.new(0, 10)
                UICorner_2.Parent = Slider
                
                UICorner_3.CornerRadius = UDim.new(0, 10)
                UICorner_3.Parent = SliderFrame

                AddConnection(SliderItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(SliderItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)

                local Value
                AddConnection(SliderFrame.MouseButton1Down, function()
                    Value = math.floor((((tonumber(SliderConfig.Max) - tonumber(SliderConfig.Min)) / SliderFrame.AbsoluteSize.X) * Slider.AbsoluteSize.X) + tonumber(SliderConfig.Min)) or 0
                    Slider.Size = UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 1, 0)
                    moveconnection = AddConnection(mouse.Move, function()
                        Value = math.floor((((tonumber(SliderConfig.Max) - tonumber(SliderConfig.Min)) / SliderFrame.AbsoluteSize.X) * Slider.AbsoluteSize.X) + tonumber(SliderConfig.Min))
                        SliderValue.Text = Value
                        SliderConfig.Callback(Value)
                        Slider.Size = UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 1, 0)
                    end)
                    releaseconnection = AddConnection(uis.InputEnded, function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(SliderConfig.Max) - tonumber(SliderConfig.Min)) / SliderFrame.AbsoluteSize.X) * Slider.AbsoluteSize.X) + tonumber(SliderConfig.Min))
                            SliderValue.Text = Value
                            SliderConfig.Callback(Value)
                            Slider.Size = UDim2.new(0, math.clamp(mouse.X - Slider.AbsolutePosition.X, 0, SliderFrame.AbsoluteSize.X), 1, 0)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            end

            function ItemsLib:Label(LabelConfig, LabelParent)
                LabelConfig = LabelConfig or {}
                LabelConfig.Content = LabelConfig.Content or "Content"
                LabelParent = LabelParent or Section

                local LabelItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local UICorner = Instance.new("UICorner")
                local Content = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                
                LabelItem.Name = "LabelItem"
                LabelItem.Parent = LabelParent
                LabelItem.BackgroundColor3 = WindowConfig.Color
                LabelItem.BackgroundTransparency = 0.95
                LabelItem.Size = UDim2.new(1, 0, 0, 40)
                
                UIStroke.Parent = LabelItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = LabelItem
                
                Content.Name = "Content"
                Content.Parent = LabelItem
                Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Content.BackgroundTransparency = 1.000
                Content.Position = UDim2.new(0, 0, 0, 10)
                Content.Size = UDim2.new(1, 0, 1, -20)
                Content.Font = Enum.Font.GothamMedium
                Content.Text = LabelConfig.Content
                Content.TextColor3 = WindowConfig.Color
                Content.TextSize = 20.000
                Content.TextWrapped = true
                Content.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = Content
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                
                while Content.TextFits == false do
                    LabelItem.Size = UDim2.new(1, 0, 0, LabelItem.Size.Y.Offset + 20)
                end

                AddConnection(LabelItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(LabelItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)
            end

            function ItemsLib:Paragraph(ParagraphConfig, ParagraphParent)
                ParagraphConfig = ParagraphConfig or {}
                ParagraphConfig.Title = ParagraphConfig.Title or "Title"
                ParagraphConfig.Content = ParagraphConfig.Content or "Content"
                ParagraphParent = ParagraphParent or Section
                
                local ParagraphItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local UICorner = Instance.new("UICorner")
                local Title = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local Content = Instance.new("TextLabel")
                local UIPadding_2 = Instance.new("UIPadding")
                
                ParagraphItem.Name = "ParagraphItem"
                ParagraphItem.Parent = ParagraphParent
                ParagraphItem.BackgroundColor3 = WindowConfig.Color
                ParagraphItem.BackgroundTransparency = 0.95
                ParagraphItem.Size = UDim2.new(1, 0, 0, 60)
                
                UIStroke.Parent = ParagraphItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = ParagraphItem
                
                Title.Name = "Title"
                Title.Parent = ParagraphItem
                Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title.BackgroundTransparency = 1.000
                Title.Position = UDim2.new(0, 0, 0, 10)
                Title.Size = UDim2.new(1, 0, 0, 20)
                Title.Font = Enum.Font.GothamBold
                Title.Text = ParagraphConfig.Title
                Title.TextColor3 = WindowConfig.Color
                Title.TextSize = 20.000
                Title.TextWrapped = true
                Title.TextScaled = true
                Title.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = Title
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                
                Content.Name = "Content"
                Content.Parent = ParagraphItem
                Content.AnchorPoint = Vector2.new(0, 0)
                Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Content.BackgroundTransparency = 1.000
                Content.Position = UDim2.new(0, 0, 0, 32)
                Content.Size = UDim2.new(1, 0, 1, -42)
                Content.Font = Enum.Font.GothamMedium
                Content.Text = ParagraphConfig.Content
                Content.TextColor3 = WindowConfig.Color
                Content.TextSize = 18.000
                Content.TextTransparency = 0.500
                Content.TextWrapped = true
                Content.TextXAlignment = Enum.TextXAlignment.Left
                Content.TextYAlignment = Enum.TextYAlignment.Top
                
                UIPadding_2.Parent = Content
                UIPadding_2.PaddingLeft = UDim.new(0, 10)
                UIPadding_2.PaddingRight = UDim.new(0, 10)


                while Content.TextFits == false do
                    ParagraphItem.Size = UDim2.new(1, 0, 0, ParagraphItem.Size.Y.Offset + 20)
                end

                AddConnection(ParagraphItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(ParagraphItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)
            end

            function ItemsLib:KeyBind(KeyBindConfig, KeyBindParent, KeyBindBackgroundColor, KeyBindFrameBackgroundColor)
                KeyBindConfig = KeyBindConfig or {}
                KeyBindConfig.Name = KeyBindConfig.Name or "KeyBind"
                KeyBindConfig.Default = KeyBindConfig.Default or Enum.KeyCode.M
                KeyBindConfig.Callback = KeyBindConfig.Callback or function() end
                KeyBindParent = KeyBindParent or Section
                KeyBindBackgroundColor = KeyBindBackgroundColor or Color3.fromRGB(30, 33, 36)
                KeyBindFrameBackgroundColor = KeyBindFrameBackgroundColor or Color3.fromRGB(40, 43, 48)

                local KeyBindItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local KeyBindText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local UICorner = Instance.new("UICorner")
                local KeyBindFrame = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local KeyBindTextButton = Instance.new("TextButton")
                local UIPadding_2 = Instance.new("UIPadding")
                
                KeyBindItem.Name = "KeyBindItem"
                KeyBindItem.Parent = KeyBindParent
                KeyBindItem.BackgroundColor3 = KeyBindBackgroundColor
                KeyBindItem.Size = UDim2.new(1, 0, 0, 40)
                
                UIStroke.Parent = KeyBindItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                KeyBindText.Name = "KeyBindText"
                KeyBindText.Parent = KeyBindItem
                KeyBindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeyBindText.BackgroundTransparency = 1.000
                KeyBindText.Size = UDim2.new(1, -126, 1, 0)
                KeyBindText.Font = Enum.Font.GothamMedium
                KeyBindText.Text = KeyBindConfig.Name
                KeyBindText.TextColor3 = WindowConfig.Color
                KeyBindText.TextScaled = true
                KeyBindText.TextSize = 14.000
                KeyBindText.TextWrapped = true
                KeyBindText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = KeyBindText
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = KeyBindItem
                
                KeyBindFrame.Name = "KeyBindFrame"
                KeyBindFrame.Parent = KeyBindItem
                KeyBindFrame.AnchorPoint = Vector2.new(1, 0)
                KeyBindFrame.BackgroundColor3 = KeyBindFrameBackgroundColor
                KeyBindFrame.Position = UDim2.new(1, -10, 0, 10)
                KeyBindFrame.Size = UDim2.new(0, 106, 0, 20)
                
                UICorner_2.Parent = KeyBindFrame
                
                KeyBindTextButton.Name = "KeyBindTextButton"
                KeyBindTextButton.Parent = KeyBindFrame
                KeyBindTextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeyBindTextButton.BackgroundTransparency = 1.000
                KeyBindTextButton.Size = UDim2.new(1, 0, 1, 0)
                KeyBindTextButton.Font = Enum.Font.GothamBold
                KeyBindTextButton.Text = KeyBindConfig.Default.Name
                KeyBindTextButton.TextColor3 = WindowConfig.Color
                KeyBindTextButton.TextSize = 14.000
                
                UIPadding_2.Parent = KeyBindTextButton
                UIPadding_2.PaddingBottom = UDim.new(0, 3)
                UIPadding_2.PaddingLeft = UDim.new(0, 5)
                UIPadding_2.PaddingRight = UDim.new(0, 5)
                UIPadding_2.PaddingTop = UDim.new(0, 3)

                AddConnection(KeyBindItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(KeyBindItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)

                local KeyBind = KeyBindConfig.Default.Name
                AddConnection(KeyBindTextButton.Activated, function()
                    KeyBindTextButton.Text = ". . ."
                    KeyBind = nil
                    local e = uis.InputBegan:Wait()
                    if e.KeyCode.Name ~= "Unknown" then
                        KeyBindTextButton.Text = e.KeyCode.Name
                        task.wait()
                        KeyBind = e.KeyCode.Name
                    end
                end)

                AddConnection(uis.InputBegan, function(input, e)
                    if input.KeyCode.Name == KeyBind and not e then
                        KeyBindConfig.Callback(KeyBind)
                    end
                end)

                AddConnection(KeyBindTextButton.Changed, function(e)
                    if e == "TextBounds" then
                        TweenService:Create(KeyBindFrame, tweenInfo, {Size = UDim2.new(0, KeyBindTextButton.TextBounds.X + 20, 0, 20)}):Play()
                    end
                end)

                AddConnection(KeyBindFrame.Changed, function(e)
                    if e == "Size" then
                        TweenService:Create(KeyBindText, tweenInfo, {Size = UDim2.new(1, -(KeyBindFrame.Size.X.Offset + 20), 1, 0)}):Play()
                    end
                end)
            end

            function ItemsLib:Dropdown(DropdownConfig)
                DropdownConfig = DropdownConfig or {}
                DropdownConfig.Name = DropdownConfig.Name or "Dropdown"
                DropdownConfig.Items = DropdownConfig.Items or {}
                DropdownConfig.Callback = DropdownConfig.Callback or function() end

                local DropdownItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local DropdownItems = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")
                local DropdownInfo = Instance.new("Frame")
                local DropdownText = Instance.new("TextLabel")
                local UIPadding_2 = Instance.new("UIPadding")
                local DropdownImage = Instance.new("ImageLabel")
                local DropdownButton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local SearchBar = Instance.new("TextBox")
                local UIPadding_3 = Instance.new("UIPadding")
                local UICorner_2 = Instance.new("UICorner")
                
                DropdownItem.Name = "DropdownItem"
                DropdownItem.Parent = Section
                DropdownItem.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
                DropdownItem.ClipsDescendants = true
                DropdownItem.Size = UDim2.new(1, 0, 0, 40)
                
                UIStroke.Parent = DropdownItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                DropdownItems.Name = "DropdownItems"
                DropdownItems.Parent = DropdownItem
                DropdownItems.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownItems.BackgroundTransparency = 1.000
                DropdownItems.Position = UDim2.new(0, 0, 0, 80)
                DropdownItems.Size = UDim2.new(1, 0, 1, -40)
                
                UIListLayout.Parent = DropdownItems
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 5)
                
                UIPadding.Parent = DropdownItems
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                
                DropdownInfo.Name = "DropdownInfo"
                DropdownInfo.Parent = DropdownItem
                DropdownInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownInfo.BackgroundTransparency = 1.000
                DropdownInfo.Size = UDim2.new(1, 0, 0, 40)
                
                DropdownText.Name = "DropdownText"
                DropdownText.Parent = DropdownInfo
                DropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownText.BackgroundTransparency = 1.000
                DropdownText.Size = UDim2.new(1, -50, 0, 40)
                DropdownText.Font = Enum.Font.GothamMedium
                DropdownText.Text = DropdownConfig.Name
                DropdownText.TextColor3 = Color3.fromRGB(50, 200, 100)
                DropdownText.TextScaled = true
                DropdownText.TextSize = 14.000
                DropdownText.TextWrapped = true
                DropdownText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_2.Parent = DropdownText
                UIPadding_2.PaddingBottom = UDim.new(0, 10)
                UIPadding_2.PaddingLeft = UDim.new(0, 10)
                UIPadding_2.PaddingRight = UDim.new(0, 10)
                UIPadding_2.PaddingTop = UDim.new(0, 10)
                
                DropdownImage.Name = "DropdownImage"
                DropdownImage.Parent = DropdownInfo
                DropdownImage.AnchorPoint = Vector2.new(1, 0)
                DropdownImage.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
                DropdownImage.BackgroundTransparency = 1.000
                DropdownImage.BorderSizePixel = 0
                DropdownImage.Position = UDim2.new(1, -8, 0, 5)
                DropdownImage.Rotation = 0
                DropdownImage.Size = UDim2.new(0, 30, 0, 30)
                DropdownImage.Image = "rbxassetid://11711585550"
                DropdownImage.ImageColor3 = Color3.fromRGB(50, 200, 100)
                
                DropdownButton.Name = "DropdownButton"
                DropdownButton.Parent = DropdownInfo
                DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownButton.BackgroundTransparency = 1.000
                DropdownButton.Size = UDim2.new(1, 0, 1, 0)
                DropdownButton.Font = Enum.Font.SourceSans
                DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.TextSize = 14.000
                DropdownButton.TextTransparency = 1.000
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = DropdownItem
                
                SearchBar.Name = "SearchBar"
                SearchBar.Parent = DropdownItem
                SearchBar.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                SearchBar.Position = UDim2.new(0, 10, 0, 40)
                SearchBar.Selectable = false
                SearchBar.Size = UDim2.new(1, -20, 0, 30)
                SearchBar.Font = Enum.Font.GothamMedium
                SearchBar.PlaceholderColor3 = Color3.fromRGB(50, 200, 100)
                SearchBar.PlaceholderText = "Search"
                SearchBar.Text = ""
                SearchBar.TextColor3 = Color3.fromRGB(50, 200, 100)
                SearchBar.TextScaled = true
                SearchBar.TextWrapped = true
                
                UIPadding_3.Parent = SearchBar
                UIPadding_3.PaddingBottom = UDim.new(0, 5)
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingRight = UDim.new(0, 10)
                UIPadding_3.PaddingTop = UDim.new(0, 5)
                
                UICorner_2.CornerRadius = UDim.new(0, 10)
                UICorner_2.Parent = SearchBar
                
                AddConnection(DropdownItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(DropdownItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)

                local Droppeddown = false
                local function DroppingDown()
                    if not Droppeddown then
                        Droppeddown = true
                        TweenService:Create(DropdownImage, tweenInfo, {Rotation = 180}):Play()
                        TweenService:Create(DropdownItem, tweenInfo, {Size = UDim2.new(1, 0, 0, (40 + UIListLayout.AbsoluteContentSize.Y) + 50)}):Play()
                        
                    elseif Droppeddown then
                        Droppeddown = false
                        TweenService:Create(DropdownImage, tweenInfo, {Rotation = 0}):Play()
                        TweenService:Create(DropdownItem, tweenInfo, {Size = UDim2.new(1, 0, 0, 40)}):Play()
                        
                    end
                end

                AddConnection(SearchBar.Changed, function(e)
                    if e == "Text" then
                        local search = string.lower(SearchBar.Text)
                        for i, v in pairs(DropdownItems:GetDescendants()) do
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
                    end
                end)

                AddConnection(UIListLayout.Changed, function(e)
                    if Droppeddown then
                        TweenService:Create(DropdownItem, tweenInfo, {Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 90)}):Play()
                    end
                end)

                AddConnection(DropdownButton.Activated, function()
                    DroppingDown()
                end)

                local dropdown = {Items = DropdownConfig.Items, Buttons = {}}

                local function AddItems(Items)
                    for _, v in pairs(Items) do
                        local Item = Instance.new("Frame")
                        local TextLabel = Instance.new("TextLabel")
                        local UIPadding = Instance.new("UIPadding")
                        local TextButton = Instance.new("TextButton")
                        local UICorner = Instance.new("UICorner")
                        
                        Item.Name = "Item"
                        Item.Parent = DropdownItems
                        Item.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                        Item.BackgroundTransparency = 0.4
                        Item.Size = UDim2.new(1, 0, 0, 30)
                        
                        TextLabel.Parent = Item
                        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel.BackgroundTransparency = 1
                        TextLabel.Size = UDim2.new(1, 0, 1, 0)
                        TextLabel.Font = Enum.Font.GothamMedium
                        TextLabel.Text = v
                        TextLabel.TextColor3 = WindowConfig.Color
                        TextLabel.TextScaled = true
                        TextLabel.TextSize = 14.000
                        TextLabel.TextWrapped = true
                        TextLabel.TextTransparency = 0.5
                        
                        UIPadding.Parent = TextLabel
                        UIPadding.PaddingBottom = UDim.new(0, 5)
                        UIPadding.PaddingLeft = UDim.new(0, 10)
                        UIPadding.PaddingRight = UDim.new(0, 10)
                        UIPadding.PaddingTop = UDim.new(0, 5)
                        
                        TextButton.Parent = Item
                        TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton.BackgroundTransparency = 1.000
                        TextButton.Size = UDim2.new(1, 0, 1, 0)
                        TextButton.Font = Enum.Font.SourceSans
                        TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                        TextButton.TextSize = 14.000
                        TextButton.TextTransparency = 1.000
                        
                        UICorner.CornerRadius = UDim.new(0, 10)
                        UICorner.Parent = Item

                        AddConnection(Item.MouseEnter, function()
                            TweenService:Create(TextLabel, tweenInfo, {TextTransparency = 0}):Play()
                        end)

                        AddConnection(Item.MouseLeave, function()
                            TweenService:Create(TextLabel, tweenInfo, {TextTransparency = 0.5}):Play()
                        end)

                        AddConnection(TextButton.MouseButton1Down, function()
                            TweenService:Create(Item, tweenInfo, {BackgroundTransparency = 0}):Play()
                        end)

                        AddConnection(TextButton.Activated, function()
                            if Droppeddown then
                                TweenService:Create(Item, tweenInfo, {BackgroundTransparency = 0.4}):Play()
                                DropdownConfig.Callback(v)
                                DropdownText.Text = v
                                DroppingDown()
                            end
                        end)

                        dropdown.Buttons[v] = Item

                    end
                end
                AddItems(dropdown.Items)

                local DropdownLib = {}
                function DropdownLib:Add(Items)
                    for _, v in pairs(Items) do
                        table.insert(dropdown.Items, v)
                    end
                    AddItems(Items)
                end

                function DropdownLib:Remove(Items)
                    for i1, v1 in pairs(dropdown.Items) do
                        for i2, v2 in pairs(Items) do
                            local index = table.find(dropdown.Items, v2)
                            table.remove(dropdown.Items, index)
                            dropdown.Buttons[v2]:Destroy()
                        end
                    end
                end
                return DropdownLib
            end

            function ItemsLib:ElementsDropdown(ElementsDropdownConfig)
                ElementsDropdownConfig = ElementsDropdownConfig or {}
                ElementsDropdownConfig.Name = ElementsDropdownConfig.Name or "Dropdown"

                local ElementsDropdownItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local ElementsDropdownItems = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local UIPadding = Instance.new("UIPadding")
                local ElementsDropdownInfo = Instance.new("Frame")
                local ElementsDropdownText = Instance.new("TextLabel")
                local UIPadding_2 = Instance.new("UIPadding")
                local ElementsDropdownImage = Instance.new("ImageLabel")
                local ElementsDropdownButton = Instance.new("TextButton")
                local UICorner = Instance.new("UICorner")
                local SearchBar = Instance.new("TextBox")
                local UIPadding_3 = Instance.new("UIPadding")
                local UICorner_2 = Instance.new("UICorner")
                
                ElementsDropdownItem.Name = "ElementsDropdownItem"
                ElementsDropdownItem.Parent = Section
                ElementsDropdownItem.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
                ElementsDropdownItem.ClipsDescendants = true
                ElementsDropdownItem.Size = UDim2.new(1, 0, 0, 40)
                
                UIStroke.Parent = ElementsDropdownItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                ElementsDropdownItems.Name = "ElementsDropdownItems"
                ElementsDropdownItems.Parent = ElementsDropdownItem
                ElementsDropdownItems.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ElementsDropdownItems.BackgroundTransparency = 1.000
                ElementsDropdownItems.Position = UDim2.new(0, 0, 0, 70)
                ElementsDropdownItems.Size = UDim2.new(1, 0, 1, -40)
                
                UIListLayout.Parent = ElementsDropdownItems
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 6)
                
                UIPadding.Parent = ElementsDropdownItems
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
                
                ElementsDropdownInfo.Name = "ElementsDropdownInfo"
                ElementsDropdownInfo.Parent = ElementsDropdownItem
                ElementsDropdownInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ElementsDropdownInfo.BackgroundTransparency = 1.000
                ElementsDropdownInfo.Size = UDim2.new(1, 0, 0, 40)
                
                ElementsDropdownText.Name = "ElementsDropdownText"
                ElementsDropdownText.Parent = ElementsDropdownInfo
                ElementsDropdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ElementsDropdownText.BackgroundTransparency = 1.000
                ElementsDropdownText.Size = UDim2.new(1, -50, 0, 40)
                ElementsDropdownText.Font = Enum.Font.GothamMedium
                ElementsDropdownText.Text = "Elements Dropdown"
                ElementsDropdownText.TextColor3 = Color3.fromRGB(50, 200, 100)
                ElementsDropdownText.TextScaled = true
                ElementsDropdownText.TextSize = 14.000
                ElementsDropdownText.TextWrapped = true
                ElementsDropdownText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding_2.Parent = ElementsDropdownText
                UIPadding_2.PaddingBottom = UDim.new(0, 10)
                UIPadding_2.PaddingLeft = UDim.new(0, 10)
                UIPadding_2.PaddingRight = UDim.new(0, 10)
                UIPadding_2.PaddingTop = UDim.new(0, 10)
                
                ElementsDropdownImage.Name = "ElementsDropdownImage"
                ElementsDropdownImage.Parent = ElementsDropdownInfo
                ElementsDropdownImage.AnchorPoint = Vector2.new(1, 0)
                ElementsDropdownImage.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
                ElementsDropdownImage.BackgroundTransparency = 1.000
                ElementsDropdownImage.BorderSizePixel = 0
                ElementsDropdownImage.Position = UDim2.new(1, -8, 0, 5)
                ElementsDropdownImage.Rotation = 0
                ElementsDropdownImage.Size = UDim2.new(0, 30, 0, 30)
                ElementsDropdownImage.Image = "rbxassetid://11711585550"
                ElementsDropdownImage.ImageColor3 = Color3.fromRGB(50, 200, 100)
                
                ElementsDropdownButton.Name = "ElementsDropdownButton"
                ElementsDropdownButton.Parent = ElementsDropdownInfo
                ElementsDropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ElementsDropdownButton.BackgroundTransparency = 1.000
                ElementsDropdownButton.Size = UDim2.new(1, 0, 1, 0)
                ElementsDropdownButton.Font = Enum.Font.SourceSans
                ElementsDropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ElementsDropdownButton.TextSize = 14.000
                ElementsDropdownButton.TextTransparency = 1.000
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = ElementsDropdownItem
                
                SearchBar.Name = "SearchBar"
                SearchBar.Parent = ElementsDropdownItem
                SearchBar.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                SearchBar.Position = UDim2.new(0, 10, 0, 40)
                SearchBar.Selectable = false
                SearchBar.Size = UDim2.new(1, -20, 0, 30)
                SearchBar.Font = Enum.Font.GothamMedium
                SearchBar.PlaceholderColor3 = Color3.fromRGB(50, 200, 100)
                SearchBar.PlaceholderText = "Search"
                SearchBar.Text = ""
                SearchBar.TextColor3 = Color3.fromRGB(50, 200, 100)
                SearchBar.TextScaled = true
                SearchBar.TextWrapped = true
                
                UIPadding_3.Parent = SearchBar
                UIPadding_3.PaddingBottom = UDim.new(0, 5)
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingRight = UDim.new(0, 10)
                UIPadding_3.PaddingTop = UDim.new(0, 5)
                
                UICorner_2.CornerRadius = UDim.new(0, 10)
                UICorner_2.Parent = SearchBar
                
                AddConnection(ElementsDropdownItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(ElementsDropdownItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)

                local Droppeddown = false
                local function DroppingDown()
                    if not Droppeddown then
                        Droppeddown = true
                        TweenService:Create(ElementsDropdownImage, tweenInfo, {Rotation = 180}):Play()
                        TweenService:Create(ElementsDropdownItem, tweenInfo, {Size = UDim2.new(1, 0, 0, (40 + UIListLayout.AbsoluteContentSize.Y) + 50)}):Play()
                        
                    elseif Droppeddown then
                        Droppeddown = false
                        TweenService:Create(ElementsDropdownImage, tweenInfo, {Rotation = 0}):Play()
                        TweenService:Create(ElementsDropdownItem, tweenInfo, {Size = UDim2.new(1, 0, 0, 40)}):Play()
                    end
                end

                AddConnection(ElementsDropdownButton.Activated, function()
                    DroppingDown()
                end)

                AddConnection(SearchBar.Changed, function(e)
                    if e == "Text" then
                        local search = string.lower(SearchBar.Text)
                        for _, v in pairs(ElementsDropdownItems:GetDescendants()) do
                            if v:IsA("TextLabel") and v.Name ~= "SliderValue" then
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
                    end
                end)

                AddConnection(UIListLayout.Changed, function(e)
                    if Droppeddown then
                        TweenService:Create(ElementsDropdownItem, tweenInfo, {Size = UDim2.new(1, 0, 0, UIListLayout.AbsoluteContentSize.Y + 90)}):Play()
                    end
                end)

                local DropdownLib = {}
                function DropdownLib:Button(ButtonConfig)
                    ButtonConfig.Name = ButtonConfig.Name or "Button"
                    ButtonConfig.Callback = ButtonConfig.Callback or function() end
                    
                    ItemsLib:Button({
                        Name = ButtonConfig.Name,
                        Callback = ButtonConfig.Callback
                    }, ElementsDropdownItems, Color3.fromRGB(40, 43, 48))
                end

                function DropdownLib:Toggle(ToggleConfig)
                    ToggleConfig.Name = ToggleConfig.Name or "Toggle"
                    ToggleConfig.Default = ToggleConfig.Default or false
                    ToggleConfig.Callback = ToggleConfig.Callback or function() end

                    ItemsLib:Toggle({
                        Name = ToggleConfig.Name,
                        Default = ToggleConfig.Default,
                        Callback = ToggleConfig.Callback
                    }, ElementsDropdownItems, Color3.fromRGB(40, 43, 48))
                end

                function DropdownLib:Slider(SliderConfig)
                    SliderConfig.Name = SliderConfig.Name or "Slider"
                    SliderConfig.Min = SliderConfig.Min or 0
                    SliderConfig.Max = SliderConfig.Max or 100
                    SliderConfig.Callback = SliderConfig.Callback or function() end

                    ItemsLib:Slider({
                        Name = SliderConfig.Name,
                        Min = SliderConfig.Min,
                        Max = SliderConfig.Max,
                        Callback = SliderConfig.Callback
                    }, ElementsDropdownItems, Color3.fromRGB(40, 43, 48), Color3.fromRGB(30, 33, 36))
                end

                function DropdownLib:Label(LabelConfig)
                    LabelConfig.Content = LabelConfig.Content or "Label"
                    ItemsLib:Label({
                        Content = LabelConfig.Content
                    }, ElementsDropdownItems)
                end

                function DropdownLib:Paragraph(ParagraphConfig)
                    ParagraphConfig.Title = ParagraphConfig.Title or "Paragraph"
                    ParagraphConfig.Content = ParagraphConfig.Content or 0
                    ItemsLib:Paragraph({
                        Title = ParagraphConfig.Title,
                        Content = ParagraphConfig.Content
                    }, ElementsDropdownItems)
                end

                function DropdownLib:KeyBind(KeyBindConfig)
                    KeyBindConfig.Name = KeyBindConfig.Name or "KeyBind"
                    KeyBindConfig.Default = KeyBindConfig.Default or Enum.KeyCode.N
                    KeyBindConfig.Callback = KeyBindConfig.Callback or function() end

                    ItemsLib:KeyBind({
                        Name = KeyBindConfig.Name,
                        Default = KeyBindConfig.Default,
                        Callback = KeyBindConfig.Callback
                    }, ElementsDropdownItems, Color3.fromRGB(40, 43, 48), Color3.fromRGB(30, 33, 36))
                end
                return DropdownLib
            end

            function ItemsLib:ColorPicker(ColorPickerConfig)
                ColorPickerConfig = ColorPickerConfig or {}
                ColorPickerConfig.Name = ColorPickerConfig.Name or "Color Picker"
                ColorPickerConfig.Callback = ColorPickerConfig.Callback or function() end

                local ColorPickerItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local ColorPickerInfo = Instance.new("Frame")
                local ColorPickerText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local ColorPickerButton = Instance.new("TextButton")
                local ColorPreview = Instance.new("Frame")
                local Stroke = Instance.new("Frame")
                local UIStroke_2 = Instance.new("UIStroke")
                local UICorner = Instance.new("UICorner")
                local UICorner_2 = Instance.new("UICorner")
                local ColorPickerFrame = Instance.new("Frame")
                local UIPadding_2 = Instance.new("UIPadding")
                local HueSlider = Instance.new("ImageButton")
                local UICorner_3 = Instance.new("UICorner")
                local UIGradient = Instance.new("UIGradient")
                local Pointer = Instance.new("Frame")
                local UIStroke_3 = Instance.new("UIStroke")
                local UICorner_4 = Instance.new("UICorner")
                local Stroke_2 = Instance.new("Frame")
                local UIStroke_4 = Instance.new("UIStroke")
                local UICorner_5 = Instance.new("UICorner")
                local UIPadding_3 = Instance.new("UIPadding")
                local ColorPicker = Instance.new("ImageButton")
                local Pointer_2 = Instance.new("Frame")
                local UIStroke_5 = Instance.new("UIStroke")
                local UICorner_6 = Instance.new("UICorner")
                local Stroke_3 = Instance.new("Frame")
                local UIStroke_6 = Instance.new("UIStroke")
                local UICorner_7 = Instance.new("UICorner")
                local UICorner_8 = Instance.new("UICorner")
                local UIPadding_4 = Instance.new("UIPadding")
                
                ColorPickerItem.Name = "Color Picker Item"
                ColorPickerItem.Parent = Section
                ColorPickerItem.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
                ColorPickerItem.ClipsDescendants = true
                ColorPickerItem.Size = UDim2.new(1, 0, 0, 40)
                
                UIStroke.Parent = ColorPickerItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                ColorPickerInfo.Name = "Color Picker Info"
                ColorPickerInfo.Parent = ColorPickerItem
                ColorPickerInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerInfo.BackgroundTransparency = 1.000
                ColorPickerInfo.Size = UDim2.new(1, 0, 0, 40)
                
                ColorPickerText.Name = "ColorPickerText"
                ColorPickerText.Parent = ColorPickerInfo
                ColorPickerText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerText.BackgroundTransparency = 1.000
                ColorPickerText.Size = UDim2.new(1, -50, 0, 40)
                ColorPickerText.Font = Enum.Font.GothamMedium
                ColorPickerText.Text = ColorPickerConfig.Name
                ColorPickerText.TextColor3 = Color3.fromRGB(50, 200, 100)
                ColorPickerText.TextScaled = true
                ColorPickerText.TextSize = 14.000
                ColorPickerText.TextWrapped = true
                ColorPickerText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = ColorPickerText
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
                
                ColorPickerButton.Name = "ColorPickerButton"
                ColorPickerButton.Parent = ColorPickerInfo
                ColorPickerButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerButton.BackgroundTransparency = 1.000
                ColorPickerButton.Size = UDim2.new(1, 0, 1, 0)
                ColorPickerButton.Font = Enum.Font.SourceSans
                ColorPickerButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ColorPickerButton.TextSize = 14.000
                ColorPickerButton.TextTransparency = 1.000
                
                ColorPreview.Name = "Color Preview"
                ColorPreview.Parent = ColorPickerInfo
                ColorPreview.AnchorPoint = Vector2.new(1, 0)
                ColorPreview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPreview.BorderSizePixel = 0
                ColorPreview.Position = UDim2.new(1, -13, 0, 10)
                ColorPreview.Size = UDim2.new(0, 20, 0, 20)
                
                Stroke.Name = "Stroke"
                Stroke.Parent = ColorPreview
                Stroke.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
                Stroke.BackgroundTransparency = 1.000
                Stroke.BorderSizePixel = 0
                Stroke.Size = UDim2.new(0, 20, 0, 20)

                UIStroke_2.Parent = Stroke
                UIStroke_2.Color = Color3.fromRGB(255, 255, 255)
                UIStroke_2.Thickness = 3
                UIStroke_2.Transparency = 0
                
                UICorner.CornerRadius = UDim.new(0, 5)
                UICorner.Parent = Stroke
                
                UICorner_2.CornerRadius = UDim.new(0, 10)
                UICorner_2.Parent = ColorPickerItem
                
                ColorPickerFrame.Name = "Color Picker Frame"
                ColorPickerFrame.Parent = ColorPickerItem
                ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorPickerFrame.BackgroundTransparency = 1.000
                ColorPickerFrame.Position = UDim2.new(0, 0, 0, 40)
                ColorPickerFrame.Size = UDim2.new(1, 0, 0, 160)
                ColorPickerFrame.ClipsDescendants = true
                
                UIPadding_2.Parent = ColorPickerFrame
                UIPadding_2.PaddingBottom = UDim.new(0, 10)
                UIPadding_2.PaddingLeft = UDim.new(0, 10)
                UIPadding_2.PaddingRight = UDim.new(0, 10)
                UIPadding_2.PaddingTop = UDim.new(0, 10)
                
                HueSlider.Name = "Hue Picker"
                HueSlider.Parent = ColorPickerFrame
                HueSlider.Active = false
                HueSlider.AnchorPoint = Vector2.new(1, 0)
                HueSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                HueSlider.Position = UDim2.new(1, 0, 0, 0)
                HueSlider.Selectable = false
                HueSlider.Size = UDim2.new(0, 20, 1, 0)
                HueSlider.AutoButtonColor = false
                
                UICorner_3.CornerRadius = UDim.new(0, 5)
                UICorner_3.Parent = HueSlider
                
                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                                                    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                                                    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                                                    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
                                                    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                                                    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
                UIGradient.Rotation = 90
                UIGradient.Parent = HueSlider
                
                Pointer.Name = "Pointer"
                Pointer.Parent = HueSlider
                Pointer.AnchorPoint = Vector2.new(0.5, 0.5)
                Pointer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Pointer.BackgroundTransparency = 1.000
                Pointer.Size = UDim2.new(0, 10, 0, 10)
                
                UICorner_4.CornerRadius = UDim.new(1, 0)
                UICorner_4.Parent = Pointer

                UIStroke_3.Parent = Pointer
                UIStroke_3.Color = Color3.fromRGB(255, 255, 255)
                UIStroke_3.Thickness = 2
                UIStroke_3.Transparency = 0
                
                Stroke_2.Name = "Stroke"
                Stroke_2.Parent = Pointer
                Stroke_2.AnchorPoint = Vector2.new(0.5, 0.5)
                Stroke_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Stroke_2.BackgroundTransparency = 1.000
                Stroke_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                Stroke_2.Size = UDim2.new(0, 8, 0, 8)
                
                UICorner_5.CornerRadius = UDim.new(1, 0)
                UICorner_5.Parent = Stroke_2

                UIStroke_4.Parent = Stroke_2
                UIStroke_4.Color = Color3.fromRGB(0, 0, 0)
                UIStroke_4.Thickness = 2
                UIStroke_4.Transparency = 0
                
                UIPadding_3.Parent = HueSlider
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingRight = UDim.new(0, 10)
                
                ColorPicker.Name = "Color Picker"
                ColorPicker.Parent = ColorPickerFrame
                ColorPicker.Active = false
                ColorPicker.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                ColorPicker.Selectable = false
                ColorPicker.Size = UDim2.new(1, -30, 1, 0)
                ColorPicker.AutoButtonColor = false
                ColorPicker.Image = "rbxassetid://4155801252"
                
                Pointer_2.Name = "Pointer"
                Pointer_2.Parent = ColorPicker
                Pointer_2.AnchorPoint = Vector2.new(0.5, 0.5)
                Pointer_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Pointer_2.BackgroundTransparency = 1.000
                Pointer_2.Size = UDim2.new(0, 10, 0, 10)
                
                UICorner_6.CornerRadius = UDim.new(1, 0)
                UICorner_6.Parent = Pointer_2

                UIStroke_5.Parent = Pointer_2
                UIStroke_5.Color = Color3.fromRGB(255, 255, 255)
                UIStroke_5.Thickness = 2
                UIStroke_5.Transparency = 0
                
                Stroke_3.Name = "Stroke"
                Stroke_3.Parent = Pointer_2
                Stroke_3.AnchorPoint = Vector2.new(0.5, 0.5)
                Stroke_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Stroke_3.BackgroundTransparency = 1.000
                Stroke_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                Stroke_3.Size = UDim2.new(0, 8, 0, 8)
                
                UICorner_7.CornerRadius = UDim.new(1, 0)
                UICorner_7.Parent = Stroke_3

                UIStroke_6.Parent = Stroke_3
                UIStroke_6.Color = Color3.fromRGB(0, 0, 0)
                UIStroke_6.Thickness = 2
                UIStroke_6.Transparency = 0
                
                UICorner_8.CornerRadius = UDim.new(0, 5)
                UICorner_8.Parent = ColorPicker
                
                UIPadding_4.Parent = ColorPickerItem
                
                AddConnection(ColorPickerItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(ColorPickerItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)

                local Droppeddown = false
                local function DroppingDown()
                    if not Droppeddown then
                        Droppeddown = true
                        TweenService:Create(ColorPickerItem, tweenInfo, {Size = UDim2.new(1, 0, 0, 200)}):Play()
                        
                    elseif Droppeddown then
                        Droppeddown = false
                        TweenService:Create(ColorPickerItem, tweenInfo, {Size = UDim2.new(1, 0, 0, 40)}):Play()
                        
                    end
                end

                AddConnection(ColorPickerButton.Activated, function()
                    DroppingDown()
                end)
                
                local SelectedColor = Color3.fromRGB(255, 255, 255)
                local ColorInput = nil
                local HueInput = nil
                local ColorH = 1
                local ColorS = 0
                local ColorV = 1
                local function UpdateColor()
                    ColorPreview.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    UIStroke_2.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
                    ColorPicker.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                    SelectedColor = ColorPreview.BackgroundColor3
                    ColorPickerConfig.Callback(SelectedColor)
                end
                
                ColorPicker.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if (ColorInput) then
                            ColorInput:Disconnect()
                        end
                
                        ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
                            local ColorHue = (math.clamp(mouse.X - ColorPicker.AbsolutePosition.X, 0, ColorPicker.AbsoluteSize.X) / ColorPicker.AbsoluteSize.X)
                            local ColorValue = (math.clamp(mouse.Y - ColorPicker.AbsolutePosition.Y, 0, ColorPicker.AbsoluteSize.Y) / ColorPicker.AbsoluteSize.Y)
                
                            ColorS = ColorHue
                            ColorV = 1 - ColorValue
                
                            Pointer_2.Position = UDim2.new(ColorHue, 0, ColorValue, 0)
                
                            UpdateColor()
                        end)
                    end
                end)
                
                ColorPicker.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if (ColorInput) then
                            ColorInput:Disconnect()
                        end
                    end
                end)
                
                HueSlider.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if (HueInput) then
                            HueInput:Disconnect()
                        end
                
                        HueInput = game:GetService("RunService").RenderStepped:Connect(function()
                            local HueY = (math.clamp(mouse.Y - HueSlider.AbsolutePosition.Y, 0, HueSlider.AbsoluteSize.Y) / HueSlider.AbsoluteSize.Y)
                
                            Pointer.Position = UDim2.new(0, 0, HueY, 0)
                            ColorH = HueY
                
                            UpdateColor()
                        end)
                    end
                end)
                
                HueSlider.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if (HueInput) then
                            HueInput:Disconnect()
                        end
                    end
                end)
            end

            function ItemsLib:TextBox(TextBoxConfig)
                TextBoxConfig = TextBoxConfig or {}
                TextBoxConfig.Name = TextBoxConfig.Name or "TextBox"
                TextBoxConfig.Clear = TextBoxConfig.Clear or false
                TextBoxConfig.Default = TextBoxConfig.Default or "Text Box"
                TextBoxConfig.Callback = TextBoxConfig.Callback or function() end

                local TextBoxItem = Instance.new("Frame")
                local UIStroke = Instance.new("UIStroke")
                local TextBoxText = Instance.new("TextLabel")
                local UIPadding = Instance.new("UIPadding")
                local UICorner = Instance.new("UICorner")
                local TextBoxFrame = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local TextBox = Instance.new("TextBox")
                local UIPadding_2 = Instance.new("UIPadding")
                
                TextBoxItem.Name = "TextBox Item"
                TextBoxItem.Parent = Section
                TextBoxItem.BackgroundColor3 = Color3.fromRGB(30, 33, 36)
                TextBoxItem.Size = UDim2.new(1, 0, 0, 40)
                
                UIStroke.Parent = TextBoxItem
                UIStroke.Color = WindowConfig.Color
                UIStroke.Thickness = 2
                UIStroke.Transparency = 1
                
                TextBoxText.Name = "TextBox Text"
                TextBoxText.Parent = TextBoxItem
                TextBoxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxText.BackgroundTransparency = 1.000
                TextBoxText.Size = UDim2.new(1, -51, 1, 0)
                TextBoxText.Font = Enum.Font.GothamMedium
                TextBoxText.Text = TextBoxConfig.Name
                TextBoxText.TextColor3 = Color3.fromRGB(50, 200, 100)
                TextBoxText.TextScaled = true
                TextBoxText.TextSize = 14.000
                TextBoxText.TextWrapped = true
                TextBoxText.TextXAlignment = Enum.TextXAlignment.Left
                
                UIPadding.Parent = TextBoxText
                UIPadding.PaddingBottom = UDim.new(0, 10)
                UIPadding.PaddingLeft = UDim.new(0, 10)
                UIPadding.PaddingRight = UDim.new(0, 10)
                UIPadding.PaddingTop = UDim.new(0, 10)
                
                UICorner.CornerRadius = UDim.new(0, 10)
                UICorner.Parent = TextBoxItem
                
                TextBoxFrame.Name = "TextBox Frame"
                TextBoxFrame.Parent = TextBoxItem
                TextBoxFrame.AnchorPoint = Vector2.new(1, 0)
                TextBoxFrame.BackgroundColor3 = Color3.fromRGB(40, 43, 48)
                TextBoxFrame.Position = UDim2.new(1, -10, 0, 10)
                TextBoxFrame.Size = UDim2.new(0, 31, 0, 20)
                TextBoxFrame.ClipsDescendants = true
                
                UICorner_2.Parent = TextBoxFrame
                
                TextBox.Name = "TextBox"
                TextBox.Parent = TextBoxFrame
                TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.BackgroundTransparency = 1.000
                TextBox.Size = UDim2.new(1, 0, 1, 0)
                TextBox.Font = Enum.Font.GothamBold
                TextBox.Text = TextBoxConfig.Default
                TextBox.TextColor3 = Color3.fromRGB(50, 200, 100)
                TextBox.TextSize = 14.000
                TextBox.ClearTextOnFocus = TextBoxConfig.Clear
                
                UIPadding_2.Parent = TextBox
                UIPadding_2.PaddingBottom = UDim.new(0, 3)
                UIPadding_2.PaddingLeft = UDim.new(0, 5)
                UIPadding_2.PaddingRight = UDim.new(0, 5)
                UIPadding_2.PaddingTop = UDim.new(0, 3)
                
                AddConnection(TextBoxItem.MouseEnter, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 0}):Play()
                end)
                
                AddConnection(TextBoxItem.MouseLeave, function()
                    TweenService:Create(UIStroke, tweenInfo, {Transparency = 1}):Play()
                end)

                AddConnection(TextBox.FocusLost, function()
                    TextBoxConfig.Callback(TextBox.Text)
                end)

                AddConnection(TextBox.Changed, function(e)
                    if e == "TextBounds" then
                        TweenService:Create(TextBoxFrame, tweenInfo, {Size = UDim2.new(0, math.clamp(TextBox.TextBounds.X + 20, 20, 200), 0, 20)}):Play()
                    end
                end)

                AddConnection(TextBoxFrame.Changed, function(e)
                    if e == "Size" then
                        TweenService:Create(TextBoxText, tweenInfo, {Size = UDim2.new(1, -(TextBoxFrame.Size.X.Offset + 20), 1, 0)}):Play()
                    end
                end)
            end

            return ItemsLib
        end
        return SectionsLib
    end
    return TabsLib
end
return M7Lib
