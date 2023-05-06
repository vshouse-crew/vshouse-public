local runOffset = 0

function onCreate()
	tick = 0
	stoprunning = false
    
		makeLuaSprite('gradient', 'gradient',-1300, -400)
		scaleObject('gradient', 1.5, 1.5)
		addLuaSprite('gradient', false)
		
		makeLuaSprite('ksiezycnoc', 'ksiezycnoc',300, -200)
		scaleObject('ksiezycnoc', 1, 1)
		addLuaSprite('ksiezycnoc', false)
		setScrollFactor('ksiezycnoc', 1.7, 0.1)

		makeAnimatedLuaSprite('stage', 'stage', -1300, -400);
		addAnimationByPrefix('stage', 'stage', 'stage',13,true)
		scaleObject('stage', 1.4, 1.2);
		
		makeLuaSprite('kawalekpodlogi', 'kawalekpodlogi',-1300, 515)
		scaleObject('kawalekpodlogi', 2, 2)
		addLuaSprite('kawalekpodlogi', false)

		makeAnimatedLuaSprite('Legs', 'Legs', -130, 600);
		addAnimationByPrefix('Legs', 'Legs', 'Legs',30,true)
		scaleObject('Legs', 1.8, 1.8);

		makeAnimatedLuaSprite('BFLegs', 'BFLegs', 1330, 660);
		addAnimationByPrefix('BFLegs', 'BFLegs', 'BFLegs',30,true)
		scaleObject('BFLegs', 1, 1);
		
		makeAnimatedLuaSprite('domki', 'domki', -2300, -500);
		addAnimationByPrefix('domki', 'domki', 'domki',13,true)
		scaleObject('domki', 1.8, 1.8);
		
		addLuaSprite('gradient', false);
		addLuaSprite('ksiezycnoc', false);
		addLuaSprite('domki', false);
		addLuaSprite('kawalekpodlogi', false);
		addLuaSprite('stage', false);
		addLuaSprite('Legs', false);
		addLuaSprite('BFLegs', false);
	makeLuaSprite('overlay2', 'overlay2', -1100, -400)
    scaleObject('overlay2', 1.5, 1.2)
    addLuaSprite('overlay2', true)
	setObjectOrder('domki', 2)
end      
	

function onCreatePost() 
	objectPlayAnimation('Legs', 'Legs', true)
	objectPlayAnimation('BFLegs', 'BFLegs', true)
	objectPlayAnimation('stage', 'stage', true)
	objectPlayAnimation('domki', 'domki', true)
end

function onUpdate()
tick = tick + 1
setProperty('dad.y' , math.sin(tick * 100) * 20 + 80 - runOffset)

	local xOfStage = getProperty('stage.x')
	setProperty('stage.x', xOfStage - 50)
	
	if xOfStage == -12000 then
	setProperty('stage.x', 300)
	end
	
	local xOfdomki = getProperty('domki.x')
	setProperty('domki.x', xOfdomki - 50)
	
	if xOfdomki == -10000 then
	setProperty('domki.x', 2300)
	end

        if getProperty('health') <= 99 then
        setProperty('boyfriend.y' , math.sin(tick * 100) * 20 + 425)
        setProperty('BFLegs.y' , math.sin(tick * 100) * 20 + 670)
        end

end
