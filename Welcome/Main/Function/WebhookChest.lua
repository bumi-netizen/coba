local WebHookLog = {}
    local AllRequest = http_request or request or HttpPost or syn.request
    function WebHookLog:WebHookKaiTanSend(WebHookUrl)

        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("God's Chalice") then
            GodChalice = "✔️";
        else
            GodChalice = "❌";
        end

        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
            FistofDarkness = "✔️";
        else
            FistofDarkness = "❌";
        end
    
        local Embeds = {{
            ["title"] = "**God's Chalice & Fist of Darkness**",
            ["color"] = tonumber(0xD936FF),
            ["fields"] = {
                {
                    ["name"] = "User Name",
                    ["value"] = "||"..tostring(game.Players.LocalPlayer.Name).."||",
                    ["inline"] = true
                },
                {
                    ["name"] = "Beli : ",
                    ["value"] = tostring(game:GetService("Players").LocalPlayer.Data:FindFirstChild("Beli").Value),
                    ["inline"] = true
                },
                {
                    ["name"] = "[ 🏆 ]  God's Chalice Status :",
                    ["value"] = "```"..GodChalice.."```"
                },
                {
                    ["name"] = "[ 🔥 ]  Fist of Darkness Status :",
                    ["value"] = "```"..FistofDarkness.."```"
                },
            },
            ["footer"] = {
                ["text"] = ""..os.date("%c").." ("..os.date("%X")..")"
            },
        }}
    
        local Message
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("God's Chalice") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fist of Darkness") then
            Message = {
                ['username'] = "THUNDER Z CHEST FARM",
                ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1071360247781924955/THUNDERZ_HUB_4.png",
                ["content"] = "@everyone",
                ["embeds"] = Embeds,
            }
        else
            Message = {
                ['username'] = "THUNDER Z CHEST FARM",
                ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1071360247781924955/THUNDERZ_HUB_4.png",
                ["embeds"] = Embeds,
            }
        end
    
        local DataCallBack = AllRequest({
            Url = WebHookUrl,
            Method = 'POST',
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(Message)
        })
        return DataCallBack
    end
return WebHookLog
