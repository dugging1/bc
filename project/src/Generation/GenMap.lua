require("src/Generation/Chunk")

local maxDepth = 10

local node = {chunk=nil,connectedChunks={},
new=function(self, c, offsX, offsY)
	local a= {chunk=nil,connectedChunks={}}
	a.chunk = c
	a.chunk.ox = offsX or 0
	a.chunk.oy = offsY or 0
	a.fill = self.fill
	a.new = self.new
	a.draw = self.draw
	return a
end,
draw = function(self, res,prevChunk)
	self.chunk:draw(res)
	for _,v in ipairs(self.connectedChunks) do
        if v ~= prevChunk then
		    v:draw(res,self)
        end
	end
end,
fill=function(self, chunkSet, chunkDims, depth)
    --TODO: FIX IT   :(
end,
}
function makeStandardMap(chunkDims, chunkSet)
    --TODO: FIX IT   :(
end
function testMap(res)
	local chunkSet = require("Modules/Base/src/Chunkinnit")
	local BN = makeStandardMap({5,5}, chunkSet)
	BN:draw(res,nil)
    return BN
end