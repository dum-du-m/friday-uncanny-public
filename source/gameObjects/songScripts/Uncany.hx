package gameObjects.songScripts;
import meta.MusicBeat.MusicBeatState;
import meta.state.PlayState;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.text.FlxText;
class Uncany extends MusicBeatState
{
    var lyric:FlxText;
    public function new(instance:PlayState)
    {
        super(transIn,transOut);
    }
    override function stepHit()
    {
       super.stepHit();
       switch(curStep)
       {
        case 1 | 63 | 816 | 960:
            FlxG.camera.shake(0.04,5);
        case 1376:
            lyric = new FlxText(0,0,0,"U have bested me again boyfreind u will pay 4 doing this 2 me");
            lyric.setFormat(Paths.font('vcr.ttf'),36,FlxColor.WHITE,CENTER);
            lyric.cameras = [PlayState.camHUD];
            lyric.screenCenter();
            lyric.y += 200;
            add(lyric);
        case 1424:
            remove(lyric);
            FlxTween.tween(FlxG.camera,{zoom: 3},10,{ease: FlxEase.linear});
        case 1551:
            FlxTween.tween(FlxG.camera,{zoom: 3},0.2,{ease: FlxEase.linear});
            FlxTween.tween(PlayState.dadOpponent,{alpha: 0},2.3,{ease:FlxEase.linear});
            FlxTween.tween(PlayState.uiHUD.iconP2,{alpha: 0},2.3,{ease:FlxEase.linear});
       } 
    }
}