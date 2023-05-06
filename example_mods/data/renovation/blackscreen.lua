function onCreate()

    makeLuaSprite('whitescreen', 'blackscreen',-1100, -900)
	scaleObject('whitescreen', 4, 4)
    addLuaSprite('whitescreen', true)

end

function onSongStart()
doTweenAlpha('whitescreen', 'whitescreen', 0, 3, 'cubeInOut')
end

function onStepHit()
if curStep == 2064 then
doTweenAlpha('whitescreen', 'whitescreen', 1, 3.5, 'cubeInOut')
end
end