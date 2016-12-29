package guiSet {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.*;
	import guiSet.*;
	import flash.filters.DropShadowFilter;
	import flash.display.Sprite;
	import flash.ui.Mouse;

	public class ShowAns extends Bt {
		private var outer_frame: Sprite;

		private var w: Number = 240;
		private var h: Number = 50;

		//一个动画所用帧数
		private var f_used: Number = 25.0;

		//等待帧数
		private var f_wait: Number = 10.0;
		private var i: int = 0;

		//最高不透明度
		private var max_alpha: Number = 1.0;

		//alpha步长
		private var a_step: Number;

		//最大scale
		private var max_scale: Number = 1.1;

		//scale步长
		private var s_step: Number;

		//线框相关
		private var l_color: Number = 0x000000;
		private var l_thick: Number = 3;

		//状态变量
		private var myState: int = 0;

		public function ShowAns(): void

		{
			initial();

		}

		private function initial(): void {
			outer_frame = new Sprite();

			this.addChild(outer_frame);
			outer_frame.x = 0;
			outer_frame.y = 0;

			a_step = max_alpha / f_used;
			s_step = (max_scale - 1) / f_used;

			outer_frame.graphics.lineStyle(l_thick, l_color);
			outer_frame.graphics.beginFill(0xffffff, 0);
			outer_frame.graphics.drawRect(-w / 2, -h / 2, w, h);
			outer_frame.graphics.endFill();

			outer_frame.alpha = max_alpha;
			this.addEventListener(MouseEvent.CLICK, onClick);

		}

		private function ShowAns_E_F_Handler(e: Event): void {
			if (myState == 0) {
				if (outer_frame.alpha > 0) {
					outer_frame.alpha -= a_step;
					outer_frame.scaleX += s_step;
					outer_frame.scaleY += 4 * s_step;
				} else {
					outer_frame.alpha = 0;
					outer_frame.scaleX = max_scale;
					outer_frame.scaleY = max_scale;
					myState++;
				}
			} else if (myState == 1) {
				if (i < f_wait) {
					i++;
				} else {
					i = 0;
					myState = 0;
					outer_frame.alpha = max_alpha;
					outer_frame.scaleX = 1;
					outer_frame.scaleY = 1;
				}
			} else {
				if (this.alpha > 0) {
					this.alpha -= a_step * 3;
				} else {
					this.removeEventListener(Event.ENTER_FRAME, ShowAns_E_F_Handler);
					this.parent.removeChild(this);
				}
			}
		}

		public function start_show(): void {
			myState = 0;
			this.addEventListener(Event.ENTER_FRAME, ShowAns_E_F_Handler);
		}
		private function onClick(e: MouseEvent): void {
			this.disappear();
		}
		private function disappear(): void {
			this.addEventListener(Event.ENTER_FRAME, ShowAns_E_F_Handler);
			myState = -1;
		}
	}

}