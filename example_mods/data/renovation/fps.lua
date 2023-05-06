function onDestroy()
setPropertyFromClass("openfl.Lib", "application.window.frameRate", fpsBeforeRenovation)
end


function onCreate()
fpsBeforeRenovation = getPropertyFromClass("openfl.Lib", "application.window.frameRate")
end

function onUpdate()
setPropertyFromClass("openfl.Lib", "application.window.frameRate", 60)
end