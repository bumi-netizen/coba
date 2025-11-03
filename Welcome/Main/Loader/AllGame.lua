--[[  
🔥 Local Key System + Game Loader
File: Welcome/Main/Loader/AllGame.lua
--]]

-- === [ KEY SYSTEM MULAI ] ===
repeat task.wait() until game:IsLoaded()

local PREFIX = "ThunderZ_"
local HEX_LEN = 25
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- buat BoolValue akses
if not player:FindFirstChild("HasAccess") then
	local v = Instance.new("BoolValue")
	v.Name = "HasAccess"
	v.Value = false
	v.Parent = player
end

-- fungsi pembuat hex random
local function randomHex(len)
	local chars = "0123456789abcdef"
	local t = {}
	for i = 1, len do
		local idx = math.random(1, #chars)
		t[i] = chars:sub(idx, idx)
	end
	return table.concat(t)
end

local function generateKey()
	return PREFIX .. randomHex(HEX_LEN)
end

local function isValidKey(key)
	local pattern = "^" .. PREFIX .. "([0-9a-fA-F]+)$"
	local match = key:match(pattern)
	return match and #match == HEX_LEN
end

-- buat GUI key secara langsung
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 360, 0, 160)
frame.Position = UDim2.new(0.5, -180, 0.3, 0)
frame.AnchorPoint = Vector2.new(0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.BackgroundTransparency = 0.1
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "🔑 Local Key Verification"
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.new(1, -20, 0, 34)
box.Position = UDim2.new(0,10,0,40)
box.PlaceholderText = PREFIX.."xxxxxxxxxxxxxxxxxxxxxxxxx"
box.ClearTextOnFocus = false
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(60,60,60)
box.TextColor3 = Color3.new(1,1,1)
box.TextXAlignment = Enum.TextXAlignment.Left
box.Parent = frame

local btnGen = Instance.new("TextButton")
btnGen.Size = UDim2.new(0.45, 0, 0, 32)
btnGen.Position = UDim2.new(0.05, 0, 0, 90)
btnGen.Text = "Generate Key"
btnGen.BackgroundColor3 = Color3.fromRGB(0,170,255)
btnGen.TextColor3 = Color3.new(1,1,1)
btnGen.Parent = frame

local btnVal = Instance.new("TextButton")
btnVal.Size = UDim2.new(0.45, 0, 0, 32)
btnVal.Position = UDim2.new(0.5, 0, 0, 90)
btnVal.Text = "Validate Key"
btnVal.BackgroundColor3 = Color3.fromRGB(0,200,120)
btnVal.TextColor3 = Color3.new(1,1,1)
btnVal.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,-20,0,20)
status.Position = UDim2.new(0,10,0,130)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.new(1,1,1)
status.TextXAlignment = Enum.TextXAlignment.Left
status.Text = ""
status.Parent = frame

local function unlock()
	player.HasAccess.Value = true
	gui:Destroy()
end

btnGen.MouseButton1Click:Connect(function()
	box.Text = generateKey()
	status.Text = "✅ Key berhasil dibuat!"
	status.TextColor3 = Color3.fromRGB(0,255,120)
end)

btnVal.MouseButton1Click:Connect(function()
	local key = box.Text
	if isValidKey(key) then
		status.Text = "Key valid, membuka akses..."
		status.TextColor3 = Color3.fromRGB(0,255,120)
		wait(0.6)
		unlock()
	else
		status.Text = "❌ Key tidak valid."
		status.TextColor3 = Color3.fromRGB(255,100,100)
	end
end)

-- tunggu sampai akses terbuka sebelum lanjut
repeat task.wait() until player.HasAccess.Value == true
-- === [ KEY SYSTEM SELESAI ] ===


-- === [ GAME LOADER ASLI ] ===
local PlaceId = game.PlaceId

if PlaceId == 2753915549 or PlaceId == 4442272183 or PlaceId == 7449423635 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/BloxFruit/Main/AllDevice.lua'))()
elseif PlaceId == 6918802270 or PlaceId == 14979402479 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/main/Main/HazePiece/AllDevices.lua'))()
elseif PlaceId == 16732694052 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/Fisch/Main.lua'))()
elseif PlaceId == 126884695634066 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
end
