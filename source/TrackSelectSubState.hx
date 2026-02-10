import macohi.util.CamFollow;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import macohi.overrides.MSprite;
import macohi.funkin.pre_vslice.MusicBeatSubstate;

class TrackSelectSubState extends MusicBeatSubstate
{
	override public function new(album:String)
	{
		super();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (Main.controls.justReleased('back'))
			close();
	}
}
