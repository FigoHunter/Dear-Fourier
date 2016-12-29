package guiSet {
	import flash.display.MovieClip;
	import flash.events.*;
	public class AboutUs extends MovieClip {
		var aStep: Number = 0.2
		var state: int = 0;
		public function AboutUs() {
			this.alpha=0;
			state = 0;
		}
		private function efListener(e: Event): void {
			if (state == 1) {
				if (alpha < 1) {
					this.alpha += aStep;
				} else {
					this.alpha = 1;
					state = 0;
					this.removeEventListener(Event.ENTER_FRAME, efListener);
				}
			} else if (state == -1) {
				if (alpha > 0) {
					this.alpha -= aStep;
				} else {
					alpha = 0;
					state = 0;
					this.removeEventListener(Event.ENTER_FRAME, efListener);
					this.parent.removeChild(this);
				}
			}
		}
		public function appear():void {
			state = 1;
			this.addEventListener(Event.ENTER_FRAME, efListener);
		}
		public function disappear(): void {
			state = -1;
			this.addEventListener(Event.ENTER_FRAME, efListener);
		}

	}

}