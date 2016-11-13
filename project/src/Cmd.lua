function run(channel)
	while true do
		io.write("[@]: ")
		local inp = io.read()
		if inp == "/Help" then
			channel:push({"Command", "Help"})
		elseif inp:sub(1,9) == "/Gen Test" then
			inp = inp:sub(11)
			local words = {"Command", "GenTest"}
			for word in inp:gmatch("%S+") do table.insert(words, word) end
			channel:push(words)
		elseif inp == "/Start up" then
			channel:push({"Command", "StartUp"})
		elseif inp:sub(1,9) == "/Gen Tmpl" then
			local send = {"Command", "GenTmpl"}
			local t = inp:sub(11)
			for _ = 1,3 do
				local t1 = t:find(" ")
				table.insert(send, t:sub(1,t1-1))
				t = t:sub(t1+1)
			end
			table.insert(send, t)
			channel:push(send)
		else
			channel.push({"Command", "unknown", inp})
		end
	end
end
run(love.thread.getChannel("Command"))