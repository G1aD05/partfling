-- Modern Part Fling GUI (Fixed)
-- Sleek dark theme with glassmorphism effects

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- ==================== UTILITY FUNCTIONS ====================
local function Create(instanceType, properties)
    local instance = Instance.new(instanceType)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    return instance
end

local function Tween(obj, properties, duration, easingStyle, easingDirection)
    duration = duration or 0.3
    easingStyle = easingStyle or Enum.EasingStyle.Quad
    easingDirection = easingDirection or Enum.EasingDirection.Out
    TweenService:Create(obj, TweenInfo.new(duration, easingStyle, easingDirection), properties):Play()
end

-- ==================== THEME COLORS ====================
local Colors = {
    Background = Color3.fromRGB(15, 15, 20),
    Surface = Color3.fromRGB(25, 25, 35),
    SurfaceHover = Color3.fromRGB(35, 35, 50),
    Accent = Color3.fromRGB(124, 77, 255),
    AccentGlow = Color3.fromRGB(150, 100, 255),
    Success = Color3.fromRGB(0, 230, 118),
    Danger = Color3.fromRGB(255, 82, 82),
    Warning = Color3.fromRGB(255, 171, 64),
    Text = Color3.fromRGB(245, 245, 245),
    TextDim = Color3.fromRGB(150, 150, 170),
    TextDark = Color3.fromRGB(100, 100, 120),
    Glass = Color3.fromRGB(30, 30, 45),
    Border = Color3.fromRGB(50, 50, 70)
}

-- ==================== SCREEN GUI ====================
local ScreenGui = Create("ScreenGui", {
    Name = "ModernFlingGUI",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    Parent = PlayerGui
})

-- ==================== MAIN FRAME ====================
local MainFrame = Create("Frame", {
    Name = "MainFrame",
    Size = UDim2.new(0, 380, 0, 480),
    Position = UDim2.new(0.5, -190, 0.5, -240),
    BackgroundColor3 = Colors.Background,
    BackgroundTransparency = 0.15,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    Parent = ScreenGui
})

local MainCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 16),
    Parent = MainFrame
})

local GlassOverlay = Create("Frame", {
    Name = "GlassOverlay",
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Colors.Glass,
    BackgroundTransparency = 0.7,
    BorderSizePixel = 0,
    Parent = MainFrame
})

local GlassCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 16),
    Parent = GlassOverlay
})

local Gradient = Create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(124, 77, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 15, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 35))
    }),
    Rotation = 45,
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.9),
        NumberSequenceKeypoint.new(0.3, 1),
        NumberSequenceKeypoint.new(1, 1)
    }),
    Parent = MainFrame
})

local Stroke = Create("UIStroke", {
    Color = Colors.Border,
    Thickness = 1.5,
    Transparency = 0.5,
    Parent = MainFrame
})

-- Shadow
local Shadow = Create("ImageLabel", {
    Name = "Shadow",
    Size = UDim2.new(1, 60, 1, 60),
    Position = UDim2.new(0, -30, 0, -30),
    BackgroundTransparency = 1,
    Image = "rbxassetid://131604521",
    ImageColor3 = Color3.fromRGB(0, 0, 0),
    ImageTransparency = 0.85,
    ScaleType = Enum.ScaleType.Slice,
    SliceCenter = Rect.new(20, 20, 280, 280),
    ZIndex = -1,
    Parent = MainFrame
})

-- ==================== TITLE BAR ====================
local TitleBar = Create("Frame", {
    Name = "TitleBar",
    Size = UDim2.new(1, 0, 0, 50),
    BackgroundColor3 = Colors.Surface,
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0,
    Parent = MainFrame
})

local TitleCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 16),
    Parent = TitleBar
})

local TitleFade = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 20),
    Position = UDim2.new(0, 0, 1, -20),
    BackgroundColor3 = Colors.Surface,
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0,
    Parent = TitleBar
})

local AccentLine = Create("Frame", {
    Size = UDim2.new(1, -40, 0, 2),
    Position = UDim2.new(0, 20, 1, -1),
    BackgroundColor3 = Colors.Accent,
    BackgroundTransparency = 0.3,
    BorderSizePixel = 0,
    Parent = TitleBar
})

