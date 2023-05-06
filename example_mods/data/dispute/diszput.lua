

function onCreate()
local dadcamy = 700
local dadcamx = 900
local sus = 0
bumped = false
srakamodchart = false
srakamodchart2 = false
	--THE TOP BAR
	makeLuaSprite('UpperBar', 'empty', -200, -120)
	makeGraphic('UpperBar', 1580, 120, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', -200, 720)
	makeGraphic('LowerBar', 1580, 120, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)

	makeLuaSprite('light', 'empty', 0, 0)
	makeGraphic('light', 4280, 4120, '000000')
	addLuaSprite('light', true)

        setProperty('light.alpha', 0)

	setObjectCamera('light', 'hud')


end

function onStepHit()
if curStep == 512 then
        cameraFlash('camGame', 'ffffff', 3);
	doTweenY('Cinematics1', 'UpperBar', 0, 1, 'cubicOut')
	doTweenY('Cinematics2', 'LowerBar', 600, 1, 'cubicOut')
        setProperty('defaultCamZoom',0.7)
        srakamodchart = true
        triggerEvent('Camera Follow Pos',320,450)
end
if curStep == 576 then
        setProperty('defaultCamZoom',0.9)
        triggerEvent('Camera Follow Pos',1220,620)
end
if curStep == 640 then
        setProperty('defaultCamZoom',0.7)
        triggerEvent('Camera Follow Pos',320,450)
end
if curStep == 704 then
        setProperty('defaultCamZoom',0.9)
        triggerEvent('Camera Follow Pos',1220,620)
end
if curStep == 759 then
        setProperty('defaultCamZoom',0.5)
        triggerEvent('Camera Follow Pos',730, 500)
        srakamodchart2 = true
        srakamodchart = false
	doTweenY('Cinematics1', 'UpperBar', -120, 1, 'cubicOut')
	doTweenY('Cinematics2', 'LowerBar', 720, 1, 'cubicOut')
end
if curStep == 1080 then
        setProperty('defaultCamZoom',0.8)
        triggerEvent('Camera Follow Pos',320,450)
        setProperty('gameHUD.alpha', 0.9)
end
if curStep == 1084 then
        setProperty('defaultCamZoom',0.9)
        triggerEvent('Camera Follow Pos',320,450)
        setProperty('gameHUD.alpha', 0.7)
end
if curStep == 1088 then
        setProperty('defaultCamZoom',0.5)
        triggerEvent('Camera Follow Pos',730, 500)
        srakamodchart2 = true
        srakamodchart = false
end
if curStep == 1024 then
        setProperty('defaultCamZoom',0.7)
        triggerEvent('Camera Follow Pos',320,450)
end
if curStep == 988 then
        setProperty('defaultCamZoom',0.6)
end
if curStep == 1144 then
        setProperty('defaultCamZoom',0.8)
        triggerEvent('Camera Follow Pos',1220,620)
        setProperty('gameHUD.alpha', 0.9)
end
if curStep == 1148 then
        setProperty('defaultCamZoom',0.9)
        triggerEvent('Camera Follow Pos',1220,620)
        setProperty('gameHUD.alpha', 0.7)
	doTweenY('Cinematics1', 'UpperBar', 0, 6, 'cubicOut')
	doTweenY('Cinematics2', 'LowerBar', 600, 6, 'cubicOut')
end
if curStep == 1088 then
        setProperty('defaultCamZoom',0.7)
        triggerEvent('Camera Follow Pos',1220,620)
end
if curStep == 1152 then
        setProperty('defaultCamZoom',0.5)
        triggerEvent('Camera Follow Pos',730, 500)
        srakamodchart2 = true
        srakamodchart = false
end
if curStep == 1280 then
        setProperty('defaultCamZoom',0.6)
        srakamodchart2 = false
        srakamodchart = false
end
if curStep == 1543 then
        doTweenAlpha('lightlol', 'light', 1, 1.2, 'cubicOut')
end
end

function onUpdate()
sus = sus + 1
end

function onBeatHit()
if srakamodchart == true then
triggerEvent('Add Camera Zoom',0.05, 0.08)
end
if srakamodchart2 == true then
triggerEvent('Add Camera Zoom',0.02, 0.02)
end
end




