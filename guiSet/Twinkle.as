package guiSet {
	import flash.display.MovieClip;
	import flash.events.*;
	import guiSet.*;
	import flash.filters.DropShadowFilter;
	import flash.display.Sprite;

	public class Twinkle extends MovieClip {
		private var myState: int = 0;
		private var under_musk: Sprite;
		private var w: int = 454;
		private var h: int = 184;
		//从无到有所用帧数
		private var f_used: Number = 5.0;

		//alpha步长
		private var a_step: Number;

		//颜色
		private var m_color: Number = 0x000000;

		//最高不透明度
		private var max_alpha: Number = 0.3;

		//闪几次
		private var t_times: int = 0;



		public function Twinkle(): void

		{
			initial();

		}


		public function initial(): void {
			under_musk = new Sprite();

			this.addChild(under_musk);
			under_musk.x = w / 2;
			under_musk.y = h / 2;


			under_musk.graphics.beginFill(m_color);
			under_musk.graphics.drawRect(-w, -h, w, h);
			under_musk.graphics.endFill();

			under_musk.alpha = 0;



			a_step = max_alpha / f_used;
		};

		public function twinkle(N: Number): void {

			t_times = N;
			this.addEventListener(Event.ENTER_FRAME, Twinkle_E_F_Handler);
			myState++;
		}

		private function Twinkle_E_F_Handler(e: Event): void {
			if (myState <= 2 * t_times) {
				if (myState % 2 == 1) {
					if (under_musk.alpha < max_alpha) {
						under_musk.alpha += a_step;
					} else {
						under_musk.alpha = max_alpha;
						myState++;
					}

				} else {
					if (under_musk.alpha > 0) {
						under_musk.alpha -= a_step;
					} else {
						under_musk.alpha = 0;
						myState++;
					}
				}
			} else {
				this.removeEventListener(Event.ENTER_FRAME, Twinkle_E_F_Handler);
				myState = 0;
			}

		}
	}

}