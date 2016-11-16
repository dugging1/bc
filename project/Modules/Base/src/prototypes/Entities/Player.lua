require("src/Prototypes/Entity")
require("src/System/CameraController")
local Player = Entity:Derive()
Player.cam = newCamera(true, true)
return Player