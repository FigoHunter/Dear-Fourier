package games {
	import flash.geom.Rectangle;
	import flash.display.Sprite;
	import fl.motion.Color;
	import flash.display.MovieClip;
	import flash.filters.DropShadowFilter;
	public class ShowAnswer extends MovieClip {
		private var answer: Array = new Array();
		private var answerShow: Array = new Array();
		private var ansLine: Array = new Array();
		private var wStep: Number = 150;
		private var origin: Number = 75;
		private var hght: Number = 180; //这个控制一个球三阶中相邻俩的高度差
		private var size: Number = 15; //球的大小
		private var line: Number = 5; //线条粗细，包括球和线的
		private var lnclr: Number = 0x666666; //线条颜色，同样是指球和线的
		private var fillclr: Number = 0x000000 //球的填充颜色，其实我觉得66CCFF也是不错的。
		private var line_alpha: Number = 0.25;
		private var dfct: int;
		private var w: Array = new Array();
		public function ShowAnswer(dfct: int, w0: Number, w1: Number, w2: Number, f0: int, f1: int, f2: int) {
			this.dfct = dfct;
			for (var i: int = 0; i < 3; i++) {
				w.push(0);
			}
			this.w[0] = w0;
			this.w[1] = w1;
			this.w[2] = w2;
			answer[0] = f0;
			answer[1] = f1;
			answer[2] = f2;
			for (var i: int = 0; i < this.dfct; i++) {
				answerShow.push(new Sprite());
				ansLine.push(new Sprite());
				answerShow[i].x = -size + origin + wStep * (w[i] - 1);
				answerShow[i].y = -size - answer[i] * hght;
				answerShow[i].graphics.lineStyle(line, lnclr, 1);
				answerShow[i].graphics.beginFill(fillclr, 0.25);
				answerShow[i].graphics.drawCircle(0, 0, size);
				answerShow[i].graphics.endFill();
				ansLine[i].x = 0;
				ansLine[i].y = 0;
				ansLine[i].graphics.lineStyle(line, lnclr, line_alpha);
				ansLine[i].graphics.moveTo(answerShow[i].x, 0 - size);
				ansLine[i].graphics.lineTo(answerShow[i].x, answerShow[i].y);
				this.addChild(ansLine[i]);
				this.addChild(answerShow[i]);
			}
		}

	}

}