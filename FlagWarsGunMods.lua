--// Made by @kylosilly
local player = game.Players.LocalPlayer

local GunMods = {
    CurrentAmmo = 7777,
    MaxSpread = 0,
    MinSpread = 0,
    RecoilMin = 0,
    RecoilMax = 0,
    ShotCooldown = 0,
    BulletSpeed = 9999999,
    ReloadTime = 0,
    ShotEffect = "Rocket"
}

local function applyGunMods(character)
    while true do
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            for name, value in pairs(GunMods) do
                local prop = tool:FindFirstChild(name) or (tool:FindFirstChild("Configuration") and tool.Configuration:FindFirstChild(name))
                if prop then
                    prop.Value = prop:IsA("StringValue") and tostring(value) or value
                end
            end
        end
        task.wait()
    end
end

player.CharacterAdded:Connect(applyGunMods)
