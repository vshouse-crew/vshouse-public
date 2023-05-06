package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.tweens.FlxTween;
#if MODS_ALLOWED
import sys.FileSystem;
#end

using StringTools;

class GalleryChooseState extends MusicBeatState
{
	private var grpTexts:FlxTypedGroup<Alphabet>;
	public var images:Array<FlxSprite>;
	var logoBl:FlxSprite;
	var sranie:FlxSprite;
	var chuj:FlxSprite;
	var fifigej:Bool;
	var barrierWarningScreen:FlxSprite;
	var barrierWarningText:FlxText;
        public var currentBarrierImage:Int;
	private var curSelected = 0;
	private var curDirectory = 0;
	public var currentIndex:Int;
    public var currentBarrier:Int;
    public var barrierShake:Float;
	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;
	override function create()
	{

fifigej = true;

	var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBG'));
	bg.scrollFactor.set();
	add(bg);

	sranie = new FlxSprite(125).loadGraphic(Paths.image('gallery/concept'));
	sranie.scrollFactor.set();
	sranie.screenCenter(Y);
	add(sranie);

	chuj = new FlxSprite(700).loadGraphic(Paths.image('gallery/memes'));
	chuj.scrollFactor.set();
	chuj.screenCenter(Y);
	chuj.alpha = 0.7;
	add(chuj);

        var offset:Float = 50;
		currentIndex = 0;
	}
		public function nextImage():Void {
	
			currentIndex++;
			if (currentIndex > 1) {
							currentIndex = currentIndex - 1;
							FlxG.sound.play(Paths.sound('error'), 0.9);
							barrierImage();
			}
		}

		public function previousImage():Void {
			currentIndex--;
	
			if (currentIndex < 0) {
							currentIndex = currentIndex + 1;
							FlxG.sound.play(Paths.sound('error'), 0.9);
							barrierImage();
			}
		}
	
		public function changestuff():Void {
			if (currentIndex == 0) {
				sranie.alpha = 1;
				} else {
					sranie.alpha = 0.7;
				}
				if (currentIndex == 1) {
					chuj.alpha = 1;
					} else {
						chuj.alpha = 0.7;
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
		
// if(currentBarrier > 18)
//             {
//                 PlayState.storyPlaylist = ["barrier"];
//                 PlayState.isStoryMode = false;
//                 PlayState.seenCutscene = false;
        
//                 var diffic = "";
        
//                 PlayState.storyDifficulty = 0;
        
//                 PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
//                 PlayState.storyWeek = 1;
//                 PlayState.campaignScore = 0;
//                 PlayState.campaignMisses = 0;
//                 new FlxTimer().start(0.5, function(tmr:FlxTimer)
//                 {
//                     LoadingState.loadAndSwitchState(new PlayState());
//                     FlxG.sound.music.volume = 0;
//                     FreeplayState.destroyFreeplayVocals();
//                 });
//             }
// the funny - hooovie
		if (controls.UI_LEFT_P && fifigej)
		{
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
                        previousImage();
                        changestuff();
                        new FlxTimer().start(5, function(tmr:FlxTimer) {
                            currentBarrier = 0;
						});
		}
		if (controls.UI_RIGHT_P && fifigej)
		{
                        FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
			nextImage();
                        changestuff();
                        new FlxTimer().start(5, function(tmr:FlxTimer) {
                            currentBarrier = 0;
						});
		}


		if (controls.BACK && fifigej)
		{
			if(FreeplayState.vocals == null)
				{
				FlxG.sound.music.fadeIn(0.5, 0.7, 0);
            new FlxTimer().start(0.5, function(tmr:FlxTimer) {
				FlxG.sound.playMusic(Paths.music('freakyMenu'), 0.7);
                MusicBeatState.switchState(new MainMenuState());
            });
		}
			else
				{
					MusicBeatState.switchState(new MainMenuState());
				}

		}

		if (controls.ACCEPT && fifigej)
		{
			if (currentIndex == 0) {
				MusicBeatState.switchState(new GalleryConceptState());
			}
			if (currentIndex == 1) {
				MusicBeatState.switchState(new GalleryMemesState());
			}
		}

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
		
		super.update(elapsed);
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