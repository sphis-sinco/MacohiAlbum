import macohi.funkin.koya.backend.AssetPaths;
import macohi.debugging.CrashHandler;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, AlbumSelectState));

		CrashHandler.initalize(null, 'MacohiAlbum_', null, 'MacohiAlbum');
		AssetPaths.soundExt = 'wav';
	}
}
