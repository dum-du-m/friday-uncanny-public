package gameObjects.songScripts;

import meta.MusicBeat.MusicBeatState;
import meta.state.PlayState;
import flixel.FlxG;
import flixel.util.FlxColor;
class Phantasm extends MusicBeatState
{
public function new(instance:PlayState)
{
    super(transIn,transOut);
    uncanny(true); //cache
    canny(true); //cache
    PlayState.uiHUD.iconP2.visible = false;
    PlayState.dadOpponent.visible = false;
    PlayState.gf.visible = false;
}
    override function stepHit()
        {
            super.stepHit();
            switch (curStep)
            {
                case 384 | 768 | 1151 | 1172 | 1276 | 1282 | 1304 | 1536 | 1922 | 1937 | 1943 | 1956:
                    uncanny();
                case 640 | 1024 | 1154 | 1176 | 1279 | 1300 | 1408 | 1792 | 1926 | 1940 | 1946 | 1960:
                    canny();
            }
        }
    private function uncanny(onlyChars:Bool = false)
    {
        if (!onlyChars)
            {
        FlxG.camera.flash(FlxColor.WHITE,1);
        PlayState.stageBuild.house.loadGraphic(Paths.image('backgrounds/gaming-house-demolished/demolished'));
            }

        PlayState.boyfriend.setCharacter(750, 850,'uncanny3');
        PlayState.uiHUD.iconP1.updateIcon('uncanny3',true);

    }
    private function canny(onlyChars:Bool = false)
    {
        if (!onlyChars)
            {
        FlxG.camera.flash(FlxColor.WHITE,1);
        PlayState.stageBuild.house.loadGraphic(Paths.image('backgrounds/gaming-house/house'));
            }

        PlayState.boyfriend.setCharacter(750, 850,'uncanny-phantasm');
        PlayState.uiHUD.iconP1.updateIcon('uncanny-sadly',true);
    }
}