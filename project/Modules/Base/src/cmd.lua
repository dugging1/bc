local modulePath = "Modules/Base/"

require(modulePath.."src/GenTile")
require("src/GenMap")

local function devHelp()
    io.write("Commands:\n")
    io.write("| '/Gen Map' - Generates a map\n")
    io.write("| '/Gen Test' - Tests the gen sys\n")
    io.write("| '/Exit' - Closes the dev console\n")
    io.write("|_________________________________|\n")
end

local function StartUp(res)
    testMap(res)
end

function resolveCommand(command, resources)
    local coms = {
        Help=function() devHelp() end,
        GenTest=function(data)
            if data[3] == nil then
                data[3] = 0
            end
            if data[4] == nil then
                data[4] = 0
            end
            table.insert(data, resources)
            Gen(unpack(data))
        end,
        StartUp=function() StartUp(resources) end,
        GenTmpl=function(data) createTile(unpack(data)) end}

    local t = coms[command[2]]
    table.remove(command,1)
    table.remove(command,1)
    if t ~= nil then
        t(command)
        return true
    end
    return false
end