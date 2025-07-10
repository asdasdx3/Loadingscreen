
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModernLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true -- This ensures it covers the full screen including topbar
screenGui.DisplayOrder = 999999 -- Maximum display order to be on top of everything
screenGui.Parent = playerGui


for _, gui in pairs(playerGui:GetChildren()) do
    if gui ~= screenGui and gui:IsA("ScreenGui") then
        gui.Enabled = false
    end
end


local StarterGui = game:GetService("StarterGui")
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)

-- Main background frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 100
mainFrame.Parent = screenGui


local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 25, 45))
}
gradient.Rotation = 45
gradient.Parent = mainFrame


local particleFrame = Instance.new("Frame")
particleFrame.Name = "ParticleFrame"
particleFrame.Size = UDim2.new(1, 0, 1, 0)
particleFrame.Position = UDim2.new(0, 0, 0, 0)
particleFrame.BackgroundTransparency = 1
particleFrame.ZIndex = 101
particleFrame.Parent = mainFrame


for i = 1, 20 do
    local particle = Instance.new("Frame")
    particle.Name = "Particle" .. i
    particle.Size = UDim2.new(0, math.random(2, 8), 0, math.random(2, 8))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    particle.BackgroundTransparency = 0.3
    particle.BorderSizePixel = 0
    particle.ZIndex = 102
    particle.Parent = particleFrame
    

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    

    local moveInfo = TweenInfo.new(
        math.random(5, 15),
        Enum.EasingStyle.Linear,
        Enum.EasingDirection.InOut,
        -1,
        true
    )
    local moveTween = TweenService:Create(particle, moveInfo, {
        Position = UDim2.new(math.random(), 0, math.random(), 0),
        BackgroundTransparency = math.random(0.1, 0.8)
    })
    moveTween:Play()
end


local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(0.8, 0, 0.6, 0)
contentFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.ZIndex = 110
contentFrame.Parent = mainFrame

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0.1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "LOADING"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.ZIndex = 111
titleLabel.Parent = contentFrame

-- Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Name = "SubtitleLabel"
subtitleLabel.Size = UDim2.new(1, 0, 0.1, 0)
subtitleLabel.Position = UDim2.new(0, 0, 0.3, 0)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Please wait while we prepare your experience..."
subtitleLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
subtitleLabel.TextScaled = true
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.ZIndex = 111
subtitleLabel.Parent = contentFrame

-- Progress bar container
local progressContainer = Instance.new("Frame")
progressContainer.Name = "ProgressContainer"
progressContainer.Size = UDim2.new(0.8, 0, 0.05, 0)
progressContainer.Position = UDim2.new(0.1, 0, 0.6, 0)
progressContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
progressContainer.BorderSizePixel = 0
progressContainer.ZIndex = 111
progressContainer.Parent = contentFrame

-- Progres
local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 25)
progressCorner.Parent = progressContainer

-- Progres bar fill
local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 112
progressBar.Parent = progressContainer

-- Progrs bar gard
local progressGradient = Instance.new("UIGradient")
progressGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 200))
}
progressGradient.Parent = progressBar

-- corn pan
local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(0, 25)
progressBarCorner.Parent = progressBar

-- Prog labs
local percentLabel = Instance.new("TextLabel")
percentLabel.Name = "PercentLabel"
percentLabel.Size = UDim2.new(1, 0, 0.08, 0)
percentLabel.Position = UDim2.new(0, 0, 0.7, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.GothamBold
percentLabel.ZIndex = 111
percentLabel.Parent = contentFrame

-- Status label
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(1, 0, 0.08, 0)
statusLabel.Position = UDim2.new(0, 0, 0.8, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Initializing..."
statusLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.ZIndex = 111
statusLabel.Parent = contentFrame

-- leading animation
local titleTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local titleTween = TweenService:Create(titleLabel, titleTweenInfo, {
    TextTransparency = 0.3
})
titleTween:Play()

-- varakes
local currentProgress = 0
local targetProgress = 0
local isStuck = false
local lastUpdateTime = tick()

— as tuba ow d
local function updateProgress()
    local currentTime = tick()
    
    -- 1% every 2 sec/
    if currentTime - lastUpdateTime >= 2 and not isStuck then
        lastUpdateTime = currentTime
        targetProgress = targetProgress + 1
        
        if targetProgress >= 89 then
            targetProgress = 89
            isStuck = true
            statusLabel.Text = "Bypassing Anti Cheat Wait Few Min"
            
            -- effect when stuck in a washing
            local pulseInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
            local pulseTween = TweenService:Create(statusLabel, pulseInfo, {
                TextTransparency = 0.5
            })
            pulseTween:Play()
        end
    end
    
    -- Smooth progress bar animation
    if currentProgress < targetProgress then
        currentProgress = math.min(currentProgress + 2, targetProgress) -- Faster catch-up
        
        local progressTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
        local progressTween = TweenService:Create(progressBar, progressTweenInfo, {
            Size = UDim2.new(currentProgress / 100, 0, 1, 0)
        })
        progressTween:Play()
        
        percentLabel.Text = math.floor(currentProgress) .. "%"
        
        -- Update status messages
        if currentProgress < 25 then
            statusLabel.Text = "Loading assets..."
        elseif currentProgress < 50 then
            statusLabel.Text = "Connecting to server..."
        elseif currentProgress < 75 then
            statusLabel.Text = "Preparing game world..."
        elseif currentProgress < 89 then
            statusLabel.Text = "Almost ready..."
        end
    end
end


local connection = RunService.Heartbeat:Connect(updateProgress)


local function completeLoading()
    if connection then
        connection:Disconnect()
    end
    
  
    for _, gui in pairs(playerGui:GetChildren()) do
        if gui ~= screenGui and gui:IsA("ScreenGui") then
            gui.Enabled = true
        end
    end
    

    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, true)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true)
    
    -- Fil animation
    local fadeInfo = TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local fadeTween = TweenService:Create(mainFrame, fadeInfo, {
        BackgroundTransparency = 1
    })
    
    for _, child in pairs(mainFrame:GetDescendants()) do
        if child:IsA("GuiObject") and child ~= mainFrame then
            TweenService:Create(child, fadeInfo, {
                BackgroundTransparency = 1,
                TextTransparency = 1
            }):Play()
        end
    end
    
    fadeTween:Play()
    fadeTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

spawn(function()
    wait(30) -- Wait 30 seconds after reaching 89%
    completeLoading()
end)

_G.CompleteLoading = completeLoading