local AccentLineCorner = Create("UICorner", {
    CornerRadius = UDim.new(1, 0),
    Parent = AccentLine
})

local TitleIcon = Create("TextLabel", {
    Size = UDim2.new(0, 30, 0, 30),
    Position = UDim2.new(0, 15, 0, 10),
    BackgroundTransparency = 1,
    Text = "⚡",
    TextColor3 = Colors.AccentGlow,
    TextSize = 20,
    Font = Enum.Font.GothamBold,
    Parent = TitleBar
})

local TitleText = Create("TextLabel", {
    Size = UDim2.new(0, 200, 0, 30),
    Position = UDim2.new(0, 50, 0, 10),
    BackgroundTransparency = 1,
    Text = "PART FLING",
    TextColor3 = Colors.Text,
    TextSize = 18,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar
})

local SubtitleText = Create("TextLabel", {
    Size = UDim2.new(0, 200, 0, 15),
    Position = UDim2.new(0, 50, 0, 32),
    BackgroundTransparency = 1,
    Text = "v2.0 | Modern Edition",
    TextColor3 = Colors.TextDim,
    TextSize = 10,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = TitleBar
})

-- Close button
local CloseButton = Create("TextButton", {
    Size = UDim2.new(0, 32, 0, 32),
    Position = UDim2.new(1, -42, 0, 9),
    BackgroundColor3 = Colors.Danger,
    BackgroundTransparency = 0.8,
    Text = "✕",
    TextColor3 = Colors.Danger,
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    Parent = TitleBar
})

local CloseCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = CloseButton
})

-- Minimize button
local MinimizeButton = Create("TextButton", {
    Size = UDim2.new(0, 32, 0, 32),
    Position = UDim2.new(1, -80, 0, 9),
    BackgroundColor3 = Colors.Warning,
    BackgroundTransparency = 0.8,
    Text = "−",
    TextColor3 = Colors.Warning,
    TextSize = 18,
    Font = Enum.Font.GothamBold,
    Parent = TitleBar
})

local MinimizeCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = MinimizeButton
})

-- ==================== CONTENT AREA ====================
local ContentFrame = Create("Frame", {
    Name = "ContentFrame",
    Size = UDim2.new(1, -30, 1, -70),
    Position = UDim2.new(0, 15, 0, 60),
    BackgroundTransparency = 1,
    Parent = MainFrame
})

-- ==================== STATUS CARD ====================
local StatusCard = Create("Frame", {
    Name = "StatusCard",
    Size = UDim2.new(1, 0, 0, 80),
    BackgroundColor3 = Colors.Surface,
    BackgroundTransparency = 0.4,
    BorderSizePixel = 0,
    Parent = ContentFrame
})

local StatusCardCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 12),
    Parent = StatusCard
})

local StatusCardStroke = Create("UIStroke", {
    Color = Colors.Border,
    Thickness = 1,
    Transparency = 0.6,
    Parent = StatusCard
})

-- Status indicator
local StatusDot = Create("Frame", {
    Size = UDim2.new(0, 12, 0, 12),
    Position = UDim2.new(0, 15, 0, 18),
    BackgroundColor3 = Colors.Danger,
    BorderSizePixel = 0,
    Parent = StatusCard
})

local StatusDotCorner = Create("UICorner", {
    CornerRadius = UDim.new(1, 0),
    Parent = StatusDot
})

local StatusGlow = Create("Frame", {
    Size = UDim2.new(0, 20, 0, 20),
    Position = UDim2.new(0.5, -10, 0.5, -10),
    BackgroundColor3 = Colors.Danger,
    BackgroundTransparency = 0.8,
    BorderSizePixel = 0,
    Parent = StatusDot
})

local StatusGlowCorner = Create("UICorner", {
    CornerRadius = UDim.new(1, 0),
    Parent = StatusGlow
})

