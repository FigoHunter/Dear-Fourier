package games {
	import flash.geom.Rectangle;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Sprite;
	import fl.motion.Color;
	import flash.display.MovieClip;
	import flash.filters.DropShadowFilter;
	import guiSet.*;
	import events.*;



	public class GamePlay extends MovieClip //这就是和那三个圈圈有关的东西了
	{
		private var myShadow: DropShadowFilter;

		private var wStep: Number = 150;
		private var origin: Number = 75;
		private var hght: Number = 180; //这个控制一个球三阶中相邻俩的高度差
		private var size: Number = 15; //球的大小
		private var left: Number = 0; //这个和下面那个就不改了，控制位置用的，改了从bt类继承来的放大属性有bug
		private var top: Number = 0;
		private var line: Number = 5; //线条粗细，包括球和线的
		private var lnclr: Number = 0x000000; //线条颜色，同样是指球和线的
		private var fillclr: Number = 0x000000 //球的填充颜色，其实我觉得66CCFF也是不错的。
		private var line_alpha: Number = 0.5;
		private var w: Array = new Array();
		private var temp: Bt;
		public var f: Array = new Array();
		private var dfct: int;
		private var shape: Array = new Array();
		private var lines: Array = new Array();

		public function GamePlay(dfct: int, w0: Number, w1: Number, w2: Number) {
			this.dfct = dfct;
			for (var i: int = 0; i < 3; i++) {
				w.push(0);
			}
			this.w[0] = w0;
			this.w[1] = w1;
			this.w[2] = w2;
			for (var i: int = 0; i < 3; i++) {
				f.push(0);
			}
			for (var i: int = 0; i < this.dfct; i++) {
				shape.push(new Bt());
				shape[i].x = -size + origin + wStep * (w[i] - 1);
				shape[i].y = -size;
				shape[i].graphics.lineStyle(line, lnclr, 1);
				shape[i].graphics.beginFill(fillclr, 0.5);
				shape[i].graphics.drawCircle(left, top, size);
				shape[i].graphics.endFill();
				lines.push(new Sprite());
				lines[i].x = 0;
				lines[i].y = 0;
				lines[i].graphics.lineStyle(line, lnclr, line_alpha);
				lines[i].graphics.moveTo(left + shape[i].x, top - size);
				lines[i].graphics.lineTo(left + shape[i].x, top + shape[i].y);
				this.addChild(lines[i]);
				this.addChild(shape[i]);
				shape[i].addEventListener(MouseEvent.MOUSE_DOWN, sh_down);
			}

			createShadow();
		}

		private function sh_down(e: MouseEvent): void {
			temp = Bt(e.target);
			temp.removeEventListener(MouseEvent.MOUSE_DOWN, sh_down);
			temp.addEventListener(MouseEvent.MOUSE_UP, sh_up);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, sh_up);
			temp.startDrag(false, new Rectangle(temp.x, -size - 2 * hght, 0, 2 * hght));
			this.parent.addEventListener(MouseEvent.MOUSE_MOVE, sh_move);
		}
		private function sh_move(e: MouseEvent): void {
			lines[shape.indexOf(temp, 0)].graphics.clear();
			lines[shape.indexOf(temp, 0)].graphics.lineStyle(line, lnclr, line_alpha);
			lines[shape.indexOf(temp, 0)].graphics.moveTo(left + temp.x, top - size);
			lines[shape.indexOf(temp, 0)].graphics.lineTo(left + temp.x, top + temp.y);
			for (var i: int = 0; i < dfct; i++) {
				f[i] = (-shape[i].y - size) / hght;
			}
			this.dispatchEvent(new GamingDataUpdateEvent(GamingDataUpdateEvent.CHANGE_IMAGE));
		}
		private function sh_up(e: MouseEvent): void {
			temp.stopDrag();
			this.parent.removeEventListener(MouseEvent.MOUSE_MOVE, sh_move);
			temp.removeEventListener(MouseEvent.MOUSE_UP, sh_up);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, sh_up);
			temp.addEventListener(MouseEvent.MOUSE_DOWN, sh_down);
			if (temp.y > -size - hght / 2) {
				temp.y = -size;
			} else if (temp.y < -size - 3 * hght / 2) {
				temp.y = -size - 2 * hght;
			} else {
				temp.y = -size - hght;
			}
			lines[shape.indexOf(temp, 0)].graphics.clear();
			lines[shape.indexOf(temp, 0)].graphics.lineStyle(line, lnclr, line_alpha);
			lines[shape.indexOf(temp, 0)].graphics.moveTo(left + temp.x, top - size);
			lines[shape.indexOf(temp, 0)].graphics.lineTo(left + temp.x, top + temp.y);
			for (var i: int = 0; i < dfct; i++) {
				f[i] = (-shape[i].y - size) / hght;
			}
			this.dispatchEvent(new GamingDataUpdateEvent(GamingDataUpdateEvent.DATA_CHANGED));

		}


		private function createShadow(): void {
			myShadow = new DropShadowFilter();
			myShadow.distance = 0;
			myShadow.angle = 0;
			myShadow.blurX = 10;
			myShadow.blurY = 10;
			myShadow.alpha = 0.5;
			this.filters = [myShadow];
		}

	}
}