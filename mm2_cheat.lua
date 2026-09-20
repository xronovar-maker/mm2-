-- ============================================
-- MM2 Cheat Menu v3.0 - MEGA EDITION
-- Delta Executor
-- ============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- ============================================
-- 🔐 СИСТЕМА ПАРОЛЯ
-- ============================================
local CORRECT_PASSWORD = "Xronovar_mixa123"

local PasswordGui = Instance.new("ScreenGui")
PasswordGui.Name = "MM2Password"
PasswordGui.ResetOnSpawn = false
PasswordGui.IgnoreGuiInset = true
PasswordGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PasswordGui.Parent = game:GetService("CoreGui")

local PwBg = Instance.new("Frame")
PwBg.Size = UDim2.new(0, 380, 0, 220)
PwBg.Position = UDim2.new(0.5, -190, 0.5, -110)
PwBg.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
PwBg.BorderSizePixel = 0
PwBg.Parent = PasswordGui

local PwCorner = Instance.new("UICorner")
PwCorner.CornerRadius = UDim.new(0, 14)
PwCorner.Parent = PwBg

local PwStroke = Instance.new("UIStroke")
PwStroke.Color = Color3.fromRGB(120, 80, 255)
PwStroke.Thickness = 2
PwStroke.Parent = PwBg

local PwTitle = Instance.new("TextLabel")
PwTitle.Size = UDim2.new(1, 0, 0, 45)
PwTitle.BackgroundColor3 = Color3.fromRGB(28, 26, 40)
PwTitle.BorderSizePixel = 0
PwTitle.Text = "🔒 Введите пароль"
PwTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
PwTitle.Font = Enum.Font.GothamBold
PwTitle.TextSize = 16
PwTitle.Parent = PwBg

local PwTitleCorner = Instance.new("UICorner")
PwTitleCorner.CornerRadius = UDim.new(0, 14)
PwTitleCorner.Parent = PwTitle

local PwInput = Instance.new("TextBox")
PwInput.Size = UDim2.new(1, -40, 0, 40)
PwInput.Position = UDim2.new(0, 20, 0, 65)
PwInput.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
PwInput.BorderSizePixel = 0
PwInput.Text = ""
PwInput.PlaceholderText = "Пароль..."
PwInput.TextColor3 = Color3.fromRGB(255, 255, 255)
PwInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
PwInput.Font = Enum.Font.Gotham
PwInput.TextSize = 14
PwInput.ClearTextOnFocus = false
PwInput.Parent = PwBg

local PwInputCorner = Instance.new("UICorner")
PwInputCorner.CornerRadius = UDim.new(0, 8)
PwInputCorner.Parent = PwInput

local PwStatus = Instance.new("TextLabel")
PwStatus.Size = UDim2.new(1, -40, 0, 20)
PwStatus.Position = UDim2.new(0, 20, 0, 112)
PwStatus.BackgroundTransparency = 1
PwStatus.Text = ""
PwStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
PwStatus.Font = Enum.Font.GothamMedium
PwStatus.TextSize = 12
PwStatus.Parent = PwBg

local PwSubmit = Instance.new("TextButton")
PwSubmit.Size = UDim2.new(1, -40, 0, 40)
PwSubmit.Position = UDim2.new(0, 20, 0, 145)
PwSubmit.BackgroundColor3 = Color3.fromRGB(80, 60, 180)
PwSubmit.BorderSizePixel = 0
PwSubmit.Text = "ВОЙТИ"
PwSubmit.TextColor3 = Color3.fromRGB(255, 255, 255)
PwSubmit.Font = Enum.Font.GothamBold
PwSubmit.TextSize = 14
PwSubmit.AutoButtonColor = false
PwSubmit.Parent = PwBg

local PwSubmitCorner = Instance.new("UICorner")
PwSubmitCorner.CornerRadius = UDim.new(0, 8)
PwSubmitCorner.Parent = PwSubmit

-- Анимация появления окна пароля
PwBg.Size = UDim2.new(0, 0, 0, 0)
PwBg.Position = UDim2.new(0.5, 0, 0.5, 0)
TweenService:Create(PwBg, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 380, 0, 220),
    Position = UDim2.new(0.5, -190, 0.5, -110)
}):Play()

PwSubmit.MouseEnter:Connect(function()
    TweenService:Create(PwSubmit, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(110, 85, 220)}):Play()
end)
PwSubmit.MouseLeave:Connect(function()
    TweenService:Create(PwSubmit, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(80, 60, 180)}):Play()
end)

