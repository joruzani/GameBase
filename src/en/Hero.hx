package en;

import h2d.Bitmap;
import dn.heaps.Controller;

class Hero extends Entity {
	var ca:dn.heaps.Controller.ControllerAccess;

	public function new(x, y) {
		super(x, y);

		var g = new h2d.Graphics(spr);
		var bmp = new Bitmap(Assets.mage);
		g.addChild(bmp);

		ca = Main.ME.controller.createAccess("hero");
	}

	override function dispose() {
		super.dispose();
		ca.dispose();
	}

	override function update() {
		super.update();

		if (ca.leftDown() || ca.isKeyboardDown(hxd.Key.LEFT))
			dx -= 0.1 * tmod;

		if (ca.rightDown() || ca.isKeyboardDown(hxd.Key.RIGHT))
			dx += 0.1 * tmod;
	}
}
