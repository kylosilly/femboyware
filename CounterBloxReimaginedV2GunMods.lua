--// This is mega sigma!!! (If you wanna add anything to it go to game:GetService("ReplicatedStorage").Weapons and copy the value name in it from any gun :3 made by @kylosilly
local WeaponMods = {
    AccuracyDivisor = 0,
    AccuracyOffset = 0,
    FireRate = 0.090,
    Ammo = 9999999,
    ArmorPenetration = 100,
    Auto = true,
    EquipTime = 0,
    KillAward = 500,
    Penetration = 10000,
    PointsAward = 1000,
    Recoil = {
        AngleX = 0,
        AngleY = 0
    },
    ReloadTime = 0.1,
    Spread = {
        Crouch = 0,
        Jump = 0,
        Ladder = 0,
        Land = 0,
        Move = 0,
        MaxInaccuracy = 0,
        RecoveryTime = 0
    },
    StoredAmmo = 9999999
}

local weapons = game:GetService("ReplicatedStorage").Weapons

local function applyChanges(obj, changes)
    for name, value in pairs(changes) do
        if obj:FindFirstChild(name) then
            local child = obj[name]
            if child:IsA("IntValue") or child:IsA("NumberValue") or child:IsA("BoolValue") then
                child.Value = value
            end
        end
    end
end

local function applyNestedChanges(obj, nestedTable)
    for parentName, childNames in pairs(nestedTable) do
        if obj:FindFirstChild(parentName) then
            applyChanges(obj[parentName], childNames)
        end
    end
end

for _, weapon in pairs(weapons:GetChildren()) do
    applyChanges(weapon, WeaponMods)
    applyNestedChanges(weapon, {
        Recoil = WeaponMods.Recoil,
        Spread = WeaponMods.Spread
    })
end