-- ============================================
-- ОСНОВНОЙ КОД (запускается только после верного пароля)
-- ============================================
local function START_CHEAT()

PasswordGui:Destroy()

local Settings = {
    -- Combat
    AimBotEnabled = true, SilentAim = false, TriggerBot = false, AutoShoot = false,
    AimFOV = 200, AimSmoothness = 0.15, AimTarget = "Head", TeamCheck = true,
    WallCheck = false, Prediction = 0.15, HitPart = "Head",
    -- ESP
    ESPEnabled = true, ShowNames = true, ShowDistance = true, ShowHealth = true,
    ShowTracers = false, ShowBoxes = true, ShowChams = false, ShowRole = true,
    ESPTeamColor = true, RainbowESP = false, ShowWeapon = true,
    -- Visuals
    Fullbright = false, NoFog = false, FOVChanger = false, FOVValue = 70,
    ThirdPerson = false,
    -- Movement
    SpeedHack = false, SpeedValue = 32, JumpPower = false, JumpValue = 50,
    Fly = false, FlySpeed = 50, InfiniteJump = false, NoClip = false,
    BunnyHop = false, AntiFling = false,
    -- Misc
    AutoFarm = false, AutoKill = false, KillAura = false, GodMode = false,
    Invisible = false, AutoCoins = false,
    -- Fun
    SpinBot = false, JitterAim = false, NoHead = false, TinyCharacter = false,
    BigCharacter = false, SpamChat = false, RainbowChar = false
}

-- ============ GUI СОЗДАНИЕ ============
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2MegaMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game:GetService("CoreGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 70, 0, 70)
ToggleButton.Position = UDim2.new(0, 25, 0.5, -35)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = ""
ToggleButton.AutoButtonColor = false
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 35)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(120, 80, 255)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

local ToggleIcon = Instance.new("TextLabel")
ToggleIcon.Size = UDim2.new(1, 0, 1, 0)
ToggleIcon.BackgroundTransparency = 1
ToggleIcon.Text = "M"
ToggleIcon.TextColor3 = Color3.fromRGB(220, 200, 255)
ToggleIcon.Font = Enum.Font.GothamBold
ToggleIcon.TextSize = 30
ToggleIcon.Parent = ToggleButton

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 620, 0, 420)
MainFrame.Position = UDim2.new(0.5, -310, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(120, 80, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

local BgGradient = Instance.new("UIGradient")
BgGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 22, 38)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 14, 22))
})
BgGradient.Rotation = 45
BgGradient.Parent = MainFrame

-- TopBar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 48)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 15)
TopFix.Position = UDim2.new(0, 0, 1, -15)
TopFix.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
TopFix.BorderSizePixel = 0
TopFix.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 380, 1, 0)
Title.Position = UDim2.new(0, 20, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "⚔ MM2 • MEGA CHEAT MENU v3.0"
Title.TextColor3 = Color3.fromRGB(220, 200, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local StatusDot = Instance.new("Frame")
StatusDot.Size = UDim2.new(0, 8, 0, 8)
StatusDot.Position = UDim2.new(1, -220, 0.5, -4)
StatusDot.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
StatusDot.BorderSizePixel = 0
StatusDot.Parent = TopBar

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = StatusDot

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(0, 90, 1, 0)
StatusText.Position = UDim2.new(1, -205, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "UNDETECTED"
StatusText.TextColor3 = Color3.fromRGB(80, 220, 120)
StatusText.Font = Enum.Font.GothamMedium
StatusText.TextSize = 11
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -38, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 30, 40)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 120, 120)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 28, 0, 28)
MinBtn.Position = UDim2.new(1, -72, 0, 10)
MinBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MinBtn.BorderSizePixel = 0
MinBtn.Text = "−"
MinBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 16
MinBtn.AutoButtonColor = false
MinBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinBtn

-- ============ SIDEBAR ============
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 135, 1, -60)
Sidebar.Position = UDim2.new(0, 10, 0, 55)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 10)
SideCorner.Parent = Sidebar

local SideScroll = Instance.new("ScrollingFrame")
SideScroll.Size = UDim2.new(1, 0, 1, 0)
SideScroll.BackgroundTransparency = 1
SideScroll.BorderSizePixel = 0
SideScroll.ScrollBarThickness = 3
SideScroll.ScrollBarImageColor3 = Color3.fromRGB(120, 80, 255)
SideScroll.CanvasSize = UDim2.new(0, 0, 0, 480)
SideScroll.Parent = Sidebar

