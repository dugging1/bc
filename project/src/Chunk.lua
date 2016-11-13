require("Lib/Useful")
Chunk = {
width=nil,height=nil,ox=0,oy=0,Exits={{false,false},{false,true},{false,false},{false}},filename=nil,Type="Tile",
--Exits = {{NORTH}, {EAST}, {SOUTH}, {WEST}}
new = function(w,h,exi,filename,Type,ox,oy)
	local ret = {}
	ret.width = w
	ret.height = h
	ret.Exits = exi
	ret.filename = filename
	ret.Type = Type
	ret.ox = ox or 0
	ret.oy = oy or 0
	ret.draw = Chunk.draw
    local _
    _,ret.code = getESides(ret)
	return ret
end,
draw = function(self, resources)
	Gen(self.filename, self.Type, self.ox, self.oy, resources)
end
}


function pickChunk(chunks, code)
	local candidates = {}
	for n,cand in pairs(chunks) do
        print("Req: "..tostring(code))
        print(""..tostring(cand.code))
        if cand.code == code then
            table.insert(candidates, cand)
        end
    end
	return candidates[math.random(table.maxn(candidates))]
end

function getESides(chunk)
	local ret = {}
	for n,v in pairs(chunk.Exits) do
		for _,b in pairs(v) do
			if b == true then
				ret[n] = true
			end
		end
	end
	local code = ""
	for k,v in pairs(ret) do
		if v == true then
			code = code..tostring(k)
		end
	end
	return ret, code
end