import macohi.funkin.koya.backend.AssetPaths;
import macohi.util.StringUtil;
import macohi.funkin.pre_vslice.MusicBeatState;

class AlbumSelectState extends MusicBeatState
{
	public var albumList:Array<String> = StringUtil.splitTextAssetByNewlines(AssetPaths.txt('data/albumList'));

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