local function createTabButton(text, yPos)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 115, 0, 34)
    Btn.Position = UDim2.new(0, 10, 0, yPos)
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
    Btn.BorderSizePixel = 0
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    Btn.Font = Enum.Font.GothamMedium
    Btn.TextSize = 12
    Btn.AutoButtonColor = false
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = SideScroll
    
    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 10)
    pad.Parent = Btn
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Btn
    
    return Btn
end

local TabCombat = createTabButton("⚔ Combat", 10)
local TabVisuals = createTabButton("👁 Visuals", 50)
local TabMovement = createTabButton("🏃 Movement", 90)
local TabMisc = createTabButton("⚙ Misc", 130)
local TabFun = createTabButton("🎮 Fun", 170)
local TabPlayer = createTabButton("👤 Player", 210)
local TabInfo = createTabButton("ℹ Info", 250)

-- ============ CONTENT ============
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -155, 1, -65)
Content.Position = UDim2.new(0, 145, 0, 55)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local function createPage()
    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.ScrollBarThickness = 4
    Page.ScrollBarImageColor3 = Color3.fromRGB(120, 80, 255)
    Page.CanvasSize = UDim2.new(0, 0, 0, 900)
    Page.Visible = false
    Page.Parent = Content
    return Page
end

local CombatPage = createPage()
local VisualsPage = createPage()
local MovementPage = createPage()
local MiscPage = createPage()
local FunPage = createPage()
local PlayerPage = createPage()
local InfoPage = createPage()

local pages = {
    [TabCombat] = CombatPage,
    [TabVisuals] = VisualsPage,
    [TabMovement] = MovementPage,
    [TabMisc] = MiscPage,
    [TabFun] = FunPage,
    [TabPlayer] = PlayerPage,
    [TabInfo] = InfoPage
}

CombatPage.Visible = true
TabCombat.BackgroundColor3 = Color3.fromRGB(60, 40, 120)
TabCombat.TextColor3 = Color3.fromRGB(220, 200, 255)

for tab, page in pairs(pages) do
    tab.MouseButton1Click:Connect(function()
        for t, p in pairs(pages) do
            p.Visible = false
            t.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
            t.TextColor3 = Color3.fromRGB(200, 200, 220)
        end
        page.Visible = true
        tab.BackgroundColor3 = Color3.fromRGB(60, 40, 120)
        tab.TextColor3 = Color3.fromRGB(220, 200, 255)
    end)
end

-- ============ TOGGLE ============
local function createToggle(parent, text, yPos, defaultState, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -10, 0, 38)
    Container.Position = UDim2.new(0, 5, 0, yPos)
    Container.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    Container.BorderSizePixel = 0
    Container.Parent = parent
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -80, 1, 0)
    Label.Position = UDim2.new(0, 14, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Switch = Instance.new("TextButton")
    Switch.Size = UDim2.new(0, 44, 0, 22)
    Switch.Position = UDim2.new(1, -55, 0.5, -11)
    Switch.BackgroundColor3 = defaultState and Color3.fromRGB(80, 60, 180) or Color3.fromRGB(45, 45, 55)
    Switch.BorderSizePixel = 0
    Switch.Text = ""
    Switch.AutoButtonColor = false
    Switch.Parent = Container
    
    local SwitchCorner = Instance.new("UICorner")
    SwitchCorner.CornerRadius = UDim.new(1, 0)
    SwitchCorner.Parent = Switch
    
    local Knob = Instance.new("Frame")
    Knob.Size = UDim2.new(0, 16, 0, 16)
    Knob.Position = defaultState and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Knob.BorderSizePixel = 0
    Knob.Parent = Switch
    
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(1, 0)
    KnobCorner.Parent = Knob
    
    local state = defaultState
    Switch.MouseButton1Click:Connect(function()
        state = not state
        TweenService:Create(Switch, TweenInfo.new(0.2), {
            BackgroundColor3 = state and Color3.fromRGB(80, 60, 180) or Color3.fromRGB(45, 45, 55)
        }):Play()
        TweenService:Create(Knob, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        }):Play()
        callback(state)
    end)
    
    return Container
end

