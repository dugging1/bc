require("Chunk")

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
draw = function(self)
	self.chunk:draw()
	for _,v in ipairs(self.connectedChunks) do
		v:draw()
	end
end,
fill=function(self, chunkSet, flags, chunkDims)
	
end,
}
function makeEnd(chunkSet,side)
	--side = {sideNum of this picked chunk from caller chunk, {Current chunk's Exits}}

end
function makeStandardMap(chunkDims, chunkSet, flags)
	if not flags then
		flags = {falseNoise=10000}
	end
	local baseNode = node:new(pickChunk(chunkSet, {{nil,nil,nil,nil,nil},{nil,nil,nil,nil,nil},{nil,nil,nil,nil,nil},{nil,nil,nil,nil,nil}}),0, 0)
	baseNode:fill(chunkSet, flags, chunkDims)
	return baseNode
end
function testMap()
	local chunkSet = {}
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/End/SEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/End/NEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,true,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/End/NEndA2","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/End/WEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/End/EEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/Curve/NWCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/Curve/NWCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false}},"Chunks/Curve/SWCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false}},"Chunks/Plus/NESWPlusA1","Tile",0,0))
	
	BN = makeStandardMap({5,5}, chunkSet)
	BN:draw()
end
function testPick()
	local a = Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/End/SEndA1","Tile",0,5)
	local c = Chunk.new(5,5,{{false,true,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/End/NEndA2","Tile",0,5)
	local d = Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/Curve/NWCurveA1","Tile",0,5)
	local e = pickChunk({a,c,d},{{false,false,true,false,false},{},{},{}})
	--print("Returned chunk: "..tostring(e.filename))
	a = Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/End/SEndA1","Tile",0,0)
	a:draw()
	e:draw()
end