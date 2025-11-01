local JembutCicak = nil
function Ireng()
    local JembutCicak = nil
    JembutCicak = hookmetamethod(game, "__index", newcclosure(function(I, J)
        if not checkcaller() then
            if I:IsA("Mouse") and tostring(J) == "Hit" then 
               -- if Playersaimbot ~= nil then
                    if _G.Settings.Config["Auto Skill"] then
                        return(CFrame.new(PositionSkillMasteryDevilFruit))
                    end
                --end
            end
        end
        return JembutCicak(I, J)
    end))
end
return Ireng()
  
