package guiSet {
	import flash.display.MovieClip;
	import flash.events.*;
	import guiSet.*;
	import flash.filters.DropShadowFilter;

	// 蜗牛类
	public class Btc extends MovieClip {
		// 蜗牛的速度、状态和名字
		public var mystate: String;
		private var _alphaStep: Number = 0.2;
		private var changing: int = 0;

		// 蜗牛的构造函数，设置速度状态和名称，添加Enter_Frame事件
		public function Btc() {
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			mystate = "OUT";
		}

		private function mouseOverHandler(e: Event): void {
			mystate = "OVER";
		}

		private function mouseOutHandler(e: Event): void {
			mystate = "OUT";
		}

		private function mouseDownHandler(e: Event): void {
			mystate = "OVER";
		}

		private function mouseUpHandler(e: Event): void {
			//mystate = "OUT";
		}

		// 处理Enter_Frame事件
		// 蜗牛运行的控制
		private function enterFrameHandler(e: Event): void {

			if (mystate == "OVER" || changing == 1) {

				if (this.alpha < 1) {

					this.alpha += _alphaStep;
					changing = 1;
				} else changing = 0;
			} else if (mystate == "OUT") {

				if (this.alpha > 0) {
					this.alpha -= _alphaStep;
				}
			} else if (mystate == "DOWN") {
				if (this.alpha > 0) {
					this.alpha -= _alphaStep;
				}
			}
		}

		private function alphaWrite() {

		}
	}
}