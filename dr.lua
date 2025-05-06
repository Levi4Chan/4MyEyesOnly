script_key="wFbDSAywfobaCIGkaKixLnibwcJHFbgL";
(loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Levi4Chan/4MyEyesOnly/refs/heads/main/dr.lua'))()")
    end
end)
