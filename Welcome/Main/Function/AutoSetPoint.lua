    local JembutCicak = nil
    function PelerKuda()
        JembutCicak = hookmetamethod(game, "__index", newcclosure(function(I, J)
            if not checkcaller() then
                if I:IsA("Mouse") and tostring(J) == "Hit" then 
                    if Playersaimbot ~= nil then
                        if _G.SetPoint then
                            return(game:GetService("Players"):FindFirstChild(Playersaimbot).Character.HumanoidRootPart.CFrame + (game:GetService("Players"):FindFirstChild(Playersaimbot).Character.HumanoidRootPart.Velocity * 0.165))
                        end
                    end
                end
            end
            return JembutCicak(I, J)
        end))
    end
    return PelerKuda()
