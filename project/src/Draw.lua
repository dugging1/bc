currentCamera = {}

function drawScaled(obj, x, y, r, sx, sy, ox, oy, kx, ky)
    local windowMode = {}
    windowMode.x, windowMode.y, windowMode.flags = love.window.getMode()
    sx = sx or 1
    sy = sy or 1
    love.graphics.draw(obj, (x+windowMode.x/2)/currentCamera.SCALE, (y+windowMode.y/2)/currentCamera.SCALE, r, sx/currentCamera.SCALE, sy/currentCamera.SCALE, ox, oy, kx, ky)
end