local StatusLabel = Create("TextLabel", {
    Size = UDim2.new(0, 150, 0, 20),
    Position = UDim2.new(0, 35, 0, 14),
    BackgroundTransparency = 1,
    Text = "IDLE",
    TextColor3 = Colors.Text,
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = StatusCard
})

local StatusDesc = Create("TextLabel", {
    Size = UDim2.new(1, -20, 0, 20),
    Position = UDim2.new(0, 15, 0, 45),
    BackgroundTransparency = 1,
    Text = "Ready to fling unwhitelisted players",
    TextColor3 = Colors.TextDim,
    TextSize = 12,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = StatusCard
})

-- ==================== WHITELIST SECTION ====================
local WhitelistSection = Create("Frame", {
    Name = "WhitelistSection",
    Size = UDim2.new(1, 0, 0, 60),
    Position = UDim2.new(0, 0, 0, 90),
    BackgroundTransparency = 1,
    Parent = ContentFrame
})

local WhitelistLabel = Create("TextLabel", {
    Size = UDim2.new(0, 100, 0, 18),
    Position = UDim2.new(0, 5, 0, 0),
    BackgroundTransparency = 1,
    Text = "WHITELIST",
    TextColor3 = Colors.TextDim,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = WhitelistSection
})

local WhitelistCard = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 35),
    Position = UDim2.new(0, 0, 0, 22),
    BackgroundColor3 = Colors.Surface,
    BackgroundTransparency = 0.5,
    BorderSizePixel = 0,
    Parent = WhitelistSection
})

local WhitelistCardCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 8),
    Parent = WhitelistCard
})

local WhitelistValue = Create("TextLabel", {
    Size = UDim2.new(1, -20, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    Text = "remembering_allofus",
    TextColor3 = Colors.AccentGlow,
    TextSize = 13,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = WhitelistCard
})

-- ==================== CONTROLS SECTION ====================
local ControlsSection = Create("Frame", {
    Name = "ControlsSection",
    Size = UDim2.new(1, 0, 0, 120),
    Position = UDim2.new(0, 0, 0, 160),
    BackgroundTransparency = 1,
    Parent = ContentFrame
})

local ControlsLabel = Create("TextLabel", {
    Size = UDim2.new(0, 100, 0, 18),
    Position = UDim2.new(0, 5, 0, 0),
    BackgroundTransparency = 1,
    Text = "CONTROLS",
    TextColor3 = Colors.TextDim,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = ControlsSection
})

-- Start Button - FIXED: Use a container for the glow so button size stays fixed
local StartButtonContainer = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 42),
    Position = UDim2.new(0, 0, 0, 25),
    BackgroundTransparency = 1,
    Parent = ControlsSection
})

local StartButton = Create("TextButton", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Colors.Success,
    BackgroundTransparency = 0.2,
    Text = "▶  START FLING",
    TextColor3 = Colors.Text,
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    Parent = StartButtonContainer
})

local StartCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = StartButton
})

local StartGradient = Create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 230, 118)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 83))
    }),
    Parent = StartButton
})

-- Glow is separate from button so it doesn't affect button size
local StartGlow = Create("Frame", {
    Size = UDim2.new(1, 6, 1, 6),
    Position = UDim2.new(0, -3, 0, -3),
    BackgroundColor3 = Colors.Success,
    BackgroundTransparency = 0.9,
    BorderSizePixel = 0,
    ZIndex = 0,
    Parent = StartButtonContainer
})

local StartGlowCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 12),
    Parent = StartGlow
})

-- Stop Button - FIXED
local StopButtonContainer = Create("Frame", {
    Size = UDim2.new(1, 0, 0, 42),
    Position = UDim2.new(0, 0, 0, 75),
    BackgroundTransparency = 1,
    Parent = ControlsSection
})

local StopButton = Create("TextButton", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = Colors.Danger,
    BackgroundTransparency = 0.2,
    Text = "⏹  STOP",
    TextColor3 = Colors.Text,
    TextSize = 14,
    Font = Enum.Font.GothamBold,
    Parent = StopButtonContainer
})

local StopCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = StopButton
})

local StopGradient = Create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 82, 82)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 50, 50))
    }),
    Parent = StopButton
})

