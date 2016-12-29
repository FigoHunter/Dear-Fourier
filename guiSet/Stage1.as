package guiSet {
	import events.ChangeEvent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class Stage1 extends MovieClip { //Stage1类即Stage1元件，即DearFourier，代码不多，主要是田立搞的背景
		var aboutUsPage: AboutUs;
		public function Stage1() { //构造器
			goLearn.addEventListener(MouseEvent.CLICK, onGoLearn);
			goPlay.addEventListener(MouseEvent.CLICK, onGoPlay);
			aboutUs.addEventListener(MouseEvent.CLICK, onAboutUs);

		}
		private function onGoLearn(e: MouseEvent): void {
			var sound: Confirm = new Confirm();
			sound.play(); //音效
			var events = new ChangeEvent(ChangeEvent.GO_LEARN, 0);
			this.dispatchEvent(events); //发送事件去玩
		}
		private function onGoPlay(e: MouseEvent): void {
			var sound: Confirm = new Confirm();
			sound.play();
			var events = new ChangeEvent(ChangeEvent.GO_PLAY, 0);
			this.dispatchEvent(events);
		}
		private function onAboutUs(e: MouseEvent): void {
						var sound: Move = new Move();
			sound.play();
			aboutUsPage = new AboutUs();
			this.addChild(aboutUsPage);
			aboutUsPage.appear();
			aboutUsPage.addEventListener(MouseEvent.CLICK,onDis);
		}
		private function onDis(MouseEvent): void {
			var sound: Move = new Move();
			sound.play();
			aboutUsPage.disappear();
		}
	}

}