function onCreate()
    addLuaSprite('bgThineg')
    makeLuaSprite('bgThing', 'blackscreen', -1050, 320)
    scaleObject('bgThing', 1, 0.2)
    setObjectCamera('bgThing', 'other')
    addLuaSprite('bgThing', true)
    setScrollFactor('bgThing', 0, 0)
    setProperty('bgThing.alpha', 0.4)

makeLuaSprite('bgThineg', 'icon-house', -750, 300)
    if getProperty(songName) == 'renovation' then
        makeLuaSprite('bgThineg', 'icon-housefury', -750, 300)
    end
    if getProperty(songName) == 'multiversus' then
        makeLuaSprite('bgThineg', 'icon-jake', -775, 300)
    end
    if getProperty(songName) == 'fundament' then
        makeLuaSprite('bgThineg', 'icon-house2d', -750, 300)
    end
    if getProperty(songName) == 'dispute' then
        makeLuaSprite('bgThineg', 'icon-houseangy', -750, 300)  
    end
    scaleObject('bgThineg', 1, 1)
    setObjectCamera('bgThineg', 'other')
    addLuaSprite('bgThineg', true)
    setScrollFactor('bgThineg', 0, 0)

    makeLuaText('NowPlaying', 'Now Playing..', 300, -1050, 335)
    addLuaText('NowPlaying')
    setTextSize('NowPlaying', 25)
    setObjectCamera('NowPlaying', 'other')

    makeLuaText('SongName', getProperty(songName), 300, -1050, 360)
    addLuaText('SongName')
    setTextSize('SongName', 45)
    setObjectCamera('SongName', 'other')
	
if getProperty(songName) == 'Blueprint' then
	makeLuaText('By', 'Made by Alien 86', 300, -1050, 405)
end
if getProperty(songName) == 'breathe' then
	makeLuaText('By', 'Made by Fr4nk', 300, -1050, 405)
end
if getProperty(songName) == 'district' then
	makeLuaText('By', 'Made by Kolze', 300, -1050, 405)
end
if getProperty(songName) == 'dispute' then
	makeLuaText('By', 'Made by Alien 86', 300, -1050, 405)
end
if getProperty(songName) == 'renovation' then
	makeLuaText('By', 'Made by Bonky', 300, -1050, 405)
end
if getProperty(songName) == 'my-lawn' then
	makeLuaText('By', 'Made by Alien 86', 300, -1050, 405)
end
if getProperty(songName) == 'multiversus' then
	makeLuaText('By', 'Made by Alien 86', 300, -1050, 405)
end
if getProperty(songName) == 'swatting' then
	makeLuaText('By', 'Made by Alien 86', 300, -1050, 405)
end
if getProperty(songName) == 'fundament' then
	makeLuaText('By', 'Made by Fr4nk & Alien 86', 300, -1050, 405)
end
if getProperty(songName) == 'house' then
	makeLuaText('By', 'Made by Top 10 Awesome', 420, -1050, 405)
end
    addLuaText('By')
    setTextSize('By', 20)
    setObjectCamera('By', 'other')
end
function onStartCountdown(count)
   doTweenX('sraka', 'bgThing', -500, 1, 'circInOut')
   doTweenX('sraka2', 'NowPlaying', -20, 1, 'circInOut')
   doTweenX('srakra2', 'By', -65, 1, 'circInOut')
if getProperty(songName) == 'Blueprint' then
	doTweenX('srakra2', 'By', -45, 1, 'circInOut')
end
if getProperty(songName) == 'dispute' then
	doTweenX('srakra2', 'By', -45, 1, 'circInOut')
end
if getProperty(songName) == 'my-lawn' then
	doTweenX('srakra2', 'By', -45, 1, 'circInOut')
end
if getProperty(songName) == 'swatting' then
	doTweenX('srakra2', 'By', -45, 1, 'circInOut')
end
if getProperty(songName) == 'multiversus' then
	doTweenX('srakra2', 'By', -45, 1, 'circInOut')
end
if getProperty(songName) == 'fundament' then
	doTweenX('srakra2', 'By', 0, 1, 'circInOut')
end
   doTweenX('srakga2', 'SongName', 20, 1, 'circInOut')
   doTweenX('srakwga2', 'bgThineg', 320, 1, 'circInOut')

end
function onStepHit()
if curStep == 25 then
doTweenX('sraka', 'bgThing', -1050, 1,3, 'smootherStepOut')
doTweenX('sraka2', 'NowPlaying', -1050, 1, 'smootherStepIn')
doTweenX('srakag2', 'SongName', -1050, 1, 'smootherStepIn')
doTweenX('srakwag2', 'By', -1350, 1, 'smootherStepIn')
doTweenX('srakwagjh2', 'bgThineg', -750, 1, 'smootherStepIn')
end
end

function onBeatHit()
setProperty('NowPlaying.angle', 2)
doTweenAngle('smieszne', 'NowPlaying', 0, 0.2, 'circOut')
setProperty('SongName.angle', -2)
doTweenAngle('smieszne2', 'SongName', 0, 0.2, 'circOut')
setProperty('bgThineg.angle', 10)
doTweenAngle('smiweszne2', 'bgThineg', 0, 0.2, 'circOut')
setProperty('By.angle', -2)
doTweenAngle('smiweswzne2', 'By', 0, 0.2, 'circOut')
end