-- Modern Loading Screen Script for Roblox
-- Place this in ServerScriptService or StarterPlayerScripts

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ModernLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true -- This ensures it covers the full screen including topbar
screenGui.Parent = playerGui

-- Main background frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 100
mainFrame.Parent = screenGui

-- Gradient background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 15, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 25, 45))
}
gradient.Rotation = 45
gradient.Parent = mainFrame

-- Animated background particles
local particleFrame = Instance.new("Frame")
particleFrame.Name = "ParticleFrame"
particleFrame.Size = UDim2.new(1, 0, 1, 0)
particleFrame.Position = UDim2.new(0, 0, 0, 0)
particleFrame.BackgroundTransparency = 1
particleFrame.ZIndex = 101
particleFrame.Parent = mainFrame

-- Create floating particles
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
    
    -- Make particles round
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = particle
    
    -- Animate particles
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

-- Content container
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

-- Progress bar container corner
local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0, 25)
progressCorner.Parent = progressContainer

-- Progress bar fill
local progressBar = Instance.new("Frame")
progressBar.Name = "ProgressBar"
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 112
progressBar.Parent = progressContainer

-- Progress bar gradient
local progressGradient = Instance.new("UIGradient")
progressGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 150, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 100, 200))
}
progressGradient.Parent = progressBar

-- Progress bar corner
local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(0, 25)
progressBarCorner.Parent = progressBar

-- Progress percentage label
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

-- Loading animation for title
local titleTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local titleTween = TweenService:Create(titleLabel, titleTweenInfo, {
    TextTransparency = 0.3
})
titleTween:Play()

-- Progress animation variables
local currentProgress = 0
local targetProgress = 0
local isStuck = false
local lastUpdateTime = tick()

-- Update progress function
local function updateProgress()
    local currentTime = tick()
    
    -- Increase by 1% every 2 seconds
    if currentTime - lastUpdateTime >= 2 and not isStuck then
        lastUpdateTime = currentTime
        targetProgress = targetProgress + 1
        
        if targetProgress >= 89 then
            targetProgress = 89
            isStuck = true
            statusLabel.Text = "Bypassing Anti Cheat Wait Few Min"
            
            -- Add pulsing effect when stuck
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

-- Start progress animation
local connection = RunService.Heartbeat:Connect(updateProgress)

-- Function to complete loading (call this when you want to hide the loading screen)
local function completeLoading()
    if connection then
        connection:Disconnect()
    end
    
    -- Final animation
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

-- Auto-hide after loading is "complete" (optional)
-- Uncomment the lines below if you want it to auto-hide after some time
--[[
spawn(function()
    wait(30) -- Wait 30 seconds after reaching 89%
    completeLoading()
end)
--]]

-- You can call completeLoading() from another script when you're ready to hide the loading screen
_G.CompleteLoading = completeLoading
