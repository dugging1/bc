Entity = {Xpos=100,Ypos=100,rot=0}

function Entity:Derive()
    local ret = self:new()
    setmetatable(ret, self)
    return ret
end
function Entity:new(Xpos,Ypos,rot)
    local ret = {}
    ret.Derive = self.Derive
    ret.new = self.new
    ret.getTile = self.getTile

    ret.Xpos = Xpos or 100
    ret.Ypos = Ypos or 100
    ret.rot = rot or 0
    return ret
end
function Entity:getTile(width, height, ox, oy)
    return {math.floor((self.Xpos+ox)/width),math.floor((self.Ypos+oy)/height)}
end