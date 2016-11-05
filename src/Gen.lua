--The aim of this file is to create a system that picks and loads a template from a file and uses the data stored on it to generate a map.
--It needs to: 
--Be able to gen tile like rooms/paths/misc onto the map
--Be able to gen tiles on the map to scale with the template no matter what the size of the tiles are (assuming they are all the same size) -- This might need to change!
-- ~ Be able to send data to counter parts informing tile metadata i.e loot, mobs, intractable.    

--[Started 9/2/16]  
--[Concept 10/27/16]
--[Working 10/28/16]
require("src/GenMap")

displayIcons = {}

function Gen_Event_Handler(Gen_Event, Gen_Input1, Gen_Input2, Gen_Input3, Gen_Input4, Gen_Input5) 
	-- Handler! Events can be run through here!
	
	if Gen_Event == "Tile" then
		GTTrue = true
		print("Loaded?")
		print("Closing...")
		print(" ")
	end
	
	if Gen_Event == "ColorPick" then
		Gen_Input3 = Gen_Input3 or {0, 0}
		local Cp_r,Cp_g,Cp_b,_ = Gen_Input4:getPixel(Gen_Input1,Gen_Input2)
		local col = {Cp_r,Cp_g,Cp_b}
		local colTrans = {Cp_white={255,255,255},Cp_black={0,0,0},Cp_red={255,0,0},Cp_green={0,255,0},
						  Cp_blue={0,0,255},Cp_cyan={0,255,255}}
		local Cp_color = ""
		for k,v in pairs(colTrans) do
			if (col[1] == v[1]) and (col[2] == v[2]) and (col[3] == v[3]) then
				Cp_color = k
			end
		end
		
		if Gen_Input5 == 1 then
			if Cp_color == "Cp_black" then
				EventCp1Ripple("BK",Gen_Input1, Gen_Input2, Gen_Input3)
			elseif Cp_color == "Cp_white" then
				EventCp1Ripple("WW",Gen_Input1, Gen_Input2, Gen_Input3)
			elseif Cp_color == "Cp_red" then
				EventCp1Ripple("RR",Gen_Input1, Gen_Input2, Gen_Input3)
			elseif Cp_color == "Cp_green" then
				EventCp1Ripple("GG",Gen_Input1, Gen_Input2, Gen_Input3)
			elseif Cp_color == "Cp_blue" then
				EventCp1Ripple("BB",Gen_Input1, Gen_Input2, Gen_Input3)
			elseif Cp_color == "Cp_cyan" then
				EventCp1Ripple("CY",Gen_Input1, Gen_Input2, Gen_Input3)
			end
		end
	end
end

function EventCp1Ripple(col,x,y,offs)
	if not displayIcons[x+offs[1]] then
		displayIcons[x+offs[1]] = {}
	end
	displayIcons[x][y+offs[2]] = col
end

function Gen(name, Type, offsX, offsY, resources)
	offsX = offsX or 0
	offsY = offsY or 0
	local Test_Template_Loaded
	if love.filesystem.isFile("/customChunks/"..name..".png") then
		Test_Template_Loaded = love.graphics.newImage("/customChunks/"..name..".png")
	else
		Test_Template_Loaded = resources["chunks"][name]
	end
	local Test_Template_Data = Test_Template_Loaded:getData()
	
	print(" Generating Test Sequence Started")
	print("-__-__-__-__-__-__-__-__-__-__-")
	print("")
	for x=0,Test_Template_Loaded:getWidth()-1 do
		for y=0,Test_Template_Loaded:getHeight()-1 do
			Gen_Event_Handler("ColorPick",x,y,{offsX,offsY},Test_Template_Data,1)
		end
	end
	
	for y=0,Test_Template_Loaded:getHeight()-1 do
		local line = ""
		for x=0,Test_Template_Loaded:getWidth()-1 do
			line = line..displayIcons[x+offsX][y+offsY]
		end
		print(line)
	end
	print("")
	print("Test_Gen Generated! ")
	print("")	
	print("Method Type: "..tostring(Type))
	if Type == "Tile" then -- x  y
		Gen_Event_Handler("Tile",50,50)
	else
		print("Error Command not found try /Help")
	end
end