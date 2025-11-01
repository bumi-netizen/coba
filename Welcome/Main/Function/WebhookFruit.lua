local WebHookLog = {}
local AllRequest = http_request or request or HttpPost or syn.request
local unixTimestamp = os.time()
local timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ", unixTimestamp)

local FruitList = {
    "Gravity Fruit",
    "Dough Fruit",
    "Shadow Fruit",
    "Venom Fruit",
    "Control Fruit",
    "Creation Fruit",
    "Spirit Fruit",
    "Dragon Fruit",
    "Leopard Fruit",
    "Mammoth Fruit",
    "Kitsune Fruit",
    "T-Rex Fruit",
    "Yeti Fruit",
    "Gas Fruit"
}


function WebHookLog:WebHookKaiTanSend(WebHookUrl, FruitName)
    local MentionText = ""  
    local StoreSuccess = true
    local NotificationChecked = false
    local Timeout = 0.5

  
    for _, fruit in pairs(FruitList) do
        if FruitName == fruit then
            MentionText = "@everyone"
            break
        end
    end


    local StartTime = tick()
    while not NotificationChecked and (tick() - StartTime) < Timeout do
        wait()
        for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Notifications:GetChildren()) do
            if v.Name == "NotificationTemplate" and string.find(v.Text, "You can only store") then
                StoreSuccess = false
                NotificationChecked = true
                break
            end
        end
    end


    if not NotificationChecked then
        NotificationChecked = true
        StoreSuccess = true
    end

    local StatusMessage = StoreSuccess and ("Successfully Stored Fruit: " .. FruitName)
        or ("Failed to Store Fruit: " .. FruitName .. " (Storage Full)")

    local Embeds = {{
        ["title"] = "**Fruit Storage Status**",
        ["color"] = tonumber(0xD936FF),
        ["fields"] = {
            {
                ["name"] = "[ 🍇 ] You Got Fruit :",
                ["value"] = FruitName ~= "" and FruitName or "`(No Name Detected)`"
            },
            {
                ["name"] = "[ 🛠 ] Status :",
                ["value"] = StatusMessage
            }
        },
        ["footer"] = {
            ["text"] = "Thunder Z"
        },
        ["image"] = {["url"] = "https://i.imgur.com/2wosJIs.gif"},
        ["timestamp"] = timestamp
    }}

    local Message = {
        ['username'] = "THUNDER Z FRUIT FINDER",
        ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1071360247781924955/THUNDERZ_HUB_4.png",
        ["content"] = MentionText,
        ["embeds"] = Embeds,
    }

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
