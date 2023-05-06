function onCreate()
addCharacterToList('jakebounce','dad')
addCharacterToList('jakemultiversus','dad')
end

function onUpdate()

if curStep == 111 then

triggerEvent('Change Character', 'dad', 'jakebounce')

triggerEvent('Play Animation', 'Hey', 'dad')

doTweenZoom('jajo', 'camGame', 0.8, 0.3, 'cubicInOut')
triggerEvent('Camera Follow Pos',320,450)
end


if curStep == 127 then

triggerEvent('Change Character', 'dad', 'jakemultiversus')

triggerEvent('Play Animation', 'idle', 'dad')
end
end