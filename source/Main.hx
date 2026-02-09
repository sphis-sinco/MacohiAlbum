import macohi.util.ControlClass;
import macohi.funkin.koya.backend.AssetPaths;
import macohi.debugging.CrashHandler;
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public static var controls:ControlClass = new ControlClass();

	public function new()
	{
		super();

		controls.keybinds.set('left', ['A', 'LEFT']);
		controls.keybinds.set('down', ['S', 'DOWN']);
		controls.keybinds.set('up', ['W', 'UP']);
		controls.keybinds.set('right', ['D', 'RIGHT']);

		addChild(new FlxGame(0, 0, AlbumSelectState));

		CrashHandler.initalize(null, 'MacohiAlbum_', null, 'MacohiAlbum');
		AssetPaths.soundExt = 'wav';
	}
}
