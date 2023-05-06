local throwbrick = false
local count = 1
local warning = false
local candodge = false
local hurt = false

function onCreate()
	tick = 0

addLuaScript('mods/stages/sexrunstage')

        addCharacterToList('housethrow', 'dad')

        addCharacterToList('houserun', 'dad')

	makeLuaSprite('Humpscare', 'Shift', -20, -120)
	setObjectCamera('Humpscare', 'other')
	addLuaSprite('Humpscare', true)
        screenCenter('Humpscare', 'xy')
        setProperty('Humpscare.visible', false)

	makeLuaSprite('EyeBloody', 'EyeBloody', -20, -120)
	setObjectCamera('EyeBloody', 'other')
	addLuaSprite('EyeBloody', true)
        screenCenter('EyeBloody', 'xy')
        setProperty('EyeBloody.visible', false)
end

function onEvent(name, value1, value2)
	if name == "CAMERAZ" then
	          throwbrick = true
              triggerEvent('Change Character', 'dad', 'housethrow')
              count = 0
              warning = true
              candodge = true
              hurt = true
              setProperty('Humpscare.visible', true)
              setProperty('EyeBloody.visible', true)
doTweenColor('srkaya', 'Humpscare', 'FFFFFF', 0.00002, 'linear')
	end
end


function onUpdate()
tick = tick + 1
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') == true then
if throwbrick == true then
if candodge == true then
hurt = false
candodge = false
end
end
end
if throwbrick == true then
setProperty('dad.y' , math.sin(tick * 100) * 20 + 80 + 200)
end
end

function onBeatHit()

if throwbrick == true then
count = count + 1    
end
if warning == true then
playSound('warning', 1);
end

if count == 1 then
setProperty('EyeBloody.alpha', 1)
doTweenAlpha('sracziczi', 'EyeBloody', 0, 0.3, 'cubeIn')

characterPlayAnim('dad', 'Pick', true)
end

if count == 2 then
warning = false
setProperty('EyeBloody.alpha', 1)
doTweenAlpha('sracziczi', 'EyeBloody', 0, 0.3, 'cubeIn')

characterPlayAnim('dad', 'Swing', true)
end

if count == 3 then
setProperty('EyeBloody.alpha', 0)
playSound('throw', 1);
candodge = false
characterPlayAnim('dad', 'Throw', true)
if hurt == true then
doTweenColor('srkaha', 'Humpscare', 'FF0000', 0.1, 'linear')
end

if hurt == false then
doTweenColor('srkaa', 'Humpscare', '00f900', 0.1, 'linear')
end

end

if count == 4 then
if hurt == true then

triggerEvent('Change Character', 'dad', 'houserun')
playSound('brick', 1);
count = 0
setProperty('health', getProperty('health')-0.5);
setProperty('Humpscare.visible', false)
throwbrick = false
setProperty('EyeBloody.visible', false)
end
if hurt == false then
triggerEvent('Change Character', 'dad', 'houserun')
playSound('dodged', 1);
count = 0
throwbrick = false
setProperty('Humpscare.visible', false)
        setProperty('EyeBloody.visible', false)
end
end 
end
