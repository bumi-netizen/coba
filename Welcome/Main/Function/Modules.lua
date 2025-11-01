return function()
    local Net = game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net")
    local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
    local RegisterHit = Net:WaitForChild("RE/RegisterHit")
    local ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")

    function ProcessEnemies(OthersEnemies, Folder)
        local BasePart = nil
        
        for _, Enemy in Folder:GetChildren() do
            local part = 
            Enemy:FindFirstChild("LeftLowerLeg") or Enemy:FindFirstChild("RightLowerLeg") or
            Enemy:FindFirstChild("LeftUpperLeg") or Enemy:FindFirstChild("RightUpperLeg") or
            Enemy:FindFirstChild("LeftLowerArm") or Enemy:FindFirstChild("RightLowerArm") or
            Enemy:FindFirstChild("LeftUpperArm") or Enemy:FindFirstChild("RightUpperArm") or
            Enemy:FindFirstChild("Head") or Enemy:FindFirstChild("Torso") or
            Enemy:FindFirstChild("UpperTorso") or Enemy:FindFirstChild("LowerTorso") or
            Enemy:FindFirstChild("HumanoidRootPart")
          
            if part and game.Players.LocalPlayer:DistanceFromCharacter(part.Position) < 80 then
                if Enemy ~= game.Players.LocalPlayer.Character then
                    table.insert(OthersEnemies, { Enemy, part })
                    BasePart = part
                end
            end
        end
        return BasePart
    end
end
