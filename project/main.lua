require("src/Gen")

local cmd
local channel

globalFlags = {}

local mods = {}

function love.load()
	cmd = love.thread.newThread("src/Cmd.lua")
	channel = love.thread.getChannel("Command")
	cmd:start()

    mods = getModules()
    for _,mod in pairs(mods) do --Start Pre-Initialisation
        print("Starting Pre-Initialisation for: '"..mod[2].."'")
        mod[1].preinit()
        print("Completed Pre-Initialisation for: '"..mod[2].."'\n\n")
    end
    for _,mod in pairs(mods) do --Start Initialisation
        print("Starting Initialisation for: '"..mod[2].."'")
        mod[1].init()
        print("Completed Initialisation for: '"..mod[2].."'\n\n")
    end
    for _,mod in pairs(mods) do --Start Post-Initialisation
        print("Starting Post-Initialisation for: '"..mod[2].."'")
        mod[1].postinit()
        print("Completed Post-Initialisation for: '"..mod[2].."'\n\n")
    end

	love.graphics.setBackgroundColor( 200, 200, 200 )
end

function getModules()
    local temp = {}
    for _,dir in pairs(love.filesystem.getDirectoryItems("/Modules")) do --For files in Module
        if love.filesystem.isDirectory("/Modules/"..dir) then --If it is a folder
            for _,item in pairs(love.filesystem.getDirectoryItems("/Modules/"..dir)) do --Get all items in folder
                if love.filesystem.isFile("/Modules/"..dir.."/"..item) then --If it is a file
                    if tostring(item) == "main.lua" then
                        table.insert(temp, "/Modules/"..dir.."/") --Folder is a module
                        break
                    end
                end
            end
        end
    end
    local ret = {}
    for _,mod in pairs(temp) do
        table.insert(ret,{require(mod.."main"), mod})
    end
    return ret
end


function Dev()
-- A Developer Console for testing purposes. Will be removed for final product.
	local c = channel:pop()
	if c ~= nil then
        if c[1] == "Command" then
            for _,mod in pairs(mods) do
                if mod[1].cmd ~= nil then
                    if mod[1].cmd(c) then
                        break
                    end
                end
            end
        end
	end
end

function love.draw()
    for _,mod in pairs(mods) do
        if mod[1].draw ~= nil then
            mod[1].draw(displayIcons)
        end
    end
end

function love.update(dt)
	Dev()
    for _,mod in pairs(mods) do
        if mod[1].update ~= nil then
            mod[1].update(dt)
        end
    end
end

function love.keypressed(key)
    for _,mod in pairs(mods) do
        if mod[1].keypressed ~= nil then
            mod[1].keypressed(key)
        end
    end
end

function love.keyreleased(key)
    for _,mod in pairs(mods) do
        if mod[1].keyreleased ~= nil then
            mod[1].keyreleased(key)
        end
    end
end