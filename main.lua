require("Gen")
require("Player")
require("GenTile")
require("ResourceInit")

cmd = nil
channel = nil
resources = nil
globalFlags = {}

function love.load()
	cmd = love.thread.newThread("Cmd.lua")
	channel = love.thread.getChannel("Command")
	cmd:start()

	resources = {textures={}}
	initFolder("", resources)

	love.graphics.setBackgroundColor( 200, 200, 200 )

	globalFlags["MenuSwitch"] = true
	--[[
--Rooms
	BRoom = love.graphics.newImage("/textures/raw parts/Rooms/Broom.png")
	CRoom = love.graphics.newImage("/textures/raw parts/Rooms/Croom.png")
	RDown = love.graphics.newImage("/textures/raw parts/Rooms/RDown.png")
	RLeft = love.graphics.newImage("/textures/raw parts/Rooms/RLeft.png")
	RRight = love.graphics.newImage("/textures/raw parts/Rooms/RRight.png")
	RUp = love.graphics.newImage("/textures/raw parts/Rooms/RUp.png")
	]]--
--Entities
	Player.Char = resources["textures"]["Player"]
end

function Dev()
-- A Developer Console for testing purposes. Will be removed for final product.
	local function devHelp()
		io.write("Commands:\n")
		io.write("| '/Gen Map' - Generates a map\n")
		io.write("| '/Gen Test' - Tests the gen sys\n")
		io.write("| '/Exit' - Closes the dev console\n")
		io.write("|_________________________________|\n")
	end
	local c = channel:pop()
	if c ~= nil then
		if c[1] == "Command" then
			local coms = {
			function() devHelp() end,
			function(data) Gen(unpack(data)) end,
			function() StartUp() end,
			function() Misc_() end,
			function() Misc1_() end,
			function(data) createTile(unpack(data)) end}
			
			local t = coms[c[2]]
			table.remove(c,1)
			table.remove(c,1)
			if t ~= nil then
				t(c)
			end
		end
	end
end

function love.draw()
	-- IN MENU
	if globalFlags["MenuSwitch"] == true then
	end
	-- OUT MENU
	if globalFlags["MenuSwitch"] == false then
		love.graphics.draw(resources["textures"]["GUIHead"], 0, 0)
	end
	if GTTrue == true then
		local trans = {{"BK",resources["textures"]["Tblack"]},{"WW",resources["textures"]["Twhite"]},{"RR",resources["textures"]["Tred"]},
						{"GG",resources["textures"]["Tgreen"]},{"BB",resources["textures"]["Tblue"]},{"CY",resources["textures"]["Tcyan"]}}
		for x=0,table.maxn(displayIcons) do
			for y=0,table.maxn(displayIcons[x]) do
				local temp = 0
				local i = 1
				while true do
					if trans[i] == nil then
						print("Unknown Colour at tile: ("..tostring(x)..","..tostring(y)..")")
						break
					end
					if trans[i][1] == displayIcons[x][y] then
						temp = trans[i][2]
						break
					end
					i=i+1
				end
				if temp ~= nil then
					love.graphics.draw(temp, x*temp:getWidth(), y*temp:getHeight())
				end
			end
		end
	end
	love.graphics.draw(Player.Char,Player.Xpos,Player.Ypos,Player.Rot,1,1,(40/2),(20/2))
end

function love.update(dt)
	Dev()
	if Player.Wtrue == true then
		Player.Ypos = Player.Ypos - 300*dt
	end
	if Player.Atrue == true then
		Player.Xpos = Player.Xpos - 300*dt
	end
	if Player.Strue == true then
		Player.Ypos = Player.Ypos + 300*dt
	end
	if Player.Dtrue == true then
		Player.Xpos = Player.Xpos + 300*dt
	end
	
	
	local Mx = love.mouse.getX()
	local My = love.mouse.getY()
	
	function math.getAngle(x1,y1, x2,y2) return math.atan2((y2-y1),(x2-x1)) end
	Player.Rot = math.getAngle(Player.Xpos,Player.Ypos,Mx,My)+math.pi/2
end

function love.keypressed(key)
	if key == "`" then
		require("GenMap")
		testPick()
	end
	if key == "w" then
		Player.Wtrue = true
	end
	if key == "a" then
		Player.Atrue = true
	end
	if key == "s" then
		Player.Strue = true
	end
	if key == "d" then
		Player.Dtrue = true
	end
end

function love.keyreleased(key)
	if key == "w" then
		Player.Wtrue = false
	end
	if key == "a" then
		Player.Atrue = false
	end
	if key == "s" then
		Player.Strue = false
	end
	if key == "d" then
		Player.Dtrue = false
	end
end