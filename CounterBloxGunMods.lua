--// Made by @kylosilly Reworked it to work for counter blox game:GetService("ReplicatedStorage").Weapons if you wanna change anything because thats were all values are stored :3
local WeaponMods = {
    FireRate = 0.1,
    Range = 9999999,
    Ammo = 9999999,
    ArmorPenetration = 100,
    Auto = true,
    EquipTime = 0,
    Penetration = 1000,
    ReloadTime = 0,
    Cooldown = 0,
    Burst = 0,
    Spread = {
        Crouch = 0,
        Jump = 0,
        Ladder = 0,
        Land = 0,
        Move = 0,
        MaxInaccuracy = 0,
        RecoveryTime = 0
    },
    StoredAmmo = 9999999,
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
