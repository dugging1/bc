Player = {}
Player.Xpos = 100
Player.Ypos = 100
Player.Rot = 0
Player.getTile = function(self, width, height, ox, oy)
	return {math.floor((self.Xpos+ox)/width),math.floor((self.Ypos+oy)/height)}
end