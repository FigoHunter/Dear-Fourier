package guiSet {
	import events.ChangeEvent;
	import flash.display.MovieClip;
	import flash.events.*;

	public class IntroductionUI extends MovieClip {
		public function IntroductionUI() { //Stage2元件，learn with fourier,包含元件scroll（就是换页的那个，里面有补间动画）
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			ToLeft.addEventListener(MouseEvent.CLICK, onLeftClick);
			ToRight.addEventListener(MouseEvent.CLICK, onRightClick);
			goHome.addEventListener(MouseEvent.CLICK, ongoHome);
			gotoAndStop(1);
		}
		private function ongoHome(e: MouseEvent): void {
			var sound: Back = new Back();
			sound.play();
			var events: ChangeEvent = new ChangeEvent(ChangeEvent.GO_HOME, 0);
			this.dispatchEvent(events);
		}

		private function onRightClick(e: MouseEvent): void {

			if (scroll.page2.x == 150 || scroll.page2.x == 0) { //用第二页的位置来判断，当前处在哪一页，第二页没完成补间时，不满足左边条件所以按钮没用
				var sound: Move = new Move();
				sound.play();
				scroll.play(); //补间动画里有代码，会自动暂停
			}
		}
		private function onLeftClick(e: MouseEvent): void {
			var sound: Move = new Move();
			if (scroll.page2.x == -150) //用第二页的位置来判断，当前处在哪一页，找到对应帧播放
			{
				sound.play();
				scroll.gotoAndPlay(33);
			}
			if (scroll.page2.x == 0) {
				sound.play();
				scroll.gotoAndPlay(48);
			}
		}
		private function enterFrameHandler(e: Event): void {
			ToRight.alpha = scroll.page3.x / 150;
			ToLeft.alpha = (0 - scroll.page1.x) / 150;
		}
	}

}