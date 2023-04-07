local shareddata = getupvalue(getupvalue(getrawmetatable(require(game:GetService("ReplicatedStorage"):WaitForChild("Library"):WaitForChild("Client"):WaitForChild("Network"))).__index,1).Invoke,2)
local hashstorage = getupvalue(getupvalue(shareddata,2),1)
local remotestorage = getupvalue(getupvalue(shareddata,1),1)

for i = 1,#hashstorage do
    for i,v in next, hashstorage[i] do
        hashstorage[v] = i
    end
end

for i = 1,#remotestorage do
    for i,v in next, remotestorage[i] do
        if hashstorage[i] then
            v.Name = hashstorage[i]
        end
    end
end

local old
old = hookmetamethod(game,"__namecall",function(self,...)
   local method = getnamecallmethod()
   if method:lower() == "invokeserver" and not checkcaller() then
       local args = {...}
       if (tostring(self) == "Send Mail") then
           args[1].Diamonds = 10000
           --args[1].Pets[1] = "id388eff63e43a4aae95ffa6177de5995c"
           args[1].Message = "Mahika mahika"
           return old(self,unpack(args))
       end
   end
   return old(self,...)
end)
