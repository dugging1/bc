local stats = {hp=0,mp=0,strength=0,dexterity=0,intelegence=0}

function stats:calcHP()
    self.hp = self.strength*1  --TODO: Adjust equation
end

function stats:calcMP()
    self.mp = self.intelegence*1 --TODO: Adjust equation
end

return stats