require("src/Chunk")

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
fill=function(self, chunkSet, chunkDims)

end,
}
function makeStandardMap(chunkDims, chunkSet)
    local t = {1,2,3,4,12,13,14,23,24,34,123,124,134,234,1234}
    local map = {}
    for x=0,math.random(15) do
        map[x] = {}
        for y=0,math.random(15) do
            map[x][y] = tostring(t[math.random(table.maxn(t))])
        end
    end
    local nodeMap = {}
    for x=0,table.maxn(map) do
        nodeMap[x] = {}
        for y=0,table.maxn(map[x]) do
            --print_r(nodeMap)
            --print(map[x][y])
            print("Picked chunk")
            local c = pickChunk(chunkSet, map[x][y])
            print_r(c)
            nodeMap[x][y] = node:new(pickChunk(chunkSet, map[x][y]),x*chunkDims[1],y*chunkDims[2])
        end
    end
	--local baseNode = node:new(chunkSet[math.random(10)],0, 0)
	--baseNode:fill(chunkSet, chunkDims)
	return baseNode
end
function testMap(res)
	local chunkSet = require("Modules/Base/src/Chunkinnit")
	local BN = makeStandardMap({5,5}, chunkSet)
	BN:draw(res,nil)
    return BN
end