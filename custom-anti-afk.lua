repeat task.wait() until game:IsLoaded()

local PSXPID = {
	10321372166,
	6284583030
}

if table.find(PSXPID, game.PlaceId) then
	repeat task.wait() until game.Players.LocalPlayer
	repeat task.wait() until game.Players.LocalPlayer.Character ~= nil
	repeat task.wait() until workspace:FindFirstChild("__MAP")
end


-- Instances:
local gethui = gethui or get_hidden_ui or get_hidden_gui or hiddenUI or function()
	return game:GetService("CoreGui")
end
local AFK = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")

--Properties:

AFK.Name = "AFK"
AFK.Parent = gethui()
AFK.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
AFK.DisplayOrder = 526
AFK.ResetOnSpawn = false

Frame.Parent = AFK
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(130, 203, 255)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.5, -153, 0.5, -64)
Frame.Size = UDim2.new(0, 307, 0, 128)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.172444999, 0, 0.00048828125, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 41)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Anti - AFK"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.167244464, 0, 0.300239563, 0)
TextLabel_2.Size = UDim2.new(0, 207, 0, 31)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Running Time:"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.236150771, 0, 0.548187256, 0)
TextLabel_3.Size = UDim2.new(0, 157, 0, 32)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "00:00:00"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

TextLabel_4.Parent = Frame
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0.0136886761, 0, 0.806936264, 0)
TextLabel_4.Size = UDim2.new(0, 99, 0, 25)
TextLabel_4.Font = Enum.Font.SourceSansBold
TextLabel_4.Text = "Made by Levia"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

-- Scripts:

local function VIYFKQE_fake_script() -- TextLabel.LocalScript 
	local script = Instance.new('LocalScript', TextLabel)

	task.spawn(function()
		while task.wait() do
			local t = 5; 
			local hue = tick() % t / t
			local colorrr = Color3.fromHSV(hue, 1, 1)
			script.Parent.TextColor3 = colorrr
		end
	end)
end
coroutine.wrap(VIYFKQE_fake_script)()
local function KPSOQKL_fake_script() -- TextLabel.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));

	local gui = script.Parent

	local dragging
	local dragInput
	local dragStart
	local startPos

	function Lerp(a, b, m)
		return a + (b - a) * m
	end;

	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(KPSOQKL_fake_script)()
local function CTIJVK_fake_script() -- TextLabel_3.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_3)

	local label = script.Parent
	local currentTime = 0
	
	local function formatTime()
		local hours = math.floor(currentTime / 3600)
		local minutes = math.floor((currentTime - (hours * 3600))/60)
		local seconds = (currentTime - (hours * 3600) - (minutes * 60))
		local format = "%02d:%02d:%02d"
		return format:format(hours, minutes, seconds)
	end
	
	local function startTimer()
		while true do
			currentTime += 1
			label.Text = formatTime()
			task.wait(1)
		end
	end
	
	startTimer()
end
coroutine.wrap(CTIJVK_fake_script)()
local function YLOYR_fake_script() -- AFK.LocalScript 
	local script = Instance.new('LocalScript', AFK)
	
	local myUI = script.Parent

	repeat task.wait() until game:IsLoaded()
	
	local Players = game:GetService("Players")
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		Players.LocalPlayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
	
	local UserInputService = game:GetService("UserInputService")
	
	UserInputService.InputBegan:Connect(function(key)
		if key.UserInputType == Enum.UserInputType.Keyboard then
			if key.KeyCode == Enum.KeyCode.Delete then
				if myUI.Enabled == true then
					myUI.Enabled = false
				else
					myUI.Enabled = true
				end
			end
		end
	end)
end
coroutine.wrap(YLOYR_fake_script)()


-- [[ fnl example ]] --

-- Import the Library
local fnl = loadstring(game:HttpGetAsync 'https://raw.githubusercontent.com/Code1Tech/utils/main/notification.lua')()

-- Make a Notification function
function notify(title, text, duration)
  title = title or "Notification"
  text = text or "No text provided."
  duration = duration or 5
  
  fnl:MakeNotification({
    Title = title,
    Text = text,
    Duration = duration
  })
end

-- Use the func
local Players = game:GetService("Players")
local GroupId = 5060810

Players.PlayerAdded:Connect(function(Player)
	if(Player:IsInGroup(GroupId)) then
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		local File = pcall(function()
			AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NewNotSameServers.json"))
		end)
		if not File then
			table.insert(AllIDs, actualHour)
			writefile("NewNotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
		end
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Desc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									delfile("NewNotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							writefile("NewNotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end
    
		function Teleport()
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end
    
		Teleport()	
	end
end)

notify("Anti - AFK", "Activated! Press the Home Key to hide or show the ui.", 5)
if table.find(PSXPID, game.PlaceId) then
	task.wait(2)
	notify("Anti - AFK (PSX)", "You will be rejoined in a different server if a game moderator joins!", 5)
end
