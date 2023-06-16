function onCreate()
    --you can copy the parts below as much as you want
	makeLuaSprite('middlethingw', 'camHUD/middlethingw'); --edit the X and Y values
	setObjectCamera('middlethingw', 'camOther')
end

function onUpdate(elapsed)
    --Change To Pixel
	if curStep == 829 then
	    removeLuaSprite('relapsedstage', false); --you can copy this as much as you want
		addLuaSprite('middlethingw', true); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 829 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    end