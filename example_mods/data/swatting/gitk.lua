function onCreatePost()
    doTweenColor('stuffig', 'boyfriend', '000000', 0.01, 'linear')
    doTweenColor('stguffig', 'dad', '000000', 0.01, 'linear')
end

function onCreate()
local sus = false

	makeLuaSprite('UpperBar', 'empty', -200, -120)
	makeGraphic('UpperBar', 1580, 120, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)

	makeLuaSprite('LowerBar', 'empty', -200, 720)
	makeGraphic('LowerBar', 1580, 120, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)

	makeLuaSprite('light', 'empty', 0, 0)
	makeGraphic('light', 4280, 4120, '000000')
	addLuaSprite('light', true)

        setProperty('light.alpha', 0.4)

	setObjectCamera('light', 'hud')


end

function onStepHit()
if curStep == 240 then
	doTweenY('Cinematics1', 'UpperBar', 0, 1.5, 'cubicOut')
	doTweenY('Cinematics2', 'LowerBar', 600, 1.5, 'cubicOut')
    doTweenAlpha('gg', 'light', 1, 1.3, 'linear')
end

if curStep == 256 then
        setProperty('light.alpha', 0.1)
        cameraFlash('camGame', 'ffffff', 1);
        setProperty('defaultCamZoom',0.9)
    doTweenColor('stuHffig', 'boyfriend', 'FFFFFF', 0.21, 'linear')
    doTweenColor('stguHffig', 'dad', 'FFFFFF', 0.21, 'linear')
	
end
end

function onUpdatePost()
if curStep == 256 then
sus = true
end

if sus == true then
        if mustHitSection == false then
	doTweenAngle('cameraflip', 'camGame', -3, 1, 'cubicOut')
	doTweenZoom('ww', 'camGame', 0.8, 1, 'cubicOut')
        triggerEvent('Camera Follow Pos',360,360)
        else
	doTweenAngle('cameraflip', 'camGame', 3, 1, 'cubicOut')
	doTweenZoom('ww', 'camGame', 1, 1, 'cubicOut')
        triggerEvent('Camera Follow Pos',1360,560)
        end
end
if curStep == 496 then
        sus = false
        triggerEvent('Camera Follow Pos',700,400)
	doTweenZoom('ww', 'camGame', 0.6, 1.5, 'cubicOut')
	doTweenAngle('cameraflip', 'camGame', 0, 1, 'cubicOut')
        setProperty('defaultCamZoom',0.65)
end
if curStep >= 496 then
        triggerEvent('Camera Follow Pos',700,500)
end

end

