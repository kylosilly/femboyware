local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "Femboy Ware V1 (By @kylosilly)",
    HidePremium = false,
    SaveConfig = false,
    ConfigFolder = "OrionTest"
})

local FarmTab = Window:MakeTab({
    Name = "Farming Tab",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local AutoTab = Window:MakeTab({
    Name = "Auto Tab",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc Tab",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local states = {
    autoObbyEnabled = false,
    teleportPartsEnabled = false,
    autoCollectEnabled = false,
    autoSwingingEnabled = false,
    autoClaimGiftEnabled = false
}

local selectedTier = "Tier1"
local selectedMode = "Single"
local autoBuyArmorBoxEnabled = false

local function findTouchInterestInModel(model)
    for _, desc in ipairs(model:GetDescendants()) do
        if desc:IsA("TouchTransmitter") then
            return desc
        end
    end
end

local function autoObby()
    while states.autoObbyEnabled do
        local rewardButton = workspace.Obby:FindFirstChild("RewardButton")
        if rewardButton then
            local touchInterest = findTouchInterestInModel(rewardButton)
            if touchInterest then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, touchInterest.Parent, 0)
                task.wait(75)
            end
        end
        if not states.autoObbyEnabled then
            break
        end
    end
end

local function teleportParts()
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local offset = Vector3.new(0, -2, 10)

    while states.teleportPartsEnabled do
        local targetPosition = rootPart.Position + rootPart.CFrame.lookVector * offset.Z + Vector3.new(0, offset.Y, 0)
for _, part in ipairs(workspace.Rarities:GetChildren()) do
            if part:IsA("BasePart") then
                part.CFrame = CFrame.new(targetPosition)
            end
        end
        task.wait()
        if not states.teleportPartsEnabled then
            break
        end
    end
end

local function autoCollect()
    while states.autoCollectEnabled do
        for _, part in ipairs(workspace.Effects:GetChildren()) do
            if part:IsA("BasePart") then
                part.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
            end
        end
        task.wait()
        if not states.autoCollectEnabled then
            break
        end
    end
end

local function autoClaimGift()
    while states.autoClaimGiftEnabled do
        for i = 1, 12 do
            local args = {
                [1] = i
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimGift"):FireServer(unpack(args))
        end
        task.wait(1)
        if not states.autoClaimGiftEnabled then
            break
        end
    end
end

local function autoBuyArmorBox()
    while autoBuyArmorBoxEnabled do
        local args = { [1] = selectedTier, [2] = selectedMode }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyArmorBox"):FireServer(unpack(args))
        task.wait(1)
        if not autoBuyArmorBoxEnabled then
            break
        end
    end
end

local redeemCode = function()
    local codes = {"SECRET", "LEVELS", "THANKYOU", "MATERIALS"}
    for _, code in ipairs(codes) do
        local args = { code }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
    end
end

FarmTab:AddToggle({
    Name = "Auto Obby",
    Default = false,
    Callback = function(value)
        states.autoObbyEnabled = value
        if value then
            task.wait()
            autoObby()
        end
    end
})

FarmTab:AddToggle({
    Name = "Teleport Parts (May lag)",
    Default = false,
    Callback = function(value)
        states.teleportPartsEnabled = value
        if value then
            task.wait()
            teleportParts()
        end
    end
})

FarmTab:AddToggle({
    Name = "Auto Collect (May lag)",
    Default = false,
    Callback = function(value)
        states.autoCollectEnabled = value
        if value then
            task.wait()
            autoCollect()
        end
    end
})

AutoTab:AddToggle({
    Name = "Auto Swing",
    Default = false,
    Callback = function(value)
        states.autoSwingingEnabled = value
        game:GetService("Players").LocalPlayer:WaitForChild("Values"):WaitForChild("AutoSwinging").Value = value
    end
})

AutoTab:AddToggle({
    Name = "Auto Claim Gift",
    Default = false,
    Callback = function(value)
        states.autoClaimGiftEnabled = value
        if value then
            task.wait()
            autoClaimGift()
        end
    end
})

AutoTab:AddDropdown({
    Name = "Select Tier",
    Default = "Tier1",
    Options = {"Tier1", "Tier2"},
    Callback = function(value)
        selectedTier = value
    end
})

AutoTab:AddDropdown({
    Name = "Select Mode",
    Default = "Single",
    Options = {"Single", "Triple"},
    Callback = function(value)
        selectedMode = value
    end
})

AutoTab:AddToggle({
    Name = "Auto Buy Armor",
    Default = false,
    Callback = function(value)
        autoBuyArmorBoxEnabled = value
        if value then
            task.wait()
            autoBuyArmorBox()
        end
    end
})

MiscTab:AddButton({
    Name = "Redeem Codes",
    Callback = redeemCode
})
