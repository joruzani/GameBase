import dn.heaps.assets.Atlas;
import dn.heaps.slib.*;

class Assets {
	public static var fontPixel:h2d.Font;
	public static var fontTiny:h2d.Font;
	public static var fontSmall:h2d.Font;
	public static var fontMedium:h2d.Font;
	public static var fontLarge:h2d.Font;
	public static var tiles:SpriteLib;
	public static var mage:h2d.Tile;
	public static var terrain_all_atlas:h2d.Tile;

	static var initDone = false;

	public static function init() {
		if (initDone)
			return;
		initDone = true;

		fontPixel = hxd.Res.fonts.minecraftiaOutline.toFont();
		fontTiny = hxd.Res.fonts.barlow_condensed_medium_regular_9.toFont();
		fontSmall = hxd.Res.fonts.barlow_condensed_medium_regular_11.toFont();
		fontMedium = hxd.Res.fonts.barlow_condensed_medium_regular_17.toFont();
		fontLarge = hxd.Res.fonts.barlow_condensed_medium_regular_32.toFont();
		tiles = dn.heaps.assets.Atlas.load("atlas/tiles.atlas");
		mage = hxd.Res.mage1_0.toTile();
		mage.dx = -mage.width / 2;
		mage.dy = -mage.height / 2;
	}
}
