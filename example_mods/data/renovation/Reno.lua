function onCreate()
resetowaniemissow = false
modchart = false

doTweenZoom('camzuem', 'camHUD', 0.8, 0.001, 'linear')
doTweenZoom('camzum', 'camGame', 0.5, 0.001, 'linear')

end

function onBeatHit()
	        doTweenZoom('ww', 'camGame', 0.55, 0.02, 'cubicOut')
	        doTweenZoom('wwe', 'camGame', 0.6, 0.6, 'cubicOut')
end

function onUpdate()
doTweenZoom('camzuem', 'camHUD', 1, 0.001, 'linear')
end


function onBeatHit()
cameraShake('game', 0.003, 0.2)
cameraShake('hud', 0.004, 0.2)
if modchart == true then
triggerEvent('Add Camera Zoom',0.1, 0.05)
end
end

function onStepHit()
if curStep == 1503 then
doTweenX('sfj', 'boyfriend', 1400, 5, 'elasticInOut')
doTweenX('sfje', 'BFLegs', 1400, 5, 'elasticInOut')
resetowaniemissow = true
end
if curStep == 1536 then
modchart = true
end
if curStep == 2047 then
doTweenX('sfj', 'boyfriend', 2300, 5, 'elasticInOut')
doTweenX('sfje', 'BFLegs', 2300, 5, 'elasticInOut')
doTweenX('sfyj', 'dad', 2300, 6, 'elasticInOut')
doTweenX('sfjiue', 'Legs', 2300, 6, 'elasticInOut')
end
end

function onUpdate()
if modchart == true then
        setProperty('defaultCamZoom',0.5)
        triggerEvent('Camera Follow Pos', 900, 500)
end
end



