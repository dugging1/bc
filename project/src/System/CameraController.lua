function newCamera(active, focus)
    local cam = require("src/System/Camera")
    cam.ACTIVE = active
    if focus == true then
        require("src/System/Draw")
        currentCamera = cam
    end
    return cam
end

function setFocus(cam)
    require("src/System/Draw")
    currentCamera = cam
end