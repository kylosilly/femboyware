local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Rinns Hub discord.gg/rinnshub',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Shop = Window:AddTab('Shop'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local ocrateValue = ""
local bcrateValue = ""
local Autobuycrates = false
local Autoopencrates = false
local originalMaterials = {}
local changeCharacter = false

local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Free Stuff')
local RightGroupBox = Tabs.Main:AddRightGroupbox('Misc')

local InviteButton = LeftGroupBox:AddButton({
    Text = 'Copy discord invite',
    Func = function()
        setclipboard("discord.gg/rinnshub")
    end,
    DoubleClick = false,
    Tooltip = 'Join our discord server!'
})

local InfMoneButton = LeftGroupBox:AddButton({
    Text = 'Semi Inf Money (Read Tooltip)',
    Func = function()
        local Module = require(game:GetService("ReplicatedStorage").SafeInfo)
        Module["Cardboard 'Safe'"].Cost = -math.huge
    end,
    DoubleClick = false,
    Tooltip = 'Buy a cardboard safe for infinite money, usable only for prestiges or attachments. The money lasts until you leave the game.'
})

local AttachmentsButton = LeftGroupBox:AddButton({
    Text = 'Free attachments',
    Func = function()
        local Module = require(game:GetService("ReplicatedStorage").GunInfo)
        Module.AttachmentInfo.Laser.Price = 0
        Module.AttachmentInfo["Sniper Scope"].Price = 0
        Module.AttachmentInfo["Iron Sights"].Price = 0
        Module.AttachmentInfo["ACOG Scope"].Price = 0
        Module.AttachmentInfo["HAMR Scope"].Price = 0
        Module.AttachmentInfo["EOTech Scope"].Price = 0
        Module.AttachmentInfo["Kobra Scope"].Price = 0
        Module.AttachmentInfo["Reflex Scope"].Price = 0
        Module.AttachmentInfo["Oil Filter"].Price = 0
        Module.AttachmentInfo.Osprey.Price = 0
        Module.AttachmentInfo["Seal Suppressor"].Price = 0
        Module.AttachmentInfo.Interceptor.Price = 0
        Module.AttachmentInfo.Micro.Price = 0
        Module.AttachmentInfo.Jungle.Price = 0
    end,
    DoubleClick = false,
    Tooltip = 'Inflation'
})

LeftGroupBox:AddLabel('After its ran, everything should be free if you have the exact money to buy any of these, and its free. You will lose your money if you have it under it wont take away your cash. To keep the attachment, equip it and repeat till you have all.', true)

local CheaterButton = LeftGroupBox:AddButton({
    Text = 'Give cheater title',
    Func = function()
        local args = {
            [1] = "26" 
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("SetTitle"):FireServer(unpack(args))
    end,
    DoubleClick = false,
    Tooltip = 'Gives you the cheater title'
})

LeftGroupBox:AddLabel('If you have the cheater title you cannot talk in chat with it or it will kick you.', true)

local SusButton = LeftGroupBox:AddButton({
    Text = 'Give yourself sus title',
    Func = function()
        local args = {
            [1] = "27" 
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("SetTitle"):FireServer(unpack(args))
    end,
    DoubleClick = false,
    Tooltip = 'Sigma ohio sigma sigma boy haahsdahdwhadhawdqawdawd'
})

local GadgetButton = LeftGroupBox:AddButton({
    Text = 'Give yourself gamepass gadgets',
    Func = function()
        local gamepassguns = {
            "Flare Gun",
            "Subspace Tripmine",
            "Trip Mine",
            "Dynamite",
            "Shuriken "
        }
        
        for i, gun in pairs(gamepassguns) do
            local args = {[1] = gun}
            game:GetService("ReplicatedStorage"):WaitForChild("BuyArmor"):FireServer(unpack(args))
            Library:Notify("Play a game finish it and the free gadets should be in your inventory (if this didnt give 1 report console errors after ran!)")
        end
    end,
    DoubleClick = false,
    Tooltip = 'Why you stomp me and my gang >:( !!!'
})

local SpamButton = RightGroupBox:AddButton({
    Text = 'Invite everyone to your lobby',
    Func = function()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and ReplicatedStorage:FindFirstChild("Lobbies") ~= nil and ReplicatedStorage.Lobbies:WaitForChild(LocalPlayer.Name) ~= nil and ReplicatedStorage:FindFirstChild("SendLobbyInvite") ~= nil then
                ReplicatedStorage.SendLobbyInvite:FireServer( plr.Name, ReplicatedStorage.Lobbies[LocalPlayer.Name])
            end
        end
    end,
    DoubleClick = false,
    Tooltip = 'Small trolling (YOU NEED TO BE IN A LOBBY)'
})

local RightGroupBox1 = Tabs.Shop:AddRightGroupbox('Safes')

RightGroupBox1:AddLabel('Rejoin after you bought or open a safe with this for it to actually appear.', true)

RightGroupBox1:AddDropdown('Crates', {
    Values = { "Metal Safe", "Notorious Safe", "Diamond Safe", "Outlaw Safe", "Ruby Safe" , "Cardboard 'Safe'"},
    Default = 1,
    Multi = false,

    Text = 'Select a crate to buy',
    Tooltip = 'Meow nya :3',

    Callback = function(Value)
        bcrateValue = Value
    end
})

RightGroupBox1:AddDropdown('OpenCrates', {
    Values = { "Metal Safe", "Notorious Safe", "Diamond Safe", "Outlaw Safe", "Ruby Safe" , "Cardboard 'Safe'"},
    Default = 1,
    Multi = false,

    Text = 'Select a crate to open',
    Tooltip = 'Meow nya :3',

    Callback = function(Value)
        ocrateValue = Value
    end
})

local BuyCrateButton = RightGroupBox1:AddButton({
    Text = 'Buy Crate',
    Func = function()
        local args = {
            [1] = bcrateValue
        }
        game:GetService("ReplicatedStorage"):WaitForChild("BuySafe"):InvokeServer(unpack(args))
    end,
    DoubleClick = false,
    Tooltip = 'Buys selected crate'
})

RightGroupBox1:AddToggle('AutoOpenCrates', {
    Text = 'Auto buy crates',
    Default = false,
    Tooltip = 'Automaticly buys selected crate every second',

    Callback = function(Value)
        Autobuycrates = Value
        if Value then
            while true do
                if Autobuycrates then
                    local args = {
                        [1] = bcrateValue
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("BuySafe"):InvokeServer(unpack(args))
                    task.wait(1)
                else
                    break
                end
            end
        end
    end
})

local OpenCrateButton = RightGroupBox1:AddButton({
    Text = 'Open Crate',
    Func = function()
        local args = {
            [1] = ocrateValue
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RequestUseSafe"):InvokeServer(unpack(args))
    end,
    DoubleClick = false,
    Tooltip = 'Opens selected crate'
})

RightGroupBox1:AddToggle('AutoOpenCrates', {
    Text = 'Auto open crates',
    Default = false,
    Tooltip = 'Automaticly opens selected crate every second',

    Callback = function(Value)
        Autoopencrates = Value
        if Value then
            while true do
                if Autoopencrates then
                    local args = {
                        [1] = ocrateValue
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RequestUseSafe"):InvokeServer(unpack(args))
                    task.wait(1)
                else
                    break
                end
            end
        end
    end
})

Library:SetWatermarkVisibility(true)

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

    Library:SetWatermark(('Rinns Hub Notoriety | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = false;

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('Rinnshub')
SaveManager:SetFolder('Rinnshub/NotorietyLobby')
SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])
SaveManager:LoadAutoloadConfig()
