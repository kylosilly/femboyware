local player = game.Players.LocalPlayer

local GunMods = {
    CurrentAmmo = 7777,
    MaxSpread = 0,
    MinSpread = 0,
    RecoilMin = 0,
    RecoilMax = 0,
    ShotCooldown = 0,
    BulletSpeed = 9999999
}

local function modifyToolProperties(character)
    while true do
        local holdingTool = character:FindFirstChildOfClass("Tool")
        if holdingTool then
            for propertyName, propertyValue in pairs(GunMods) do
                local property = holdingTool:FindFirstChild(propertyName)
                or (holdingTool:FindFirstChild("Configuration") and holdingTool.Configuration:FindFirstChild(propertyName))
                if property then
                    property.Value = propertyValue
                end
            end
        end
        task.wait()
    end
end

player.CharacterAdded:Connect(modifyToolProperties)

if player.Character then
    modifyToolProperties(player.Character)
end
