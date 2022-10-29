package gameObjects.songScripts;

import meta.MusicBeat.MusicBeatState;
import meta.state.PlayState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import meta.data.dependency.FNFSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.math.FlxRect;
import flixel.text.FlxText;
class BecomingUncanny extends MusicBeatState
{
var followTractor:Bool = false;
var lyric:FlxText;
public function new(instance:PlayState)
{
    super(transIn,transOut);
    PlayState.dadOpponent.setCharacter(50,850,'uncanny3'); //cache
    PlayState.dadOpponent.setCharacter(50,850,PlayState.SONG.player2);
    PlayState.uiHUD.iconP2.updateIcon(PlayState.SONG.player2,false);
}
override function stepHit()
{
    super.stepHit();
    switch(curStep)
    {
    case 421:
        followTractor = true;
        doTractor();
    case 431:
        uncanny();
        followTractor = false;
    case 720:
        lyric = new FlxText(0,0,0,"I'm becoming-uncanny ah ahh plz help me");
        lyric.setFormat(Paths.font('vcr.ttf'),36,FlxColor.WHITE,CENTER);
        lyric.cameras = [PlayState.camHUD];
        lyric.screenCenter();
        lyric.y += 200;
        add(lyric);
    case 751:
        remove(lyric);
    }
}
private function doTractor()
{
    FlxTween.tween(PlayState.stageBuild.tractor,{x: PlayState.stageBuild.tractor.x + 2100},3.7,{ease: FlxEase.quintOut});
}
private function uncanny()
    {
        FlxG.camera.flash(FlxColor.WHITE,1);
        PlayState.stageBuild.tractor.visible = false;
        PlayState.dadOpponent.setCharacter(50,850,'uncanny3');
        PlayState.stageBuild.house.loadGraphic(Paths.image('backgrounds/gaming-house-demolished/demolished'));
        PlayState.uiHUD.iconP2.updateIcon('uncanny3',false);
    }
override function update(elapsed:Float)
{
    super.update(elapsed);
    if (followTractor)
    PlayState.camFollowPos.setPosition(PlayState.stageBuild.tractor.getMidpoint().x,PlayState.stageBuild.tractor.getMidpoint().y);
}
}