-- ==================== STATS SECTION ====================
local StatsSection = Create("Frame", {
    Name = "StatsSection",
    Size = UDim2.new(1, 0, 0, 80),
    Position = UDim2.new(0, 0, 0, 290),
    BackgroundTransparency = 1,
    Parent = ContentFrame
})

local StatsLabel = Create("TextLabel", {
    Size = UDim2.new(0, 100, 0, 18),
    Position = UDim2.new(0, 5, 0, 0),
    BackgroundTransparency = 1,
    Text = "STATISTICS",
    TextColor3 = Colors.TextDim,
    TextSize = 10,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = StatsSection
})

local PartsCard = Create("Frame", {
    Size = UDim2.new(0.48, 0, 0, 50),
    Position = UDim2.new(0, 0, 0, 25),
    BackgroundColor3 = Colors.Surface,
    BackgroundTransparency = 0.5,
    BorderSizePixel = 0,
    Parent = StatsSection
})

local PartsCardCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = PartsCard
})

local PartsCount = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 25),
    Position = UDim2.new(0, 0, 0, 5),
    BackgroundTransparency = 1,
    Text = "0",
    TextColor3 = Colors.AccentGlow,
    TextSize = 20,
    Font = Enum.Font.GothamBold,
    Parent = PartsCard
})

local PartsLabel = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 18),
    Position = UDim2.new(0, 0, 0, 28),
    BackgroundTransparency = 1,
    Text = "Active Parts",
    TextColor3 = Colors.TextDim,
    TextSize = 11,
    Font = Enum.Font.Gotham,
    Parent = PartsCard
})

local FlungCard = Create("Frame", {
    Size = UDim2.new(0.48, 0, 0, 50),
    Position = UDim2.new(0.52, 0, 0, 25),
    BackgroundColor3 = Colors.Surface,
    BackgroundTransparency = 0.5,
    BorderSizePixel = 0,
    Parent = StatsSection
})

local FlungCardCorner = Create("UICorner", {
    CornerRadius = UDim.new(0, 10),
    Parent = FlungCard
})

local FlungCount = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 25),
    Position = UDim2.new(0, 0, 0, 5),
    BackgroundTransparency = 1,
    Text = "0",
    TextColor3 = Colors.Success,
    TextSize = 20,
    Font = Enum.Font.GothamBold,
    Parent = FlungCard
})

local FlungLabel = Create("TextLabel", {
    Size = UDim2.new(1, 0, 0, 18),
    Position = UDim2.new(0, 0, 0, 28),
    BackgroundTransparency = 1,
    Text = "Players Flung",
    TextColor3 = Colors.TextDim,
    TextSize = 11,
    Font = Enum.Font.Gotham,
    Parent = FlungCard
})

-- ==================== FOOTER ====================
local Footer = Create("Frame", {
    Size = UDim2.new(1, -30, 0, 25),
    Position = UDim2.new(0, 15, 1, -30),
    BackgroundTransparency = 1,
    Parent = MainFrame
})

local FooterText = Create("TextLabel", {
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundTransparency = 1,
    Text = "Press RightShift to toggle  •  Drag title to move",
    TextColor3 = Colors.TextDark,
    TextSize = 10,
    Font = Enum.Font.Gotham,
    TextXAlignment = Enum.TextXAlignment.Center,
    Parent = Footer
})

-- ==================== DRAG FUNCTIONALITY ====================
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

