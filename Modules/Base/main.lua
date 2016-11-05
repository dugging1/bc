local modulePath = "Modules/Base/"

require("Lib/ResourceInit")
require(modulePath.."src/cmd")

local resources = {}
local Player
local globalFlags = {}

local function preInit()
    print("Base module: Pre-Initialisation")

    initFolder("Modules/Base/Resources", resources)
    Player = require("Modules/Base/src/Player")
    globalFlags["MenuSwitch"] = true

    Player.Char = resources["textures"]["Player"]
end
local function Init()
    print("Base module: Initialisation")
end
local function postInit()
    print("Base module: Post-Initialisation")
end

local function Update(dt)
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
local function Draw(displayIcons)
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
                local temp
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

local function cmd(command)
    return resolveCommand(command, resources)
end

local function keyPressed(key)
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
local function keyReleased(key)
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


return {preinit=preInit,init=Init,postinit=postInit,update=Update,draw=Draw,keypressed=keyPressed,keyreleased=keyReleased,cmd=cmd}