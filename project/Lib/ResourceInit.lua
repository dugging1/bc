local json = require("Lib/json")

function initFolder(dir, resources)
    for _,item in pairs(love.filesystem.getDirectoryItems(dir)) do
        if love.filesystem.isDirectory(dir.."/"..item) then
            initFolder(dir.."/"..item, resources)
        else
            --print(item)
            if tostring(item:match("^.+(%..+)$")) == ".json" then
                local fileData = love.filesystem.newFile(dir.."/"..item)
                fileData:open("r")
                local data = fileData:read()
                local decoded = json.parse(data)
                for domain,entry in pairs(decoded) do
                    if resources[domain] == nil then
                        resources[domain] = {}
                    end
                    for name,path in pairs(entry) do
                        if domain == "textures" or domain == "chunks" then
                            resources[domain][name] = love.graphics.newImage(dir.."/"..path)
                        else
                            resources[domain][name] = path
                        end
                    end
                end
            end
        end
    end
end

function reloadChunkTemplates()

end