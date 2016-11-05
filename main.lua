require("src/Gen")

local cmd
local channel

globalFlags = {}

mods = {}

function love.load()
	cmd = love.thread.newThread("src/Cmd.lua")
	channel = love.thread.getChannel("Command")
	cmd:start()

    mods = getModules()
    for _,mod in pairs(mods) do --Start Pre-Initialisation
        mod.preinit()
    end
    for _,mod in pairs(mods) do --Start Initialisation
        mod.init()
    end
    for _,mod in pairs(mods) do --Start Post-Initialisation
        mod.postinit()
    end

	love.graphics.setBackgroundColor( 200, 200, 200 )
end

function getModules()
    local temp = {}
    for _,dir in pairs(love.filesystem.getDirectoryItems("/Modules")) do --For files in Module
        print(dir)
        if love.filesystem.isDirectory("/Modules/"..dir) then --If it is a folder
            print("Is Dir")
            for _,item in pairs(love.filesystem.getDirectoryItems("/Modules/"..dir)) do --Get all items in folder
                print(item)
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
        table.insert(ret,require(mod.."main"))
    end
    return ret
end


function Dev()
-- A Developer Console for testing purposes. Will be removed for final product.
	local c = channel:pop()
	if c ~= nil then
        if c[1] == "Command" then
            for _,mod in pairs(mods) do
                if mod.cmd ~= nil then
                    if mod.cmd(c) then
                        break
                    end
                end
            end
        end
	end
end

function love.draw()
    for _,mod in pairs(mods) do
        if mod.draw ~= nil then
            mod.draw(displayIcons)
        end
    end
end

function love.update(dt)
	Dev()
    for _,mod in pairs(mods) do
        if mod.update ~= nil then
            mod.update(dt)
        end
    end
end

function love.keypressed(key)
    for _,mod in pairs(mods) do
        if mod.keypressed ~= nil then
            mod.keypressed(key)
        end
    end
end

function love.keyreleased(key)
    for _,mod in pairs(mods) do
        if mod.keyreleased ~= nil then
            mod.keyreleased(key)
        end
    end
end