local player = game.Players.LocalPlayer

local GunMods = {
    CurrentAmmo = 7777,
    MaxSpread = 0,
    MinSpread = 0,
    RecoilMin = 0,
    RecoilMax = 0,
    ShotCooldown = 0,
    BulletSpeed = 9999999, -- dont go high or it might not render
    ReloadTime = 0, -- idk this shit just randomly dosent come in some guns lol
    ShotEffect = "Rocket" -- client sided
}

local function modifyToolProperties(character)
    while true do
        local holdingTool = character:FindFirstChildOfClass("Tool")
        if holdingTool then
            for propertyName, propertyValue in pairs(GunMods) do
                local property = holdingTool:FindFirstChild(propertyName) 
                 or (holdingTool:FindFirstChild("Configuration") 
                 and holdingTool.Configuration:FindFirstChild(propertyName))

                if property then
                    if property:IsA("StringValue") then
                        property.Value = tostring(propertyValue)
                    else
                        property.Value = propertyValue
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
