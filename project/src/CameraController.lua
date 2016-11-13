function newCamera(active, focus)
    local cam = require("src/Camera")
    cam.ACTIVE = active
    if focus == true then
        require("src/Draw")
        currentCamera = cam
    end
    return cam
end

function setFocus(cam)
    require("src/Draw")
    currentCamera = cam
end