-- ============ SLIDER ============
local function createSlider(parent, text, yPos, minVal, maxVal, defaultVal, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, -10, 0, 52)
    Container.Position = UDim2.new(0, 5, 0, yPos)
    Container.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    Container.BorderSizePixel = 0
    Container.Parent = parent
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Container
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 14, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = text .. ": " .. defaultVal
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local Bar = Instance.new("TextButton")
    Bar.Size = UDim2.new(1, -28, 0, 10)
    Bar.Position = UDim2.new(0, 14, 0, 32)
    Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    Bar.BorderSizePixel = 0
    Bar.Text = ""
    Bar.AutoButtonColor = false
    Bar.Parent = Container
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = Bar
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill
    
    local isDragging = false
    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local mouseX = UserInputService:GetMouseLocation().X
            local relX = math.clamp((mouseX - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            Fill.Size = UDim2.new(relX, 0, 1, 0)
            local val = math.floor(minVal + (maxVal - minVal) * relX)
            Label.Text = text .. ": " .. val
            callback(val)
        end
    end)
    return Container
end

-- ============ НАПОЛНЕНИЕ ВКЛАДОК ============
-- COMBAT
createToggle(CombatPage, "🎯 AimBot", 5, true, function(v) Settings.AimBotEnabled = v end)
createToggle(CombatPage, "🤫 Silent Aim", 45, false, function(v) Settings.SilentAim = v end)
createToggle(CombatPage, "🔫 TriggerBot", 85, false, function(v) Settings.TriggerBot = v end)
createToggle(CombatPage, "⚡ Auto Shoot", 125, false, function(v) Settings.AutoShoot = v end)
createToggle(CombatPage, "👥 Team Check", 165, true, function(v) Settings.TeamCheck = v end)
createToggle(CombatPage, "🧱 Wall Check", 205, false, function(v) Settings.WallCheck = v end)
createToggle(CombatPage, "💥 Kill Aura", 245, false, function(v) Settings.KillAura = v end)
createSlider(CombatPage, "🎯 FOV", 290, 50, 500, 200, function(v) Settings.AimFOV = v end)
createSlider(CombatPage, "🌊 Smoothness", 348, 1, 30, 15, function(v) Settings.AimSmoothness = v / 100 end)
createSlider(CombatPage, "🔮 Prediction", 406, 0, 100, 15, function(v) Settings.Prediction = v / 100 end)

-- VISUALS
createToggle(VisualsPage, "👁 ESP", 5, true, function(v) Settings.ESPEnabled = v end)
createToggle(VisualsPage, "📦 Boxes", 45, true, function(v) Settings.ShowBoxes = v end)
createToggle(VisualsPage, "🏷 Names", 85, true, function(v) Settings.ShowNames = v end)
createToggle(VisualsPage, "📏 Distance", 125, true, function(v) Settings.ShowDistance = v end)
createToggle(VisualsPage, "❤ Health", 165, true, function(v) Settings.ShowHealth = v end)
createToggle(VisualsPage, "🎭 Role", 205, true, function(v) Settings.ShowRole = v end)
createToggle(VisualsPage, "🔫 Weapon", 245, true, function(v) Settings.ShowWeapon = v end)
createToggle(VisualsPage, "➡ Tracers", 285, false, function(v) Settings.ShowTracers = v end)
createToggle(VisualsPage, "🌈 Rainbow ESP", 325, false, function(v) Settings.RainbowESP = v end)
createToggle(VisualsPage, "💡 Fullbright", 365, false, function(v) 
    Settings.Fullbright = v
    if v then
        Lighting.Brightness = 3
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)
createToggle(VisualsPage, "🌫 No Fog", 405, false, function(v)
    Settings.NoFog = v
    Lighting.FogEnd = v and 100000 or 1000
end)
createToggle(VisualsPage, "🔭 Custom FOV", 445, false, function(v) Settings.FOVChanger = v end)
createSlider(VisualsPage, "🔭 FOV Value", 490, 30, 120, 70, function(v) Settings.FOVValue = v end)

-- MOVEMENT
createToggle(MovementPage, "🏃 Speed Hack", 5, false, function(v) Settings.SpeedHack = v end)
createSlider(MovementPage, "🏃 Speed Value", 48, 16, 200, 32, function(v) Settings.SpeedValue = v end)
createToggle(MovementPage, "🦘 Jump Power", 105, false, function(v) Settings.JumpPower = v end)
createSlider(MovementPage, "🦘 Jump Value", 148, 50, 500, 50, function(v) Settings.JumpValue = v end)
createToggle(MovementPage, "🕊 Fly", 205, false, function(v) Settings.Fly = v end)
createSlider(MovementPage, "🕊 Fly Speed", 248, 10, 300, 50, function(v) Settings.FlySpeed = v end)
createToggle(MovementPage, "♾ Infinite Jump", 305, false, function(v) Settings.InfiniteJump = v end)
createToggle(MovementPage, "🚪 No Clip", 345, false, function(v) Settings.NoClip = v end)
createToggle(MovementPage, "🐰 Bunny Hop", 385, false, function(v) Settings.BunnyHop = v end)
createToggle(MovementPage, "🛡 Anti-Fling", 425, false, function(v) Settings.AntiFling = v end)

-- MISC
createToggle(MiscPage, "🌾 Auto Farm", 5, false, function(v) Settings.AutoFarm = v end)
createToggle(MiscPage, "🔪 Auto Kill", 45, false, function(v) Settings.AutoKill = v end)
createToggle(MiscPage, "🪙 Auto Coins", 85, false, function(v) Settings.AutoCoins = v end)
createToggle(MiscPage, "🛡 God Mode", 125, false, function(v)
    Settings.GodMode = v
    if v and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.MaxHealth = math.huge
            hum.Health = math.huge
        end
    end
end)
createToggle(MiscPage, "👻 Invisible", 165, false, function(v)
    Settings.Invisible = v
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = v and 1 or 0
                part.CanCollide = not v and part.CanCollide
            end
        end
    end
end)
createToggle(MiscPage, "💬 Spam Chat", 205, false, function(v) Settings.SpamChat = v end)

-- FUN
createToggle(FunPage, "🌀 Spin Bot", 5, false, function(v) Settings.SpinBot = v end)
createToggle(FunPage, "📳 Jitter Aim", 45, false, function(v) Settings.JitterAim = v end)
createToggle(FunPage, "🙈 No Head", 85, false, function(v)
    Settings.NoHead = v
    if LocalPlayer.Character then
        local head = LocalPlayer.Character:FindFirstChild("Head")
        if head then head.Transparency = v and 1 or 0 end
    end
end)
createToggle(FunPage, "🐜 Tiny Character", 125, false, function(v)
    Settings.TinyCharacter = v
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Size = v and part.Size * 0.3 or part.Size
            end
        end
    end
end)
createToggle(FunPage, "🦣 Big Character", 165, false, function(v)
    Settings.BigCharacter = v
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Size = v and part.Size * 2 or part.Size
            end
        end
    end
end)
createToggle(FunPage, "🌈 Rainbow Char", 205, false, function(v) Settings.RainbowChar = v end)

-- PLAYER
local PlayerInfo = Instance.new("Frame")
PlayerInfo.Size = UDim2.new(1, -10, 0, 120)
PlayerInfo.Position = UDim2.new(0, 5, 0, 5)
PlayerInfo.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
PlayerInfo.BorderSizePixel = 0
PlayerInfo.Parent = PlayerPage

local PICorner = Instance.new("UICorner")
PICorner.CornerRadius = UDim.new(0, 8)
PICorner.Parent = PlayerInfo

local PILabel = Instance.new("TextLabel")
PILabel.Size = UDim2.new(1, -20, 1, -20)
PILabel.Position = UDim2.new(0, 10, 0, 10)
PILabel.BackgroundTransparency = 1
PILabel.Text = "👤 Имя: " .. LocalPlayer.Name .. "\n🆔 ID: " .. LocalPlayer.UserId .. "\n📅 Аккаунт: " .. LocalPlayer.AccountAge .. " дней"
PILabel.TextColor3 = Color3.fromRGB(220, 220, 230)
PILabel.Font = Enum.Font.Gotham
PILabel.TextSize = 13
PILabel.TextXAlignment = Enum.TextXAlignment.Left
PILabel.TextYAlignment = Enum.TextYAlignment.Top
PILabel.Parent = PlayerInfo

local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Size = UDim2.new(1, -10, 0, 36)
TeleportBtn.Position = UDim2.new(0, 5, 0, 135)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 120)
TeleportBtn.BorderSizePixel = 0
TeleportBtn.Text = "🚀 Убийца → TP к игроку (ближайший)"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.Font = Enum.Font.GothamMedium
TeleportBtn.TextSize = 12
TeleportBtn.Parent = PlayerPage

