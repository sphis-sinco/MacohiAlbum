import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;
import macohi.overrides.MSprite;
import macohi.funkin.pre_vslice.MusicBeatSubstate;

class TrackSelectSubState extends MusicBeatSubstate
{
	public var bg:MSprite;

	override public function new(album:String)
	{
		super();

		bg = new MSprite().makeGraphic(FlxG.width, FlxG.height);
		add(bg);
		bg.alpha = 0;

		tweenBGIn();
	}

	public function tweenBGIn()
	{
		if (bg != null)
			FlxTween.tween(bg, {alpha: 1}, .3, {
				ease: FlxEase.quadInOut
			});
	}

	public function tweenBGOut()
	{
		if (bg != null)
			FlxTween.tween(bg, {alpha: 0}, .3, {
				ease: FlxEase.quadInOut
			});
	}

	override function close()
	{
		if (_parentState != null && _parentState.subState == this)
		{
			var ogpu = _parentState.persistentUpdate;
			_parentState.persistentUpdate = true;

			tweenBGOut();
			FlxTimer.wait(.3, () ->
			{
				_parentState.persistentUpdate = ogpu;
				_parentState.closeSubState();
			});
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (Main.controls.justReleased('back'))
			close();
	}
}
