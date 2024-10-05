--// love from @kylosilly, @4cen2 and @netpa for helping <3
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

local function GetTool()
    return localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Tool")
end

local function Fire(targetPlayer)
    local equippedTool = GetTool()
    if not equippedTool then return end

    if targetPlayer and targetPlayer.Character then
        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")

        if targetHRP and targetHumanoid then
            local distance = (targetHRP.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude
            local args = {
                [1] = equippedTool,
                [2] = {
                    ["p"] = targetHRP.Position,
                    ["pid"] = 1,
                    ["part"] = targetHRP,
                    ["d"] = distance,
                    ["maxDist"] = distance,
                    ["h"] = targetHumanoid,
                    ["m"] = Enum.Material.Neon,
                    ["sid"] = math.random(1, 1000),
                    ["t"] = 0.0002056790194814283,
                    ["n"] = (targetHRP.Position - localPlayer.Character.HumanoidRootPart.Position).unit
                }
            }

            replicatedStorage.WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
        end
    end
end

local function KillAllPlayers()
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localPlayer.Team then
            Fire(player)
        end
    end
end

local function StartKillAll()
    while true do
        KillAllPlayers()
        task.wait(0.1)
    end
end

localPlayer.CharacterAdded:Connect(function()
    task.defer(StartKillAll)
end)

if localPlayer.Character then
    task.defer(StartKillAll)
end