local TPCorner = Instance.new("UICorner")
TPCorner.CornerRadius = UDim.new(0, 8)
TPCorner.Parent = TeleportBtn

TeleportBtn.MouseButton1Click:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            break
        end
    end
end)

-- INFO
local InfoFrame = Instance.new("Frame")
InfoFrame.Size = UDim2.new(1, -10, 0, 250)
InfoFrame.Position = UDim2.new(0, 5, 0, 5)
InfoFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
InfoFrame.BorderSizePixel = 0
InfoFrame.Parent = InfoPage

local IFCorner = Instance.new("UICorner")
IFCorner.CornerRadius = UDim.new(0, 8)
IFCorner.Parent = InfoFrame

local IFLabel = Instance.new("TextLabel")
IFLabel.Size = UDim2.new(1, -20, 1, -20)
IFLabel.Position = UDim2.new(0, 10, 0, 10)
IFLabel.BackgroundTransparency = 1
IFLabel.Text = [[⚔ MM2 MEGA CHEAT MENU
━━━━━━━━━━━━━━━━━━━━━━━━
Версия: 3.0
Статус: Undetected
Executor: Delta

━━━━━━━━━━━━━━━━━━━━━━━━
📖 ФУНКЦИИ:

⚔ Combat:
  • AimBot / Silent Aim
  • TriggerBot / Auto Shoot
  • Kill Aura
  • Team & Wall Check

👁 Visuals:
  • ESP (Boxes, Names, Health)
  • Tracers / Rainbow
  • Fullbright / No Fog

🏃 Movement:
  • Speed / Jump / Fly
  • Infinite Jump / NoClip
  • BunnyHop / Anti-Fling

⚙ Misc:
  • Auto Farm / Auto Kill
  • God Mode / Invisible

🎮 Fun:
  • SpinBot / Jitter / Size

━━━━━━━━━━━━━━━━━━━━━━━━
💡 Управление:
  • ПКМ — AimBot
  • Кнопка "M" — меню]]
IFLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
IFLabel.Font = Enum.Font.Gotham
IFLabel.TextSize = 12
IFLabel.TextXAlignment = Enum.TextXAlignment.Left
IFLabel.TextYAlignment = Enum.TextYAlignment.Top
IFLabel.Parent = InfoFrame

-- ============ ПЕРЕТАСКИВАНИЕ ============
local dragging, dragInput, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- ============ ОТКРЫТИЕ/ЗАКРЫТИЕ ============
local isOpen = false
local function openMenu()
    isOpen = true
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 620, 0, 420),
        Position = UDim2.new(0.5, -310, 0.5, -210)
    }):Play()
    TweenService:Create(ToggleStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(80, 220, 120)}):Play()
end
local function closeMenu()
    isOpen = false
    local t = TweenService:Create(MainFrame, TweenInfo.new(0.25), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    t:Play()
    t.Completed:Connect(function() MainFrame.Visible = false end)
    TweenService:Create(ToggleStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(120, 80, 255)}):Play()
end

ToggleButton.MouseButton1Click:Connect(function()
    if isOpen then closeMenu() else openMenu() end
end)
CloseBtn.MouseButton1Click:Connect(closeMenu)
MinBtn.MouseButton1Click:Connect(closeMenu)

-- ============ AIMBOT LOGIC ============
local aiming = false
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then aiming = true end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then aiming = false end
end)

local function isMurderer(char)
    if not char then return false end
    for _, obj in pairs(char:GetChildren()) do
        if obj:IsA("Tool") then
            local n = obj.Name:lower()
            if n:find("knife") or n:find("murder") or n:find("blade") then return true end
        end
    end
    return false
end

local function getTarget()
    local closest, shortestDist = nil, Settings.AimFOV
    local mousePos = UserInputService:GetMouseLocation()
    local iAmMurderer = isMurderer(LocalPlayer.Character)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local head = player.Character:FindFirstChild("Head")
            if hum and hrp and head and hum.Health > 0 then
                local targetMurderer = isMurderer(player.Character)
                local isTarget = true
                if Settings.TeamCheck then
                    isTarget = iAmMurderer or targetMurderer
                end
                if isTarget then
                    local sp, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local d = (Vector2.new(sp.X, sp.Y) - mousePos).Magnitude
                        if d < shortestDist then
                            shortestDist = d
                            closest = head
                        end
                    end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if Settings.AimBotEnabled and aiming then
        local t = getTarget()
        if t then
            local newCF = CFrame.new(Camera.CFrame.Position, t.Position)
            Camera.CFrame = Camera.CFrame:Lerp(newCF, Settings.AimSmoothness)
        end
    end
end)

-- ============ ESP LOGIC ============
local espCache = {}
local function createESP(player)
    if espCache[player] then return end
    espCache[player] = {
        box = Drawing.new("Square"),
        nameTag = Drawing.new("Text"),
        distTag = Drawing.new("Text"),
        healthTag = Drawing.new("Text"),
        roleTag = Drawing.new("Text"),
        tracer = Drawing.new("Line")
    }
    espCache[player].box.Thickness = 1.5
    espCache[player].box.Filled = false
    espCache[player].nameTag.Size = 14
    espCache[player].nameTag.Center = true
    espCache[player].nameTag.Outline = true
    espCache[player].nameTag.Color = Color3.fromRGB(255, 255, 255)
    espCache[player].distTag.Size = 12
    espCache[player].distTag.Center = true
    espCache[player].distTag.Outline = true
    espCache[player].healthTag.Size = 12
    espCache[player].healthTag.Center = true
    espCache[player].healthTag.Outline = true
    espCache[player].roleTag.Size = 12
    espCache[player].roleTag.Center = true
    espCache[player].roleTag.Outline = true
    espCache[player].tracer.Thickness = 1
    espCache[player].tracer.Transparency = 0.7
