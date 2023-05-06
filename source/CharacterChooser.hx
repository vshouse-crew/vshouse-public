package;

import flixel.addons.display.FlxBackdrop;
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import haxe.Json;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import options.GraphicsSettingsSubState;
//import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.Assets;

using StringTools;

class CharacterChooser extends MusicBeatState
{
    public var images:Array<FlxSprite>;
	var bg:FlxSprite;
    var arrow1:FlxSprite;
    var arrow2:FlxSprite;
	var Character:FlxSprite;
    var brick:FlxBackdrop;

	var fifigej:Bool;
	var barrierWarningScreen:FlxSprite;
	var barrierWarningText:FlxText;
    public var currentBarrierImage:Int;
    public var currentBarrier:Int;
    public var barrierShake:Float;

        var curSelectedSkin:String;
        public var currentIndex:Int;
        var imageText:FlxText;
        var kakaText:FlxText;
	override function create()
	{

        fifigej = true;

        FlxG.sound.playMusic(Paths.music('characterselectiontrack'), 0.7);
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Skin Chooser", null);
		#end
		FlxG.mouse.visible = false;
		super.create();



		bg = new FlxSprite().loadGraphic(Paths.image('cc/ccbg'));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.screenCenter();

        brick = new FlxBackdrop(Paths.image('cc/smiesznepaski'), 3, 0, true, false); 
        brick.velocity.set(100, 0); 
        brick.updateHitbox(); 
        brick.antialiasing = ClientPrefs.globalAntialiasing;
        brick.scrollFactor.set(0, 0); 
        brick.alpha = 1; 
        brick.screenCenter(X); 
        add(brick);

        var bars = new FlxSprite().loadGraphic(Paths.image('cc/ccblackbar'));
		bars.antialiasing = ClientPrefs.globalAntialiasing;
		add(bars);
		bars.screenCenter();

        arrow1 = new FlxSprite().loadGraphic(Paths.image('cc/arrow1'));
		arrow1.antialiasing = ClientPrefs.globalAntialiasing;
		add(arrow1);
		arrow1.screenCenter();

        arrow2 = new FlxSprite().loadGraphic(Paths.image('cc/arrow2'));
		arrow2.antialiasing = ClientPrefs.globalAntialiasing;
        arrow2.visible = false;
		add(arrow2);
		arrow2.screenCenter();

        imageText = new FlxText(0, FlxG.height - 125, FlxG.width, "DEFAULT", 32);
        imageText.setFormat("assets/fonts/zbigniew.ttf", 96, FlxColor.WHITE, CENTER);
        imageText.screenCenter(X);
        imageText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.5);
        add(imageText);
        kakaText = new FlxText(0, FlxG.height - 700, FlxG.width, "CURRENTLY SELECTED:", 32);
        kakaText.setFormat("assets/fonts/zbigniew.ttf", 96, FlxColor.WHITE, CENTER);
        kakaText.screenCenter(X);
        kakaText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.5);
        add(kakaText);

        images = new Array<FlxSprite>();
        if (PlayState.SONG.song != 'swatting') {
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/Characters/Boyfriend_Assets.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/Characters/BFDistrict.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/Characters/Boyfriend_Assets_dom.png', IMAGE)));
        }

        if (PlayState.SONG.song == 'swatting')
        {
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/Characters/pico.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/Characters/DistrictPico.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/Characters/picohouse.png', IMAGE)));
        }
        currentIndex = 0;

        add(images[currentIndex]);

        for (image in images) {
            image.x = (FlxG.width - image.width) / 2;
            image.y = (FlxG.height - image.height) / 2;
            image.antialiasing = ClientPrefs.globalAntialiasing;
            image.setSize(100, 100);

    }
	}
    public function nextImage():Void {
        remove(images[currentIndex]);

        currentIndex++;
        if (currentIndex >= images.length) {
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        FlxG.camera.shake(0.005, 0.15);
                        currentIndex = currentIndex - 1;
                        barrierImage();
        }
        add(images[currentIndex]);
    }
    public function previousImage():Void {
        remove(images[currentIndex]);
        currentIndex--;

        if (currentIndex < 0) {
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        FlxG.camera.shake(0.005, 0.15);
                        currentIndex = currentIndex + 1;
                        barrierImage();
        }
        add(images[currentIndex]);
    }
    public function changestuff():Void {
        if (currentIndex == 0) {
            imageText.text = "DEFAULT";
            arrow2.visible = false;
            } else {
            arrow2.visible = true;
            }
            if (currentIndex == 1) {
                imageText.text = "DISTRICT";
            }
            if (currentIndex == 2) {
                imageText.text = "HOUSE";
                arrow1.visible = false;
                } else {
                arrow1.visible = true;
                }
    }
	override function update(elapsed:Float)
	{
		currentBarrierImage = FlxG.random.int(0,3);
		if(currentBarrier == 18) {
                        if(currentBarrierImage == 0)
						FlxG.openURL("https://cdn.discordapp.com/attachments/1034797358732554300/1103084318592598016/TONERUOY1.png", "_blank");
                        if(currentBarrierImage == 1)
		       		 	FlxG.openURL("https://cdn.discordapp.com/attachments/1034797358732554300/1103084319154643024/DERAPERP2.png", "_blank");
                        if(currentBarrierImage == 2)
						FlxG.openURL("https://cdn.discordapp.com/attachments/1034797358732554300/1103084319494377482/ROF3.png", "_blank");
						if(currentBarrierImage == 3)
						FlxG.openURL("https://cdn.discordapp.com/attachments/1034797358732554300/1103084319955755039/TAHT4.png", "_blank");
			barrierWarning();
			currentBarrier = 0;
			barrierShake = 0;
		}

		if (controls.UI_RIGHT_P && fifigej)
		{
			nextImage();
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                        changestuff();
		}
		if (controls.UI_LEFT_P && fifigej)
		{
                        previousImage();
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                        changestuff();
		}
		if (controls.BACK && fifigej)
		{
                MusicBeatState.switchState(new FreeplayState());
                FlxG.sound.music.fadeIn(0.5, 0.7, 0);
                FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
                };

                if (controls.ACCEPT && fifigej)
                {
        if (PlayState.SONG.song != 'swatting')
        {
        if (currentIndex == 0) {
            PlayState.SONG.player1 = 'bf'; 
            PlayState.SONG.gfVersion = 'gf'; 
        }
        if (currentIndex == 1) {
            PlayState.SONG.player1 = 'bfdistrict'; 
            PlayState.SONG.gfVersion = 'DistrictGF';
        }
        if (currentIndex == 2) {
            PlayState.penis = true;
            PlayState.SONG.player1 = 'bfhouse'; 
            PlayState.SONG.gfVersion = 'gfdom';
        }
        }
        if (PlayState.SONG.song == 'swatting')
        {
        if (currentIndex == 0) {
            PlayState.SONG.player1 = 'pico-player'; 
            PlayState.SONG.gfVersion = 'nogf';
        }
        if (currentIndex == 1) {
            PlayState.SONG.player1 = 'DistrictPico'; 
            PlayState.SONG.gfVersion = 'nogf';
        }
        if (currentIndex == 2) {
            PlayState.SONG.player1 = 'pico-player-dom'; 
            PlayState.SONG.gfVersion = 'nogf';
        }
        }

        if (PlayState.SONG.song == 'renovation')
        {
        if (currentIndex == 0) {
            PlayState.SONG.player1 = 'bfrenovation'; 
            PlayState.SONG.gfVersion = 'nogf';
            LoadingState.loadAndSwitchState(new PlayState());
        }
    }
        if (PlayState.SONG.song != 'renovation')
        {
                    new FlxTimer().start(0.2, function(tmr:FlxTimer)
                        {
                            LoadingState.loadAndSwitchState(new PlayState());
                        });
                }
        }
		super.update(elapsed);

		if ((controls.ACCEPT || controls.BACK) && !fifigej)
			{
				FlxTween.tween(barrierWarningScreen, {alpha: 0}, 1.5, {onComplete: function(twn:FlxTween)
					{
						barrierWarningScreen.destroy;
					}});
					FlxTween.tween(barrierWarningText, {alpha: 0}, 1.5, {onComplete: function(twn:FlxTween)
						{
							barrierWarningText.destroy;
							fifigej = true;
						}});
			}

	}
	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
	}

	public function barrierWarning():Void {
        fifigej = false;
        
                    barrierWarningScreen = new FlxSprite();
                    barrierWarningScreen.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
                    barrierWarningScreen.alpha = 0.5;
                    add(barrierWarningScreen);
        
                    barrierWarningText = new FlxText(FlxG.width/2-100, FlxG.height/2-50, 200, "Do NOT ever do that again.");
                    barrierWarningText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
                    add(barrierWarningText);
            }
        
            public function barrierImage():Void {
                currentBarrier = currentBarrier + 1;
                barrierShake = barrierShake + 0.001;
                FlxG.camera.shake(0.005 + barrierShake, 0.15);
            }

}