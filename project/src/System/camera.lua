local active = true
local SCALE = 1
local POS = {0,0 }


local function push()
    if active == true then
        love.graphics.push()
    end
end

local function pop()
    if active == true then
        love.graphics.pop()
    end
end

local function translate(x, y)
    if active == true then
        love.graphics.translate(x,y)
    end
end

local function scale(s)
    SCALE = SCALE or s
    if active == true then
        love.graphics.scale(s,s)
    end
end

local function rotate(angle)
    if active == true then
        love.graphics.rotate(angle)
    end
end

local function follow(obj, Scale, rot)
    if active == true then
        POS[1] = obj.Xpos
        POS[2] = obj.Ypos
        SCALE = Scale or 1
        rot = rot or false
        translate(-POS[1], -POS[2])
        if rot == true then
            rotate(obj.rot)
        end
        scale(SCALE, SCALE)
    end
end

local function getMouse()
    return love.mouse.getX()*SCALE+POS[1], love.mouse.getY()*SCALE+POS[2]
end

return {push=push,pop=pop,translate=translate,scale=scale,rotate=rotate,follow=follow,SCALE=SCALE,ACTIVE=active,getMouse=getMouse,POS=POS}