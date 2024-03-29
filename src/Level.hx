import sys.thread.FixedThreadPool;
import h2d.Graphics;
import dn.heaps.Scaler;

class Level extends dn.Process {
	var game(get, never):Game;

	var ld:First;

	inline function get_game()
		return Game.ME;

	var fx(get, never):Fx;

	inline function get_fx()
		return Game.ME.fx;

	/** Level grid-based width**/
	public var cWid(get, never):Int;

	inline function get_cWid()
		return 16;

	/** Level grid-based height **/
	public var cHei(get, never):Int;

	inline function get_cHei()
		return 16;

	/** Level pixel width**/
	public var pxWid(get, never):Int;

	inline function get_pxWid()
		return cWid * Const.GRID;

	/** Level pixel height**/
	public var pxHei(get, never):Int;

	inline function get_pxHei()
		return cHei * Const.GRID;

	var invalidated = true;

	public function new() {
		super(Game.ME);
		createRootInLayers(Game.ME.scroller, Const.DP_BG);
		ld = new First();
	}

	/** TRUE if given coords are in level bounds **/
	public inline function isValid(cx, cy)
		return cx >= 0 && cx < cWid && cy >= 0 && cy < cHei;

	/** Gets the integer ID of a given level grid coord **/
	public inline function coordId(cx, cy)
		return cx + cy * cWid;

	/** Ask for a level render that will only happen at the end of the current frame. **/
	public inline function invalidate() {
		invalidated = true;
	}

	function render() {
		// Placeholder level render

		var level_0 = ld.all_levels.Level_0;
		// var layerRender = level_0.l_Tiles.render();
		var gridTiles = level_0.l_Ground;
		var grid = level_0.l_IntGrid;

		var g = new h2d.Graphics(root);
		g.beginFill(ld.bgColor_int);
		g.drawRect(0, 0, grid.cWid * grid.gridSize, grid.cHei * grid.gridSize);
		g.endFill();

		for (cx in 0...grid.cWid)
			for (cy in 0...grid.cHei) {
				if (!grid.hasValue(cx, cy))
					continue;

				var color = grid.getColorInt(cx, cy);
				g.beginFill(color);
				g.drawRect(cx * grid.gridSize, cy * grid.gridSize, grid.gridSize, grid.gridSize);
			}

		root.addChild(gridTiles.render());

		/*
			root.removeChildren();
			for (cx in 0...cWid)
				for (cy in 0...cHei) {
					var g = new h2d.Graphics(root);
					if (cx == 0 || cy == 0 || cx == cWid - 1 || cy == cHei - 1)
						g.beginFill(0xffcc00);
					else
						g.beginFill(Color.randomColor(rnd(0, 1), 0.5, 0.4));
					g.drawRect(cx * Const.GRID, cy * Const.GRID, Const.GRID, Const.GRID);
				}
		 */
	}

	override function postUpdate() {
		super.postUpdate();

		if (invalidated) {
			invalidated = false;
			render();
		}
	}
}
