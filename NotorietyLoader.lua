local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua'))()

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local repo = 'https://raw.githubusercontent.com/kylosilly/femboyware/refs/heads/main/'

if game.PlaceId == 21532277 then
    Library:Notify("Detected user in lobby, loading lobby script.")
    loadstring(game:HttpGet(repo.."NotorietyLobby.lua"))()
elseif game:GetService("ReplicatedFirst"):FindFirstChild("ArrivalInGame") ~= nil then
    Library:Notify("Detected user in main game, loading main script.")
    loadstring(game:HttpGet(repo.."Notoriety.lua"))()
else
    Library:Notify("It seems like you are not in Notoriety. This means the script won't load.")
end
