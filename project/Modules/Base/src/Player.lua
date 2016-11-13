require("src/Entity")
require("src/CameraController")
local Player = Entity:Derive()
Player.cam = newCamera(true, true)
return Player