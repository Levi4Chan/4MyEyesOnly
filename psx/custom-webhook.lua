function FormatNumber(n)
    local i, j, minus, int, fraction = tostring(n):find('([-]?)(%d+)([.]?%d*)')
    int = int:reverse():gsub("(%d%d%d)", "%1,")
    return minus .. int:reverse():gsub("^,", "") .. fraction
end



local SessionEarned = 0

task.spawn(function()
    while task.wait() do
        local TotalDiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, ",", "")
        task.wait(3600)
        local EarnedDiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, ",", "")
        local TotalEarned = tonumber(EarnedDiamonds) - tonumber(TotalDiamonds)
        SessionEarned = tonumber(SessionEarned) + tonumber(TotalEarned)

        local url = "https://discord.com/api/webhooks/968028466031239188/bk4TUshMXeXvkmpqRNRJvNJdYUC3gVYGr88fOtQaiy0ujQQ6Tz4VNTb_TeHJOWjHWYgR"
        local data = {
            ["content"] = "",
            ["embeds"] = {
                {
                    ["title"] = "Diamond Webhook",
                    ["description"] = "You made **" .. FormatNumber(TotalEarned) .. "** in 3600s!",
                    ["type"] = "rich",
                    ["color"] = tonumber(0x7269da),
		            ["fields"] = {
				        {
					        ["name"] = "Total Diamonds",
					        ["value"] = game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text,
					        ["inline"] = true
				        },
				        {
					        ["name"] = "Diamonds Earned this session",
					        ["value"] = FormatNumber(SessionEarned),
					        ["inline"] = false
				        }
			        },
                    ["footer"] = {
			            ["text"] = game.Players.LocalPlayer.Name
                    },
		            ["thumbnail"] = {
				        ["url"] = "https://cdn.discordapp.com/attachments/968028240717418496/1099699263967084646/Diamond_29.webp"
		            }
                }
            }
			["username"] = "Mystic Mine",
			["avatar_url"] = "https://pbs.twimg.com/media/FuSnDAEaYAAzdGr.png",
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        
        local headers = {
        ["content-type"] = "application/json"
        }
        request = http_request or request or HttpPost or syn.request
        local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
        request(abcdef)
    end
end)
