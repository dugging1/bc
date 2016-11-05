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
	return ret
end,
draw = function(self)
	Gen(self.filename, self.Type, self.ox, self.oy)
end
}


function pickChunk(chunks, exits)
	local candidates = {unpack(chunks)}
	local num = 1
	while num < table.maxn(candidates)+1 do
		local cand = candidates[num]
		local rem = false
		print("Starting to check candidate: "..tostring(num))
		for sideNum,Es in pairs(cand.Exits) do
			for exitNum,bool in pairs(Es) do
				print("Checking candidate exit: ("..tostring(sideNum)..","..tostring(exitNum)..") = "..tostring(bool))
				print("Required exit: "..tostring(exits[sideNum][exitNum]))
				if exits[sideNum][exitNum] == true then --Defined Door
					if bool == true then --Candidate has door
						--pass
					else
						print(">>Mismatch Removed")
						rem = true
						break
					end
				elseif exits[sideNum][exitNum] == false then --Defined wall
					if bool == true then --Candidate has door
						print(">>Mismatch Removed")
						rem = true
						break
					else
						--pass
					end
				else --undefined
					--pass
				end
			end
			if rem == true then
				break
			end
		end
		if rem == true then
			print("Removing: "..tostring(num).." with filename: "..tostring(candidates[num].filename))
			table.remove(candidates, num)
		elseif rem == false then
			num = num + 1
		end
	end
	print("End candidates: ")
	print_r(candidates)
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
	return ret
end