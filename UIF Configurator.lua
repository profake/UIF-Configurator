script_name('UIF Configurator')
script_author('Nasif')
require "lib.moonloader"

local SE = require 'lib.samp.events'
local imgui = require 'mimgui'
local new = imgui.new
local sizeX, sizeY = getScreenResolution()

showConfigMenu = new.bool()
disableLabels = new.bool()
signStop = new.bool()
disableUIFOverlay = new.bool()
disableScoreOverlay = new.bool()
disableActors = new.bool()

local newFrame = imgui.OnFrame(
	function() return showConfigMenu[0] end,
    function(player)	
		imgui.SetNextWindowPos(imgui.ImVec2(sizeX / 2, sizeY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(220, 200), imgui.Cond.FirstUseEver)
		imgui.Begin('UIF Configurator', showConfigMenu)
		imgui.Checkbox('Disable Labels', disableLabels)
		imgui.Checkbox('Disable 3D Signs', signStop)
		imgui.Checkbox('Disable Actors', disableActors)
		imgui.Checkbox('Disable UIF Overlay', disableUIFOverlay)
		imgui.Checkbox('Disable Score Overlay', disableScoreOverlay)
		imgui.End() 
	end
)

function main()
	while not isSampAvailable() do wait(0) end
	
	if sampGetCurrentServerAddress() ~= "51.254.85.134" then return end
	
	sampRegisterChatCommand("config", configMenu)
		
end

function SE.onSetPlayerHealth(health)
	if(health>200) then
		displayHud(false)
	else
		displayHud(true)
	end
end

function configMenu()
	showConfigMenu[0] = not showConfigMenu[0]
end

function SE.onCreate3DText(id, color, position, distance, testLOS, attachedPlayerId, attachedVehicleId, text)	
	if(attachedPlayerId == 65535 and disableLabels[0]) then
		return false
	end
end

function SE.onSetObjectMaterialText(id, data) 
		if (data.fontColor ~= -16711936 and data.materialSize==120 and signStop[0]) then
		return false
	end
end

function SE.onSetPlayerName(zoneId, squareStart, squareEnd, color)
	return false 
end

function SE.onCreateActor(id, skin, pos, angle, hp)
	if(disableActors[0]) then
		return false
	end
end
