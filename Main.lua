-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local GuiButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(210, 255, 251)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0459641255, 0, 0.0852878466, 0)
Frame.Size = UDim2.new(0, 216, 0, 244)

GuiButton.Name = "GuiButton"
GuiButton.Parent = Frame
GuiButton.BackgroundColor3 = Color3.fromRGB(153, 255, 252)
GuiButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
GuiButton.BorderSizePixel = 0
GuiButton.Position = UDim2.new(0.0370370373, 0, 0.397540987, 0)
GuiButton.Size = UDim2.new(0, 200, 0, 50)
GuiButton.Font = Enum.Font.SourceSans
GuiButton.Text = "Piggy Back Ride On Nearest Kiddie"
GuiButton.TextColor3 = Color3.fromRGB(0, 0, 0)
GuiButton.TextSize = 14.000

UICorner.Parent = GuiButton

UICorner_2.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 0.450
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.032822784, 0, 0.113390878, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Piggy Back Script (Made By JohnIntelTech)"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 23.000
TextLabel.TextWrapped = true

UICorner_3.Parent = TextLabel

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0925716832, 0, 0.655694067, 0)
ImageLabel.Size = UDim2.new(0, 176, 0, 66)
ImageLabel.Image = "http://www.roblox.com/asset/?id=11116929703"

-- Scripts:

local function VPVYHO_fake_script() -- GuiButton.TeleportScript 
	local script = Instance.new('LocalScript', GuiButton)

	-- Reference to the GuiButton
	local button = script.Parent
	if not button or not button:IsA("TextButton") then
		error("GuiButton not found or not correctly configured.")
	end

	local isFollowing = false

	-- Function to teleport your character above the nearest Humanoid
	local function TeleportAboveNearestHumanoid()
		local player = game.Players.LocalPlayer
		local character = player.Character

		-- Ensure character and humanoid exist
		if character then
			local humanoid = character:FindFirstChild("Humanoid")

			if humanoid then
				while isFollowing do
					-- Find the nearest Humanoid
					local nearestHumanoid = nil
					local minDistance = math.huge

					for _, otherPlayer in pairs(game.Players:GetPlayers()) do
						if otherPlayer ~= player and otherPlayer.Character then
							local otherCharacter = otherPlayer.Character
							local otherHumanoid = otherCharacter:FindFirstChild("Humanoid")

							if otherHumanoid then
								local distance = (character.PrimaryPart.Position - otherHumanoid.Parent.PrimaryPart.Position).Magnitude

								if distance < minDistance then
									nearestHumanoid = otherHumanoid.Parent
									minDistance = distance
								end
							end
						end
					end

					-- Teleport above the nearest Humanoid
					if nearestHumanoid then
						local humanoidRootPart = nearestHumanoid.PrimaryPart
						local teleportPosition = humanoidRootPart.Position + Vector3.new(0, 10, 0) -- Adjust the vertical offset as needed

						-- Teleport your character
						character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
					end

					wait(0.1) -- Adjust the update frequency as needed
				end
			end
		end
	end

	-- Connect the button click event to toggle following
	button.MouseButton1Click:Connect(function()
		isFollowing = not isFollowing
		if isFollowing then
			TeleportAboveNearestHumanoid()
		end
	end)

end
coroutine.wrap(VPVYHO_fake_script)()
-- GuiButton.TeleportScript is disabled.
local function TMNTJ_fake_script() -- Frame.DragScript 
	local script = Instance.new('LocalScript', Frame)

	--Not made by me, check out this video: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s
	--Put this inside of your Frame and configure the speed if you would like.
	--Enjoy! Credits go to: https://www.youtube.com/watch?v=z25nyNBG7Js&t=22s

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

end
coroutine.wrap(TMNTJ_fake_script)()
