-- Rewroten by nepta sigma rape all and femboy kylosilly

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage:FindFirstChild("WeaponsSystem").Network.WeaponHit
local LocalPlayer = Players.LocalPlayer
local Neutral = BrickColor.new("Institutional white")

function GetTool()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
end

local Function = function(Player)
    if Player ~= nil then
        local Character = Player.Character
        local LocalCharacter = LocalPlayer.Character
        
        if Character ~= nil and LocalCharacter ~= nil then
            local HitPart = Character:FindFirstChild("HumanoidRootPart")
            local LocalHumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local Tool = GetTool()
            if not Tool then return end
            
            if HitPart ~= nil and Humanoid ~= nil and Humanoid.Health > 0 and Tool ~= nil then
                local Magnitude = (HitPart.Position - LocalHumanoidRootPart.Position).Magnitude
                local Unit = (HitPart.Position - LocalHumanoidRootPart.Position).unit

                repeat task.wait() RemoteEvent:FireServer(Tool, {["p"] = HitPart.Position, ["pid"] = 1, ["part"] = HitPart, ["d"] = Magnitude, ["maxDist"] = Magnitude, ["h"] = Humanoid, ["m"] = Enum.Material.Neon, ["sid"] = math.random(1, 1000), ["t"] = 0.0002056790194814283, ["n"] = Unit}) until Humanoid.Health == 0
            end
        end
    end
end

for i, v in pairs(Players:GetPlayers()) do
    if v.UserId ~= LocalPlayer.UserId and v.Team ~= LocalPlayer.Team and v.TeamColor ~= Neutral then
        if v.Character then
            Function(v)
        end
        v.CharacterAdded:Connect(function()
            task.wait(0.025)
            Function(v)              
        end)
        LocalPlayer.Character.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                Function(v) 
            end
        end)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr.UserId ~= LocalPlayer.UserId and plr.Team ~= LocalPlayer.Team and plr.TeamColor ~= Neutral then
        plr.CharacterAdded:Connect(function()
            task.wait(0.025)
            Function(plr)                           
        end)
    end
end)
