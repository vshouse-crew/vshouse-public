package;
import flixel.FlxGame;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class RenovationWarningState extends MusicBeatState
{
    public static var leftState:Bool = false;

    var warnText:FlxText;
    var warningText:FlxText;
    var smolinfo:FlxText;
    var siema:FlxSprite;
    override public function create()
    {
        super.create();

        FlxG.sound.playMusic(Paths.music('renovation'), 0.5);

        var bg = new FlxSprite().loadGraphic(Paths.image('renovationwarningbg'));
        bg.antialiasing = ClientPrefs.globalAntialiasing;
        bg.setGraphicSize(Std.int(bg.width * 0.7));
        bg.screenCenter(XY);
        add(bg);	

        siema = new FlxSprite();
        siema.frames = Paths.getSparrowAtlas('renovationwarningtext');
		siema.antialiasing = ClientPrefs.globalAntialiasing;
		siema.animation.addByPrefix('co', 'jajco', 24, true);
		siema.animation.play('co');
		siema.updateHitbox();
        siema.setGraphicSize(Std.int(siema.width * 0.7));
        siema.screenCenter(XY);
        add(siema);

    }

    override function update(elapsed:Float)
    {
            if (controls.ACCEPT) {
                PlayState.renovationcut = true;
                MusicBeatState.switchState(new PlayState());
            }

        super.update(elapsed);
    }
}