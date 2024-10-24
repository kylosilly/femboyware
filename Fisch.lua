-- Made by kylosilly, rewritten by netpa :3
-- Gui

local repo = 'https://raw.githubusercontent.com/KINGHUB01/Gui/main/'

local Library = loadstring(game:HttpGet(repo ..'Gui%20Lib%20%5BLibrary%5D'))()
local ThemeManager = loadstring(game:HttpGet(repo ..'Gui%20Lib%20%5BThemeManager%5D'))()
local SaveManager = loadstring(game:HttpGet(repo ..'Gui%20Lib%20%5BSaveManager%5D'))()

local Window = Library:CreateWindow({
    Title = 'Fisch',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Rinns Hub V1 | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

-- Tabs

local Tabs = {
    AutoFarm = Window:AddTab('AutoFarm'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Tables

local teleportSpots = {
    altar = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
    arch = CFrame.new(998.966796875, 126.6849365234375, -1237.1434326171875),
    birch = CFrame.new(1742.3203125, 138.25787353515625, -2502.23779296875),
    enchant = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
    executive = CFrame.new(-29.836761474609375, -250.48486328125, 199.11614990234375),
    keepers = CFrame.new(1296.320068359375, -808.5519409179688, -298.93817138671875),
    mod_house = CFrame.new(-30.205902099609375, -249.40594482421875, 204.0529022216797),
    moosewood = CFrame.new(383.10113525390625, 131.2406005859375, 243.93385314941406),
    mushgrove = CFrame.new(2501.48583984375, 127.7583236694336, -720.699462890625),
    roslit = CFrame.new(-1476.511474609375, 130.16842651367188, 671.685302734375),
    snow = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
    snowcap = CFrame.new(2648.67578125, 139.06605529785156, 2521.29736328125),
    spike = CFrame.new(-1254.800537109375, 133.88555908203125, 1554.2021484375),
    statue = CFrame.new(72.8836669921875, 138.6964874267578, -1028.4193115234375),
    sunstone = CFrame.new(-933.259705, 128.143951, -1119.52063, -0.342042685, 0, -0.939684391, 0, 1, 0, 0.939684391, 0, -0.342042685),
    swamp = CFrame.new(2501.48583984375, 127.7583236694336, -720.699462890625),
    terrapin = CFrame.new(-143.875244140625, 141.1676025390625, 1909.6070556640625),
    vertigo = CFrame.new(-112.007278, -492.901093, 1040.32788, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    volcano = CFrame.new(-1888.52319, 163.847565, 329.238281, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    wilson = CFrame.new(2938.80591, 277.474762, 2567.13379, 0.4648332, 0, 0.885398269, 0, 1, 0, -0.885398269, 0, 0.4648332),
    wilsons_rod = CFrame.new(2879.2085, 135.07663, 2723.64233, 0.970463336, -0.168695927, -0.172460333, 0.141582936, -0.180552125, 0.973321974, -0.195333466, -0.968990743, -0.151334763)
}

local racistPeople = {
    Witch = CFrame.new(409.368713, 135.712708, 312.134338, -0.93826592, -0.0479123928, 0.342580646, -9.64477658e-06, 0.99036473, 0.138483301, -0.345914871, 0.129930869, -0.929225981),
    Merchant = CFrame.new(416.690521, 130.302628, 342.765289, -0.249025017, -0.0326484665, 0.967946589, -0.0040341015, 0.999457955, 0.0326734781, -0.968488574, 0.00423171744, -0.249021754),
    Synph = CFrame.new(566.36499, 151.671799, 353.993896, -0.753522575, 0.00614984334, -0.657393873, -0.00677706953, 0.999830484, 0.0171213746, 0.657387733, 0.0173565373, -0.753353059),
    Pierre = CFrame.new(391.38855, 136.82576, 196.710144, -1, 0, 0, 0, 0.999927282, 0.012056686, 0, 0.012056686, -0.999927282),
    Phineas = CFrame.new(469.901093, 152.136032, 277.97641, 0.886104584, -0.00747075537, -0.46342513, 0, 0.999870062, -0.0161186438, 0.46348536, 0.014282804, 0.885989428),
    Shipwright = CFrame.new(357.972595, 135.112106, 258.154541, -0.0243720412, 0, -0.99970293, 0, 1, 0, 0.99970293, 0, -0.0243720412),
    Angler = CFrame.new(480.102478, 151.963333, 302.226898, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    Mod_Keeper = CFrame.new(-39.0905838, -245.141144, 195.837891, -0.948549569, -0.0898146331, -0.303623199, -0.197293222, 0.91766715, 0.34490931, 0.247647122, 0.387066364, -0.888172567),
    Marc = CFrame.new(466.060913, 152.480682, 224.723465, -0.995860994, -0.0430678315, -0.0800375119, -0.0437603444, 0.999018013, 0.00691775233, 0.0796609744, 0.0103915781, -0.996767819),
    Lucas = CFrame.new(449.09433, 181.516205, 180.772995, 0.256410182, -0.0536140576, 0.965079963, 0.176032364, 0.984352529, 0.00791505724, -0.950403333, 0.167855799, 0.261835814),
    Roslit_Keeper = CFrame.new(-1512.37891, 134.500031, 631.24353, 0.738236904, 0, -0.674541533, 0, 1, 0, 0.674541533, 0, 0.738236904),
    Inn_Keeper = CFrame.new(487.458466, 152.300034, 231.498932, -0.564704418, 0, -0.825293183, 0, 1, 0, 0.825293183, 0, -0.564704418),
    FishingNpc_1 = CFrame.new(-1429.04138, 134.371552, 686.034424, 0, 0.0168599077, -0.999857903, 0, 0.999857903, 0.0168599077, 1, 0, 0),
    FishingNpc_2 = CFrame.new(-1778.55408, 149.791779, 648.097107, 0.183140755, 0.0223737024, -0.982832015, 0, 0.999741018, 0.0227586292, 0.983086705, -0.00416803267, 0.183093324),
    FishingNpc_3 = CFrame.new(-1778.26807, 147.83165, 653.258606, -0.129575253, 0.501478612, 0.855411887, -2.44146213e-05, 0.862683058, -0.505744994, -0.991569638, -0.0655529201, -0.111770131),
    Ashe = CFrame.new(-1709.94055, 149.862411, 729.399536, -0.92290163, 0.0273250472, -0.384064913, 0, 0.997478604, 0.0709675401, 0.385035753, 0.0654960647, -0.920574605),
    Alfredrickus = CFrame.new(-1520.60632, 142.923264, 764.522034, 0.301733732, 0.390740901, -0.869642735, 0.0273988936, 0.908225596, 0.417582989, 0.952998459, -0.149826124, 0.26333645),
    Daisy = CFrame.new(581.550049, 166.974594, 213.499969, -0.951949298, 0, -0.306255639, 0, 1, 0, 0.306255639, 0, -0.951949298),
    Appraiser = CFrame.new(453.003967, 151.970993, 206.907928, 0.0983118787, -0.24595812, 0.964281857, 0.0232069641, 0.969278991, 0.244866714, -0.994885027, -0.00169523992, 0.100999579)
}

local itemSpots = {
    Bait_Crate = CFrame.new(384.57513427734375, 135.3519287109375, 337.5340270996094),
    Carbon_Rod = CFrame.new(454.083618, 150.590073, 225.328827, 0.985374212, -0.170404434, 1.41561031e-07, 1.41561031e-07, 1.7285347e-06, 1, -0.170404434, -0.985374212, 1.7285347e-06),
    Crab_Cage = CFrame.new(474.803589, 149.664566, 229.49469, -0.721874595, 0, 0.692023814, 0, 1, 0, -0.692023814, 0, -0.721874595),
    Fast_Rod = CFrame.new(447.183563, 148.225739, 220.187454, 0.981104493, 1.26492232e-05, 0.193478703, -0.0522461236, 0.962867677, 0.264870107, -0.186291039, -0.269973755, 0.944674432),
    Flimsy_Rod = CFrame.new(471.107697, 148.36171, 229.642441, 0.841614008, 0.0774728209, -0.534493923, 0.00678436086, 0.988063335, 0.153898612, 0.540036798, -0.13314943, 0.831042409),
    GPS = CFrame.new(517.896729, 149.217636, 284.856842, 7.39097595e-06, -0.719539165, -0.694451928, -1, -7.39097595e-06, -3.01003456e-06, -3.01003456e-06, 0.694451928, -0.719539165),
    Long_Rod = CFrame.new(485.695038, 171.656326, 145.746109, -0.630167365, -0.776459217, -5.33461571e-06, 5.33461571e-06, -1.12056732e-05, 1, -0.776459217, 0.630167365, 1.12056732e-05),
    Lucky_Rod = CFrame.new(446.085999, 148.253006, 222.160004, 0.974526405, -0.22305499, 0.0233404674, 0.196993902, 0.901088715, 0.386306256, -0.107199371, -0.371867687, 0.922075212),
    Plastic_Rod = CFrame.new(454.425385, 148.169739, 229.172424, 0.951755166, 0.0709736273, -0.298537821, -3.42726707e-07, 0.972884834, 0.231290117, 0.306858391, -0.220131472, 0.925948203),
    Training_Rod = CFrame.new(457.693848, 148.357529, 230.414307, 1, -0, 0, 0, 0.975410998, 0.220393807, -0, -0.220393807, 0.975410998)
}

-- Services

local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

-- Locals

local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character
local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")

local PlayerGUI = LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- Varbiables

local autoShake = false
local autoReel = false
local Noclip = false
local AntiDrown = false

-- Rest

PlayerGUI.ChildAdded:Connect(function(GUI)
    if GUI:IsA("ScreenGui") and GUI.Name == "shakeui" then
        if GUI:FindFirstChild("safezone") ~= nil then
            GUI.safezone.ChildAdded:Connect(function(child)
                if child:IsA("ImageButton") and child.Name == "button" then
                    task.wait(0.1)
                    if autoShake == true then
                        local pos = child.AbsolutePosition
                        local size = child.AbsoluteSize
                        VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
                        VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
                    end
                end
            end)
        end
    end
    if GUI:IsA("ScreenGui") and GUI.Name == "reel" then
        if autoReel == true then
            task.wait(2)
            ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished"):FireServer(100, false)
        end
    end
end)

NoclipConnection = RunService.Stepped:Connect(function()
    if Noclip == true then
        if LocalCharacter ~= nil then
            for i, v in pairs(LocalCharacter:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
    end
end)

-- Farm

local AutoFarmGroup = Tabs.AutoFarm:AddLeftGroupbox('AutoFarm')

AutoFarmGroup:AddToggle('AutoShake', {
    Text = 'Auto Shake',
    Default = false,
    Tooltip = 'Automatically clicks the shake button for you.',
    Callback = function(Value)
        autoShake = Value
    end
})

AutoFarmGroup:AddToggle('AutoReel', {
    Text = 'Auto Reel',
    Default = false,
    Tooltip = 'Automatically reels in the fishing rod.',
    Callback = function(Value)
        autoReel = Value
    end
})

local SellButton = AutoFarmGroup:AddButton({
    Text = 'Sell fish (Need to hold fish)',
    Func = function()
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell"):InvokeServer()
    end,
    DoubleClick = false,
    Tooltip = 'Sells the fish (YOU HAVE TO HOLD AN FISH)'
})

local DiscordInvButton = AutoFarmGroup:AddButton({
    Text = 'Copy Discord link',
    Func = function()
        setclipboard('https://discord.gg/VudXCDCaBN')
    end,
    DoubleClick = false,
    Tooltip = 'Join our discord!'
})

-- Teleports

local TeleportsGroup = Tabs.AutoFarm:AddRightGroupbox('Teleports')

TeleportsGroup:AddDropdown('PlaceTeleport', {
    Text = 'Place teleport',
    Tooltip = 'Teleport to a place',
    Values = {"altar", "arch", "birch", "enchant", "executive", "keepers", "mod_house", "moosewood", "mushgrove", "roslit", "snow", "snowcap", "spike", "statue", "sunstone", "swamp", "terrapin", "vertigo", "volcano", "wilson", "wilsons_rod"},
    Default = '',
  
    Callback = function(Value)
        if teleportSpots ~= nil and HumanoidRootPart ~= nil then
            HumanoidRootPart.CFrame = teleportSpots[Value]
        end
    end
})

TeleportsGroup:AddDropdown('NPCTeleport', {
    Text = 'Teleport to Npc',
    Tooltip = 'Teleport to a rod',
    Values = {"Witch", "Merchant", "Synph", "Pierre", "Phineas", "Shipwright", "Angler", "Mod_Keeper", "Marc", "Lucas", "Roslit_Keeper", "Inn_Keeper", "FishingNpc_1", "FishingNpc_2", "FishingNpc_3", "Ashe", "Alfredrickus", "Daisy", "Appraiser"},
    Default = '',
  
    Callback = function(Value)
        if racistPeople ~= nil and HumanoidRootPart ~= nil then
            HumanoidRootPart.CFrame = racistPeople[Value]
        end
    end
})

TeleportsGroup:AddDropdown('ItemTeleport', {
    Text = 'Teleport to item',
    Tooltip = 'Teleport to a rod',
    Values = {"Bait_Crate", "Carbon_Rod", "Crab_Cage", "Fast_Rod", "Flimsy_Rod", "GPS", "Long_Rod", "Lucky_Rod", "Plastic_Rod", "Training_Rod"},
    Default = '',
  
    Callback = function(Value)
        if itemSpots ~= nil and HumanoidRootPart ~= nil then
            HumanoidRootPart.CFrame = itemSpots[Value]
        end
    end
})

-- LocalPlayer

local LocalPlayerGroup = Tabs.AutoFarm:AddRightGroupbox('LocalPlayer')

LocalPlayerGroup:AddToggle('Noclip', {
    Text = 'Noclip',
    Default = false,
    Tooltip = 'Allows you to go through walls',
    Callback = function(Value)
        Noclip = Value
    end
})

LocalPlayerGroup:AddToggle('AntiDrown', {
    Text = 'Disable Oxygen',
    Default = false,
    Tooltip = 'Allows you to stay in water infinitely',
    Callback = function(Value)
        AntiDrown = Value
        if Value == true then
            if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == true then	
                LocalCharacter.client.oxygen.Enabled = false	
            end	
            CharAddedAntiDrownCon = LocalPlayer.CharacterAdded:Connect(function()	
                if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == true then	
                    LocalCharacter.client.oxygen.Enabled = false	
                end	
            end)
        else	
            if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == false then	
                LocalCharacter.client.oxygen.Enabled = true	
            end	
        end
    end
})

-- Ui settings

local SettingsGroup = Tabs['UI Settings']:AddLeftGroupbox('Settings')

SettingsGroup:AddButton('Unload', function() Library:Unload() end)

Library:OnUnload(function()
	Library.Unloaded = true
    if autoReel == true then
        autoReel = false
    end
    if autoShake == true then
        autoShake = false
    end
    if AntiDrown == true then
        if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == false then
            LocalCharacter.client.oxygen.Enabled = true
            CharAddedAntiDrownCon:Disconnect()
            AntiDrown = false
        end
    end
    if Noclip == true then
        Noclip = false
    end
    WatermarkConnection:Disconnect()
    NoclipConnection:Disconnect()
end)

SettingsGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)

SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('RinnsHub')

SaveManager:SetFolder('RinnsHub/Fisch')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
