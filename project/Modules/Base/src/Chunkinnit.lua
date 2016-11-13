require("src/Chunk")
local function chunkInnit()
	local ret = {}
	--Template:table.insert(ret, Chunk.new(5,5,{{,,,,},{,,,,},{,,,,},{,,,,}},name,"Tile",0,0))
	--DEMO TILESET
	--Curve:
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false}},"NECurveA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"NSCurveA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"NWCurveA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false}},"ESCurveA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,true,false,false}},"EWCurveA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false}},"SWCurveA1","Tile",0,0))
	--Plus:
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false}},"NESWPlusA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false}},"NESPlusA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,true,false,false}},"NEWPlusA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false}},"ESWPlusA1","Tile",0,0))
	--table.insert(ret, Chunk.new(5,5,{{,,,,},{,,,,},{,,,,},{,,,,}},"Chunks/Plus/","Tile",0,0))
	--End:
	table.insert(ret, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"NEndA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,true,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"NEndA2","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false}},"EEndA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"SEndA1","Tile",0,0))
	table.insert(ret, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"WEndA1","Tile",0,0))
	--
	return ret
end

return chunkInnit()