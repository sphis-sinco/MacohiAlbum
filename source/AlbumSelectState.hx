import flixel.FlxG;
import macohi.overrides.MText;
import flixel.group.FlxGroup.FlxTypedGroup;
import macohi.funkin.koya.backend.AssetPaths;
import macohi.util.StringUtil;
import macohi.funkin.pre_vslice.MusicBeatState;

class AlbumSelectState extends MusicBeatState
{
	public var albumList:Array<String> = StringUtil.splitTextAssetByNewlines(AssetPaths.txt('data/albumList'));

	public var albumTexts:FlxTypedGroup<MText> = new FlxTypedGroup<MText>();

	public var currentSelection:Int = 0;

	override public function create()
	{
		super.create();

		trace(albumList);

		var i = 0;
		for (album in albumList)
		{
			var newAlbum:MText = new MText().makeText(album, 48);
			albumTexts.add(newAlbum);

			newAlbum.screenCenter();
			newAlbum.ID = i;

			newAlbum.y += i * 80;

			i++;
		}

		add(albumTexts);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		for (albumText in albumTexts.members)
		{
			if (albumText.ID == currentSelection)
				FlxG.camera.follow(albumText);
		}

		if (Main.controls.justReleased('up'))
			currentSelection--;
		if (Main.controls.justReleased('down'))
			currentSelection++;

		if (currentSelection < 0) currentSelection = albumList.length - 1;
		if (currentSelection > albumList.length - 1) currentSelection = 0;
	}
}
