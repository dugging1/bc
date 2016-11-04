function chunkInnit()
	local ret = {}
	--Template:table.insert(chunkSet, Chunk.new(5,5,{{,,,,},{,,,,},{,,,,},{,,,,}},"Chunks/Plus/","Tile",0,0))
	--DEMO TILESET
	--Curve:
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/Plus/NECurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/Plus/NSCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/Curve/NWCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/Plus/ESCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/Plus/EWCurveA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false}},"Chunks/Curve/SWCurveA1","Tile",0,0))
	--Plus:
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false}},"Chunks/Plus/NESWPlusA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/Plus/NESPlusA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/Plus/NEWPlusA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,true,false,false},{false,false,true,false,false}},"Chunks/Plus/ESWPlusA1","Tile",0,0))
	--table.insert(chunkSet, Chunk.new(5,5,{{,,,,},{,,,,},{,,,,},{,,,,}},"Chunks/Plus/","Tile",0,0))
	--End:
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/Plus/NEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,true,true,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/End/NEndA2","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false},{false,false,false,false,false}},"Chunks/End/EEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false},{false,false,false,false,false}},"Chunks/End/SEndA1","Tile",0,0))
	table.insert(chunkSet, Chunk.new(5,5,{{false,false,false,false,false},{false,false,false,false,false},{false,false,false,false,false},{false,false,true,false,false}},"Chunks/End/WEndA1","Tile",0,0))
	--
	return ret
end