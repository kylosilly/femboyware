local player = game.Players.LocalPlayer

local function modifyToolProperties(character)
    while true do
        local holdingTool = character:FindFirstChildOfClass("Tool")
        if holdingTool then
            local currentAmmo = holdingTool:FindFirstChild("CurrentAmmo")
            if currentAmmo then
                currentAmmo.Value = 7777
            end

            local config = holdingTool:FindFirstChild("Configuration")
            if config then
                for _, v in ipairs(config:GetChildren()) do
                    if v.Name == "MaxSpread" or v.Name == "MinSpread" or v.Name == "RecoilMin" or v.Name == "RecoilMax" or v.Name == "ShotCooldown" then
                        v.Value = 0
                    elseif v.Name == "BulletSpeed" then
                        v.Value = 9999999
                    end
                end
            end
        end
        task.wait()
    end
end

local function onCharacterAdded(character)
    modifyToolProperties(character)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
    onCharacterAdded(player.Character)
end