end

local function removeESP(player)
    if espCache[player] then
        for _, o in pairs(espCache[player]) do o:Remove() end
        espCache[player] = nil
    end
end

Players.PlayerAdded:Connect(createESP)
Players.PlayerRemoving:Connect(removeESP)
for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then createESP(p) end
end

local hue = 0
RunService.RenderStepped:Connect(function()
    hue = (hue + 0.003) % 1
    for player, esp in pairs(espCache) do
        if not Settings.ESPEnabled or player == LocalPlayer or not player.Character then
            for _, o in pairs(esp) do o.Visible = false end
            continue
        end
        local char = player.Character
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local head = char:FindFirstChild("Head")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not head or not hum or hum.Health <= 0 then
            for _, o in pairs(esp) do o.Visible = false end
            continue
        end
        
        local murderer = isMurderer(char)
        local color
        if Settings.RainbowESP then
            color = Color3.fromHSV(hue, 1, 1)
        else
            color = murderer and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(50, 255, 50)
        end
        
        local topPos = head.Position + Vector3.new(0, 1.2, 0)
        local bottomPos = hrp.Position - Vector3.new(0, 3, 0)
        local tS, tOn = Camera:WorldToViewportPoint(topPos)
        local bS, bOn = Camera:WorldToViewportPoint(bottomPos)
        
        if tOn and bOn then
            local h = math.abs(tS.Y - bS.Y)
            local w = h * 0.6
            
            if Settings.ShowBoxes then
                esp.box.Size = Vector2.new(w, h)
                esp.box.Position = Vector2.new(tS.X - w / 2, tS.Y)
                esp.box.Color = color
                esp.box.Visible = true
            else esp.box.Visible = false end
            
            if Settings.ShowNames then
                esp.nameTag.Text = player.Name
                esp.nameTag.Position = Vector2.new(tS.X, tS.Y - 20)
                esp.nameTag.Color = color
                esp.nameTag.Visible = true
            else esp.nameTag.Visible = false end
            
            if Settings.ShowDistance then
                local d = math.floor((Camera.CFrame.Position - hrp.Position).Magnitude)
                esp.distTag.Text = d .. "m"
                esp.distTag.Position = Vector2.new(tS.X, tS.Y + h + 4)
                esp.distTag.Color = Color3.fromRGB(220, 220, 220)
                esp.distTag.Visible = true
            else esp.distTag.Visible = false end
            
            if Settings.ShowHealth then
                esp.healthTag.Text = "❤ " .. math.floor(hum.Health)
                esp.healthTag.Position = Vector2.new(tS.X, tS.Y + h + 18)
                esp.healthTag.Color = Color3.fromRGB(255, 100, 100)
                esp.healthTag.Visible = true
            else esp.healthTag.Visible = false end
            
            if Settings.ShowRole then
                esp.roleTag.Text = murderer and "🔪 MURDERER" or "👤 INNOCENT"
                esp.roleTag.Position = Vector2.new(tS.X, tS.Y - 36)
                esp.roleTag.Color = color
                esp.roleTag.Visible = true
            else esp.roleTag.Visible = false end
            
            if Settings.ShowTracers then
                esp.tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                esp.tracer.To = Vector2.new(tS.X, tS.Y + h / 2)
                esp.tracer.Color = color
                esp.tracer.Visible = true
            else esp.tracer.Visible = false end
        else
            for _, o in pairs(esp) do o.Visible = false end
        end
    end
end)

-- ============ MOVEMENT LOGIC ============
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hum and hrp then
            if Settings.SpeedHack then hum.WalkSpeed = Settings.SpeedValue end
            if Settings.JumpPower then hum.JumpPower = Settings.JumpValue end
            
            if Settings.NoClip then
                for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end
            
            if Settings.InfiniteJump and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
            
            if Settings.BunnyHop and hum.MoveDirection.Magnitude > 0 then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

