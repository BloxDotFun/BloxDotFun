- ReplicatedStorage.Modules.BlockchainHandler
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

local API_ENDPOINT = "https://your-api.com/create-request"
local REDIRECT_URI = "https://your-game.com/tx-callback"

local function CreateTokenRequest(player, tokenData)
   
    if not validateTokenData(tokenData) then
        return false, "Invalid token data"
    end

   
    local success, response = pcall(function()
        return HttpService:PostAsync(
            API_ENDPOINT,
            HttpService:JSONEncode({
                playerId = player.UserId,
                name = tokenData.Name,
                ticker = tokenData.Ticker,
                image = tokenData.Image,
                redirectUri = REDIRECT_URI
            }),
            Enum.HttpContentType.ApplicationJson,
            false,
            {["X-Game-Secret"] = game:GetService("SecretService").GetSecret("API_KEY")}
        )
    end)

    if success then
        local result = HttpService:JSONDecode(response)
      
        Players:CreateLocalPlayerScript([[
            local UserInputService = game:GetService("UserInputService")
            UserInputService:OpenUrl("]]..result.deeplink..[[")
        ]])
        return true, result.txId
    end
    return false, "API error"
end

game.ReplicatedStorage.CreateToken.OnServerEvent:Connect(function(player, data)
    local success, txId = CreateTokenRequest(player, data)
    if success then
        
        game:GetService("DataStoreService"):GetDataStore("PendingTxns"):SetAsync(txId, {
            player = player.UserId,
            created = os.time()
        })
    end
end)