TitleBar.InputBegan:Connect(function(input)
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

TitleBar.InputChanged:Connect(function(input)
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

-- ==================== BUTTON ANIMATIONS - FIXED ====================
-- Store original sizes for reset
local StartOriginalSize = StartButton.Size
local StopOriginalSize = StopButton.Size

local function addModernHover(button, container, glowFrame)
    button.MouseEnter:Connect(function()
        Tween(button, {BackgroundTransparency = 0.1}, 0.2)
        if glowFrame then
            Tween(glowFrame, {BackgroundTransparency = 0.7}, 0.2)
        end
    end)
    button.MouseLeave:Connect(function()
        Tween(button, {BackgroundTransparency = 0.2}, 0.2)
        if glowFrame then
            Tween(glowFrame, {BackgroundTransparency = 0.9}, 0.2)
        end
    end)
    -- FIXED: Use a scale tween that properly resets, or just use position offset for press effect
    button.MouseButton1Down:Connect(function()
        -- Use Position offset instead of Size to avoid growing issue
        Tween(button, {Position = UDim2.new(0, 1, 0, 1), Size = UDim2.new(1, -2, 1, -2)}, 0.1)
    end)
    button.MouseButton1Up:Connect(function()
        Tween(button, {Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0)}, 0.1)
    end)
end

addModernHover(StartButton, StartButtonContainer, StartGlow)
addModernHover(StopButton, StopButtonContainer, nil)

-- Close button hover
CloseButton.MouseEnter:Connect(function()
    Tween(CloseButton, {BackgroundTransparency = 0.3}, 0.2)
end)
CloseButton.MouseLeave:Connect(function()
    Tween(CloseButton, {BackgroundTransparency = 0.8}, 0.2)
end)

-- Minimize button hover
MinimizeButton.MouseEnter:Connect(function()
    Tween(MinimizeButton, {BackgroundTransparency = 0.3}, 0.2)
end)
MinimizeButton.MouseLeave:Connect(function()
    Tween(MinimizeButton, {BackgroundTransparency = 0.8}, 0.2)
end)

-- ==================== CORE SCRIPT ====================
local isRunning = false
local flungCount = 0

local Plrs = game:GetService("Players")
local LP = Plrs.LocalPlayer
local Whitelist = {'remembering_allofus'}
local Parts = {}

local function runScript()
    Parts = {}

    do
        for _, Obj in pairs(workspace:WaitForChild("Structure"):GetDescendants()) do
            if Obj:IsA("BasePart") or Obj:IsA("Part") then
                Parts[#Parts+1] = {Obj, false}
            end
        end

        getgenv().CheckForMore = workspace.Structure.DescendantAdded:Connect(function(Obj)
            if Obj:IsA("BasePart") or Obj:IsA("Part") then
                if Parts == nil then getgenv().CheckForMore:Disconnect() return end
                table.insert(Parts, {Obj, false})
            end
        end)

        local function IfDestroy(Parent, Name)
            if Parent:FindFirstChild(Name) then
                Parent[Name]:Destroy()
            end
        end

        IfDestroy(workspace.Tower, 'Windows')
        IfDestroy(LP.Character, 'FallDamageScript')

        local Myhum = LP.Character.Humanoid
        Myhum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Myhum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        Myhum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)

        print'run'
    end
end

local function KillPlr(Part, PlayerHum)
    repeat
        Part.CanCollide = false
        task.wait()
        Part.Velocity = (PlayerHum.Position-Part.Position).Unit*(600)
    until isnetworkowner(Part) == false or PlayerHum.Parent == nil or PlayerHum.Parent.Humanoid.Health <= 0
    Part.CanCollide = true
    flungCount = flungCount + 1
    FlungCount.Text = tostring(flungCount)
end

local function mainLoop()
    while isRunning and #Parts > 2 do
        local i = 0
        for Int, Tab in pairs(Parts) do
            if not isRunning then break end

            local Part = Tab[1]
            i = i + 1
            if i % 120 == 0 then
                task.wait()
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1000)
                sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", 1000)
                task.wait(0.1)
            end

            PartsCount.Text = tostring(#Parts)

            if Part == nil or Part.Parent == nil then
                Parts[Int] = nil
            else
                if Part:IsGrounded() == false and isnetworkowner(Part) and Tab[2] == false then
                    Tab[2] = true
                    local PrevClosest = 1000
                    local PlayerHum

                    for _, Plr in ipairs(Plrs:GetChildren()) do
                        if Plr:IsA("Player") and not table.find(Whitelist, Plr.Name:lower()) and Plr.Character ~= nil and
                           Plr.Character:FindFirstChild("HumanoidRootPart") and
                           Plr.Character:FindFirstChild("Humanoid") and Plr.Character.Humanoid.Health > 0 then
                            local Hum = Plr.Character.HumanoidRootPart
                            local dis = (Hum.Position - Part.Position).Magnitude

                            if dis < PrevClosest then
                                PrevClosest = dis
                                PlayerHum = Hum
                            end
                        end
                    end

                    PrevClosest = nil

                    if PlayerHum then
                        local bambam = Instance.new("BodyThrust")
                        bambam.Parent = Part
                        bambam.Force = Vector3.new(99999, 99999 * 10, 99999)
                        bambam.Location = Part.Position
                        Part.CanCollide = false

                        coroutine.wrap(function()
                            KillPlr(Part, PlayerHum)
                            Tab[2] = false
                            return
                        end)()

                        task.wait()
                    end
                end
            end
        end
        task.wait(0)
    end

    if getgenv().CheckForMore then
        getgenv().CheckForMore:Disconnect()
    end
    PlayerHums, Parts, Plrs, viewPart, Whitelist, KillPlr = nil
end

-- ==================== BUTTON FUNCTIONALITY ====================
StartButton.MouseButton1Click:Connect(function()
    if isRunning then return end
    isRunning = true
    flungCount = 0
    FlungCount.Text = "0"

    StatusLabel.Text = "RUNNING"
    StatusLabel.TextColor3 = Colors.Success
    StatusDesc.Text = "Flinging unwhitelisted players..."
    StatusDot.BackgroundColor3 = Colors.Success
    StatusGlow.BackgroundColor3 = Colors.Success

    Tween(StartButton, {BackgroundTransparency = 0.5}, 0.2)
    Tween(StopButton, {BackgroundTransparency = 0.2}, 0.2)

    runScript()
    coroutine.wrap(mainLoop)()
end)

StopButton.MouseButton1Click:Connect(function()
    if not isRunning then return end
    isRunning = false

    StatusLabel.Text = "STOPPED"
    StatusLabel.TextColor3 = Colors.Danger
    StatusDesc.Text = "Script halted. Click START to resume."
    StatusDot.BackgroundColor3 = Colors.Danger
    StatusGlow.BackgroundColor3 = Colors.Danger

    Tween(StartButton, {BackgroundTransparency = 0.2}, 0.2)
    Tween(StopButton, {BackgroundTransparency = 0.5}, 0.2)

    if getgenv().CheckForMore then
        getgenv().CheckForMore:Disconnect()
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    isRunning = false
    if getgenv().CheckForMore then
        getgenv().CheckForMore:Disconnect()
    end

    Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
    task.wait(0.3)
    ScreenGui:Destroy()
end)

-- Minimize functionality
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Tween(MainFrame, {Size = UDim2.new(0, 380, 0, 50)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        ContentFrame.Visible = false
        Footer.Visible = false
        AccentLine.Visible = false
    else
        Tween(MainFrame, {Size = UDim2.new(0, 380, 0, 480)}, 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        task.wait(0.15)
        ContentFrame.Visible = true
        Footer.Visible = true
        AccentLine.Visible = true
    end
end)

-- ==================== TOGGLE GUI WITH KEYBIND ====================
local guiVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        guiVisible = not guiVisible
        if guiVisible then
            MainFrame.Visible = true
            Tween(MainFrame, {Size = UDim2.new(0, 380, 0, isMinimized and 50 or 480)}, 0.3)
        else
            Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In)
            task.wait(0.3)
            MainFrame.Visible = false
        end
    end
end)

-- ==================== INITIAL ANIMATION ====================
MainFrame.Size = UDim2.new(0, 0, 0, 0)
Tween(MainFrame, {Size = UDim2.new(0, 380, 0, 480)}, 0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

-- Subtle floating animation for the glow
local floatTime = 0
RunService.Heartbeat:Connect(function(dt)
    floatTime = floatTime + dt
    local glowAlpha = 0.7 + 0.1 * math.sin(floatTime * 2)
    if StatusGlow then
        StatusGlow.BackgroundTransparency = glowAlpha
    end
end)

print("✨ Modern Part Fling GUI loaded! Press RightShift to toggle.")