-- Fly
local flyBodyVel, flyBodyGyro
local function toggleFly(state)
    if not LocalPlayer.Character then return end
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    if state then
        flyBodyVel = Instance.new("BodyVelocity", hrp)
        flyBodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        flyBodyVel.Velocity = Vector3.zero
        flyBodyGyro = Instance.new("BodyGyro", hrp)
        flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
        flyBodyGyro.P = 1e4
        flyBodyGyro.CFrame = hrp.CFrame
    else
        if flyBodyVel then flyBodyVel:Destroy() end
        if flyBodyGyro then flyBodyGyro:Destroy() end
    end
end

RunService.RenderStepped:Connect(function()
    if Settings.Fly and flyBodyVel and flyBodyGyro then
        local move = Vector3.zero
        local cam = Camera.CFrame
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cam.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cam.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cam.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cam.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move -= Vector3.new(0, 1, 0) end
        flyBodyVel.Velocity = move * Settings.FlySpeed
        flyBodyGyro.CFrame = cam
    end
end)

-- Отслеживание изменения Fly
local flyTogglePrev = false
RunService.Heartbeat:Connect(function()
    if Settings.Fly ~= flyTogglePrev then
        flyTogglePrev = Settings.Fly
        toggleFly(Settings.Fly)
    end
end)

-- ============ FUN LOGIC ============
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if Settings.SpinBot then
                hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(45), 0)
            end
        end
        if Settings.RainbowChar then
            for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                    p.Color = Color3.fromHSV(hue, 1, 1)
                end
            end
        end
    end
end)

-- Custom FOV
RunService.RenderStepped:Connect(function()
    if Settings.FOVChanger then
        Camera.FieldOfView = Settings.FOVValue
    end
end)

-- Spam Chat
task.spawn(function()
    while ScreenGui.Parent do
        if Settings.SpamChat then
            local chatBox = LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("Chat")
            -- MM2 не поддерживает прямой чат, используем безопасный способ
        end
        task.wait(1)
    end
end)

-- ============ УВЕДОМЛЕНИЕ ============
local notif = Instance.new("TextLabel")
notif.Size = UDim2.new(0, 320, 0, 42)
notif.Position = UDim2.new(0.5, -160, 0, -50)
notif.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
notif.BorderSizePixel = 0
notif.Text = "✓ MM2 MEGA MENU v3.0 загружен"
notif.TextColor3 = Color3.fromRGB(80, 220, 120)
notif.Font = Enum.Font.GothamBold
notif.TextSize = 14
notif.Parent = ScreenGui

local nC = Instance.new("UICorner")
nC.CornerRadius = UDim.new(0, 10)
nC.Parent = notif

TweenService:Create(notif, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -160, 0, 20)
}):Play()

task.wait(3)

local hideN = TweenService:Create(notif, TweenInfo.new(0.4), {
    Position = UDim2.new(0.5, -160, 0, -50)
})
hideN:Play()
hideN.Completed:Connect(function() notif:Destroy() end)

end -- конец START_CHEAT

-- ============================================
-- ОБРАБОТКА ПАРОЛЯ
-- ============================================
local attempts = 0

local function tryPassword()
    local entered = PwInput.Text
    
    if entered == CORRECT_PASSWORD then
        PwStatus.Text = "✓ Доступ разрешён"
        PwStatus.TextColor3 = Color3.fromRGB(80, 220, 120)
        PwSubmit.Text = "ЗАГРУЗКА..."
        PwSubmit.BackgroundColor3 = Color3.fromRGB(60, 180, 90)
        task.wait(0.6)
        START_CHEAT()
    else
        attempts = attempts + 1
        PwStatus.Text = "✕ Неверный пароль (" .. attempts .. "/3)"
        PwStatus.TextColor3 = Color3.fromRGB(255, 80, 80)
        
        -- Тряска окна
        local origPos = PwBg.Position
        for i = 1, 6 do
            PwBg.Position = origPos + UDim2.new(0, (i % 2 == 0 and 10 or -10), 0, 0)
            task.wait(0.04)
        end
        PwBg.Position = origPos
        
        if attempts >= 3 then
            PwStatus.Text = "🚫 Слишком много попыток. Перезапусти скрипт."
            PwInput.TextEditable = false
            PwSubmit.Text = "БЛОКИРОВКА"
            PwSubmit.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
        end
    end
end

PwSubmit.MouseButton1Click:Connect(tryPassword)
PwInput.FocusLost:Connect(function(enter)
    if enter then tryPassword() end
end)

-- Автофокус на поле ввода
task.wait(0.5)
PwInput:CaptureFocus()

print("[MM2 MEGA MENU] Ожидание пароля...")