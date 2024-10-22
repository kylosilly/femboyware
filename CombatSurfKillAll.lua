-- Made by kylosilly
local player = game.Players.LocalPlayer
local playerCharacter = player.Character or player.CharacterAdded:Wait()

local function getNearestPlayerPosition()
    local nearestPlayers = {}
    local shortestDistance = math.huge

    for _, v in ipairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (playerCharacter.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                table.insert(nearestPlayers, 1, v)
            else
                table.insert(nearestPlayers, v)
            end
        end
    end

    for _, nearestPlayer in ipairs(nearestPlayers) do
        local forcefield = nearestPlayer.Character:FindFirstChild("ForceField")
        local humanoid = nearestPlayer.Character:FindFirstChild("Humanoid")

        if not forcefield and (not humanoid or humanoid.Health > 0) then
            return nearestPlayer.Character.HumanoidRootPart.Position, nearestPlayer.Character:FindFirstChild("Left Leg"), nearestPlayer
        end
    end

    return nil, nil, nil
end

while true do
    for _ = 1, 3 do
        local myPosition = playerCharacter.HumanoidRootPart.Position
        local nearestPlayerPos, nearestPlayerLeg, nearestPlayerInstance = getNearestPlayerPosition()

        if nearestPlayerPos and nearestPlayerLeg and nearestPlayerInstance then
            local args = {
                [1] = myPosition,
                [2] = {nearestPlayerPos},
                [3] = {nearestPlayerLeg},
                [4] = {workspace:WaitForChild(nearestPlayerInstance.Name)},
                [5] = 105,
                [6] = false,
                [7] = {
                    ["ImageSize"] = UDim2.new(0, 80, 0, 80),
                    ["Image"] = "rbxassetid://2855991319"
                },
                [8] = false,
                [9] = true,
                [10] = "AWP",
                [11] = 20.190128326416016,
                [12] = 0
            }

            game:GetService("Players").LocalPlayer.Character.GunLocalNew.Shoot:FireServer(unpack(args))
        end

        task.wait(0.1)
    end

    task.wait(1)
end