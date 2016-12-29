package guiSet {
	import flash.events.MouseEvent;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.display.GradientType;
	import flash.geom.Point;
	import flash.display.MovieClip;
	public class MenuBackground extends MovieClip {
		private var shape: Shape = new Shape();
		private var matrix: Matrix = new Matrix();
		private var colors: Array = [0xEEEEEE, 0x555969]; //渐变色
		private var alphas: Array = [1, 1]; //透明度渐变，咱不需要就都是1啦
		private var ratios: Array = [4, 255]; //渐变区间，从0到255之间，区间越小渐变越快
		private var scale: Number = 5000; //渐变区间大小
		private var times: int = 0; //统计画了多少次矩形，后面代码500次清理一下
		public function MenuBackground() {
			shape.x = 0;
			shape.y = 0;
			this.parent.addEventListener(MouseEvent.MOUSE_MOVE, Mouseover);
			matrix.createGradientBox(scale, scale, 0, -1860, -2140); //前面两个表示渐变区域长宽，中间那个忘了，右边俩控制位置，把640 360 代入楼下的鼠标跟踪公式得出来的
			shape.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matrix); //渐变色填充的方法
			shape.graphics.drawRect(0, 0, 1280, 720); //这里画矩形
			shape.graphics.endFill();
			this.addChild(shape);
		}
		private function Mouseover(e: MouseEvent): void {
			var p: Point = new Point();
			p.x = this.mouseX;
			p.y = this.mouseY;
			matrix.createGradientBox(scale, scale, 0, ((1280 - p.x - scale) / 2 + 320), (720 - p.y - scale) / 2 + 180); //这就是楼下的公式，别问我怎么凑出来的，反正就是凑出来了
			shape.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matrix);
			shape.graphics.drawRect(0, 0, 1280, 720);
			shape.graphics.endFill();
			times = times + 1;
			if (times > 500) {
				shape.graphics.clear(); //大于500次了清理一下
				matrix.createGradientBox(scale, scale, 0, ((1280 - p.x - scale) / 2 + 320), (720 - p.y - scale) / 2 + 180); //怕清理完离下一次绘图的间距时间太长，被人看到白底，所以赶紧画了一遍。
				shape.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matrix);
				shape.graphics.drawRect(0, 0, 1280, 720);
				shape.graphics.endFill();
				times = 0;
			}
		}

	}

}