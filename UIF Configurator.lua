script_name('UIF Configurator')
script_author('Nasif')
require "lib.moonloader"

local SE = require 'lib.samp.events'
local imgui = require 'imgui'

showConfigMenu = imgui.ImBool(false)
disableLabels = imgui.ImBool(true)
signStop = imgui.ImBool(true)
disableUIFOverlay = imgui.ImBool(true)
disableScoreOverlay = imgui.ImBool(true)
disableActors = imgui.ImBool(true)

function imgui.OnDrawFrame()
	if showConfigMenu.v then
		imgui.SetNextWindowPos(imgui.ImVec2(imgui.GetIO().DisplaySize.x / 2, imgui.GetIO().DisplaySize.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(200, 150), imgui.Cond.FirstUseEver)
		imgui.Begin('UIF Configurator', showConfigMenu)
		imgui.Checkbox('Disable Labels', disableLabels)
		imgui.Checkbox('Disable 3D Signs', signStop)
		imgui.Checkbox('Disable Actors', disableActors)
		imgui.Checkbox('Disable UIF Overlay', disableUIFOverlay)
		imgui.Checkbox('Disable Score Overlay', disableScoreOverlay)
		imgui.End()
	end
end

function main()
	while not isSampAvailable() do wait(100) end
	
	if sampGetCurrentServerAddress() ~= "51.254.85.134" then return end
	
	sampRegisterChatCommand("config", configMenu)
	
	while not sampTextdrawIsExists(0) do wait (0) end
	posX, posY = sampTextdrawGetPos(0)
	
	while not sampTextdrawIsExists(2049) do wait (0) end
	posXX, posYY = sampTextdrawGetPos(2049)
	
	while true do
		wait (0)
		imgui.Process = showConfigMenu.v
		
		if disableUIFOverlay.v then
			sampTextdrawSetPos(0, posX, posY+500)
		else
			sampTextdrawSetPos(0, posX, posY)
		end
		
		if disableScoreOverlay.v then
			sampTextdrawSetPos(2049, posXX, posYY+500)
		else
			sampTextdrawSetPos(2049, posXX, posYY)
		end
		
	end
	
end

function configMenu()
	showConfigMenu.v = not showConfigMenu.v
end

function SE.onCreate3DText(id, color, position, distance, testLOS, attachedPlayerId, attachedVehicleId, text)	
	if(attachedPlayerId == 65535 and disableLabels.v) then
		return false
	end
end

function SE.onSetObjectMaterialText(id, data) 
		if (data.fontColor ~= -16711936 and data.materialSize==120 and signStop.v) then
		return false
	end
end

--[[
function SE.onCreateGangZone(zoneId, squareStart, squareEnd, color)
	return false 
end
--]]

function SE.onCreateActor(id, skin, pos, angle, hp)
	if(disableActors.v) then
		return false
	end
end