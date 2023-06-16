function onEvent(name, value1, value2)
	if name == 'StopCameraControl' then
setProperty('isCameraOnForcedPos',false)
setProperty("defaultCamZoom",0.8)
	end
end