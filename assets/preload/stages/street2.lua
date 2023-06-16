function onCreate()
	-- background shit
	makeLuaSprite('street2', 'street2', -500, -290);
    addLuaSprite('street2',false)
	
     makeAnimatedLuaSprite('vhs', 'camHUD/vhs')
    addAnimationByPrefix('vhs', 'idle', 'effect')
    playAnim('vhs', 'idle')
    setObjectCamera('vhs', 'camOther')
    scaleObject('vhs', 2, 2)

    addLuaSprite('bg')
    addLuaSprite('middlething', true)
    addLuaSprite('vhs', true)

    -- luaDebugMode = true
    initLuaShader("vcrshader")
    initLuaShader("grayscale")

    makeLuaSprite("shaderImage")
    makeGraphic("shaderImage", screenWidth, screenHeight)
    setSpriteShader("shaderImage", "vcrshader")
    
    makeLuaSprite("shaderImage2")
    setSpriteShader("shaderImage2", "grayscale")

    addHaxeLibrary("ShaderFilter", "openfl.filters")
    runHaxeCode([[
        trace(ShaderFilter);
        shaderA = game.getLuaObject("shaderImage").shader;
        shaderB = game.getLuaObject("shaderImage2").shader;

        game.camGame.setFilters([new ShaderFilter(shaderA), new ShaderFilter(shaderB)]);
        game.camHUD.setFilters([new ShaderFilter(shaderA), new ShaderFilter(shaderB)]);
    ]])
end

function onCreatePost()
    setProperty('vhs.alpha', 0.5)
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'middleScroll', uMiddlescroll)
    setPropertyFromClass('ClientPrefs', 'opponentStrums', true)
end

function onUpdate(elapsed)
    setShaderFloat("shaderImage", "iTime", os.clock())
end