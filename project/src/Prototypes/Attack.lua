--Type= 0:Physical, 1:spell  TODO: Confirm Assignments
--Affinity= 0:none, 1:fire, 2:water, 3:air, 4:earth, 5:light, 6:dark
local attack = {type=0,affinity=0, stats=require("src/Prototypes/stats"),spell=nil}

function attack:createContext(player)
    if self.spell ~= nil then
        return self.spell:resolve(player)
    else
        return self.stats.strength*1 --TODO: Adjust equations
    end
end

return attack