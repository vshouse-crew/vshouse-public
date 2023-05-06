import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import flixel.input.keyboard.FlxKeyboard;
import flixel.group.FlxGroup;
import flixel.graphics.frames.FlxFrame;
import flixel.graphics.frames.FlxAtlasFrames;
import Controls;
using StringTools;

class GalleryMemesState extends MusicBeatState {

    public var images:Array<FlxSprite>;
    var logoBl:FlxSprite;
    var text:Alphabet;
    var fifigej:Bool;
    var barrierWarningScreen:FlxSprite;
	var barrierWarningText:FlxText;
    public var currentIndex:Int;
    public var currentBarrier:Int;
    public var barrierShake:Float;
    public var currentBarrierImage:Int;
	var imageText:FlxText;
	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;

    override public function create():Void
    {

        fifigej = true;

        images = new Array<FlxSprite>();
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/1.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/2.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/3.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/4.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/5.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/6.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/7.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/8.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/9.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/10.png', IMAGE)));
        images.push(new FlxSprite().loadGraphic(Paths.getPath('images/gallery/memes/11.png', IMAGE)));


	var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBG'));
	bg.scrollFactor.set();
	add(bg);

    imageText = new FlxText(0, FlxG.height - 70, FlxG.width, "thats so screwed man", 32);
    imageText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
    imageText.screenCenter(X);
    imageText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 1.5);
    add(imageText);

        currentIndex = 0;

        add(images[currentIndex]);

        for (image in images) {
            image.x = (FlxG.width - image.width) / 2;
            image.y = (FlxG.height - image.height) / 2;
            image.setSize(100, 100);
        }


        var offset:Float = 50;
        logoBl = new FlxSprite(110, 50);
		logoBl.antialiasing = ClientPrefs.globalAntialiasing;
		logoBl.updateHitbox();
        add(logoBl);
        var timer:FlxTimer = new FlxTimer().start(0.001, sayHello);

		selectorLeft = new Alphabet(950, 630, '>', true, false);
		add(selectorLeft);
		selectorRight = new Alphabet(250, 630, '<', true, false);
		add(selectorRight);

        selectorRight.visible = false;
    }

         private function sayHello(timer:FlxTimer)
        {
            timer.start(0.3, sayHello1);
            logoBl.loadGraphic(Paths.getPath('images/gallery/ramka1.png', IMAGE));
        }

        private function sayHello1(timer:FlxTimer)
        {
            timer.start(0.3, sayHello);
            logoBl.loadGraphic(Paths.getPath('images/gallery/ramka2.png', IMAGE));
        }


    public function nextImage():Void {
        remove(images[currentIndex]);

        currentIndex++;
        if (currentIndex >= images.length) {
                        currentIndex = currentIndex - 1;
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        barrierImage();
        }
        add(images[currentIndex]);
    }

    public function previousImage():Void {
        remove(images[currentIndex]);
        currentIndex--;

        if (currentIndex < 0) {
                        currentIndex = currentIndex + 1;
                        FlxG.sound.play(Paths.sound('error'), 0.9);
                        barrierImage();
        }

        add(images[currentIndex]);
    }

    public function changestuff():Void {
        if (currentIndex == 0) {
        imageText.text = "thats so screwed man";
        selectorRight.visible = false;
        } else {
        selectorRight.visible = true;
        }
        
        if (currentIndex == 1) {
        imageText.text = "multiversus reference???";
        }
        if (currentIndex == 2) {
            imageText.text = "sdfcgvhbjnhgvf";
        }
        if (currentIndex == 3) {
        imageText.text = "dad battle erect remix leak";
        }
        if (currentIndex == 4) {
        imageText.text = "hmmm???";
        }
        if (currentIndex == 5) {
        imageText.text = "hii haiii hiiowo hiii";
        }
        if (currentIndex == 6) {
        imageText.text = "angy hose";
        }
        if (currentIndex == 7) {
        imageText.text = "yeah yeah go pico";
        }
        if (currentIndex == 8) {
        imageText.text = "ugh";
        }
        if (currentIndex == 9) {
        imageText.text = "casa de amongus";
        }
        if (currentIndex == 10) {
        imageText.text = "huh";


        selectorLeft.visible = false;
        } else {
            selectorLeft.visible = true;
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

        if(controls.ACCEPT && currentIndex == 1 && fifigej)
            {
                PlayState.storyPlaylist = ["multiversus"];
                PlayState.isStoryMode = false;
                PlayState.seenCutscene = false;
        
                var diffic = "";
        
                PlayState.storyDifficulty = 0;
        
                PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
                PlayState.storyWeek = 1;
                PlayState.campaignScore = 0;
                PlayState.campaignMisses = 0;
                new FlxTimer().start(0.5, function(tmr:FlxTimer)
                {
                    LoadingState.loadAndSwitchState(new PlayState());
                    FlxG.sound.music.volume = 0;
                    FreeplayState.destroyFreeplayVocals();
                });
            }
        // if(currentBarrier > 18)
        //     {
        //         PlayState.storyPlaylist = ["barrier"];
        //         PlayState.isStoryMode = false;
        //         PlayState.seenCutscene = false;
        
        //         var diffic = "";
        
        //         PlayState.storyDifficulty = 0;
        
        //         PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
        //         PlayState.storyWeek = 1;
        //         PlayState.campaignScore = 0;
        //         PlayState.campaignMisses = 0;
        //         new FlxTimer().start(0.5, function(tmr:FlxTimer)
        //         {
        //             LoadingState.loadAndSwitchState(new PlayState());
        //             FlxG.sound.music.volume = 0;
        //             FreeplayState.destroyFreeplayVocals();
        //         });
        //     }
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
            FlxG.sound.play(Paths.sound('cancelMenu'), 0.4);
			MusicBeatState.switchState(new GalleryChooseState());

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