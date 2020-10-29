-- Exeperimental LUA-script to configure a Fibaro Implant Cnnfiguration (FGBS-222)
-- from a Telldus TellStick ZNet Lite v2
-- Setting Normally Close (NC) on IN1 and IN2


------ Do not change below ------
local devices = {}
local programs = {}


-- Define your device and settings here:
local deviceName = "Fibaro-FGBS-222-A"    -- Name of your FGBS-222 device


local COMMAND_CLASS_CONFIGURATION = 0x70
local deviceManager = require "telldus.DeviceManager"


function onInit( )
	local implant = deviceManager:findByName(implantdevice)
	if implant == nil then
		print("Could not find the device %s", deviceName)
		return
	end
	-- Get the raw zwave node
	local zwaveNode = implant:zwaveNode()
	local cmdClass = zwaveNode:cmdClass(COMMAND_CLASS_CONFIGURATION)
	if (cmdClass == nil) then
		print("Device %s does not support COMMAND_CLASS_CONFIGURATION", rgb:name())
		return
	end
	print("Set %s to 20=0 and 21=0", zwaveNode:name() )
	cmdClass:setConfigurationValue(20, 0)
	cmdClass:sendConfigurationParameters()
	cmdClass:setConfigurationValue(21, 0)
	cmdClass:sendConfigurationParameters()
end