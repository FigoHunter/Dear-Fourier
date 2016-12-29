package guiSet {
	import games.*;
	import events.*;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Stage3 extends MovieClip { //元件Stage3,目前唯一的游戏关卡，这一部分子川做了图片和游戏内容的匹配，可能稍微熟一点，就不咋写注释了，里面包含一个GamePlay类的实例，和那三个球有关的去GamePlay.as里找吧
		var level: int;
		var myNewShow: Funcs;
		var myGamePlay: GamePlay;
		var passLevel: LevelPass;
		var myShowAnswer: ShowAnswer;
		var times: int = 0;
		var help: Help = new Help();
		public function Stage3(toLevel: int) { //后来加了个传入参量，打算所有关卡用一个类写。
			this.level = toLevel;
			help.x = 0;
			help.y = 20;
			help.alpha = 0;
			goHome.addEventListener(MouseEvent.CLICK, ongoHome);
			goBack.addEventListener(MouseEvent.CLICK, ongoBack);
			chooseLevel.addEventListener(MouseEvent.CLICK, ongoPlay);
			showAns.addEventListener(MouseEvent.CLICK, onShowAns);
			ask.addEventListener(MouseEvent.CLICK, onAsk);
			switch (this.level) {
				case 1:
					myNewShow = new Funcs(2, 0, 0, 3, 0, 0);
					myGamePlay = new GamePlay(1, 3, 0, 0);
					myShowAnswer = new ShowAnswer(1, 3, 0, 0, 2, 0, 0);
					this.addChild(help);
					help.appear();
					ask.removeEventListener(MouseEvent.CLICK, onAsk);
					ask.addEventListener(MouseEvent.CLICK, onDis);
					help.addEventListener(MouseEvent.CLICK, onDis);
					break;
				case 2:
					myNewShow = new Funcs(2, 1, 0, 1, 2, 3);
					myGamePlay = new GamePlay(2, 1, 2, 3);
					myShowAnswer = new ShowAnswer(2, 1, 2, 3, 2, 1, 0);
					break;
				case 3:
					myNewShow = new Funcs(1, 2, 2, 1, 2, 3);
					myGamePlay = new GamePlay(3, 1, 2, 3);
					myShowAnswer = new ShowAnswer(3, 1, 2, 3, 1, 2, 2);
					break;
				case 4:
					myNewShow = new Funcs(1, 2, 0, 2.5, 3, 2.8);
					myGamePlay = new GamePlay(3, 2.5, 3, 2.8);
					myShowAnswer = new ShowAnswer(3, 2.5, 3, 2.8, 1, 2, 0);
					break;
				case 5:
					myNewShow = new Funcs(2, 1, 0, 1.2, 1.4, 1);
					myGamePlay = new GamePlay(3, 1.2, 1.4, 1);
					myShowAnswer = new ShowAnswer(3, 1.2, 1.4, 1, 2, 1, 0);
					break;
				case 6:
					myNewShow = new Funcs(2, 1, 2, 2.1, 2.4, 2.6);
					myGamePlay = new GamePlay(3, 2.1, 2.4, 2.6);
					myShowAnswer = new ShowAnswer(3, 2.1, 2.4, 2.6, 2, 1, 2);
					break;
			}

			myNewShow.x = -286 - myNewShow.funcL / 2;
			myNewShow.y = 21.05 - myNewShow.funcH / 2;
			this.addChild(myNewShow);
			myGamePlay.x = 100;
			myGamePlay.y = 243;
			this.addChild(myGamePlay);
			myShowAnswer.x = 100;
			myShowAnswer.y = 243;
			myGamePlay.addEventListener(GamingDataUpdateEvent.DATA_CHANGED, dataChangeHandler);
			myGamePlay.addEventListener(GamingDataUpdateEvent.CHANGE_IMAGE, changeImage);
		}
		private function changeImage(e: GamingDataUpdateEvent): void {
			myNewShow.f0 = myGamePlay.f[0];
			myNewShow.f1 = myGamePlay.f[1];
			myNewShow.f2 = myGamePlay.f[2];
			myNewShow.funcs_directChange();
		}
		private function ongoHome(e: MouseEvent): void {
			var sound: Back = new Back();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_HOME, 0));
		}
		private function ongoBack(e: MouseEvent): void {
			var sound: Back = new Back();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_BACK, this.level));
		}
		private function ongoPlay(e: MouseEvent): void {
			var sound: Back = new Back();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_PLAY, 0));
		}
		private function onAsk(e: MouseEvent): void {
			var sound: Back = new Back();
			sound.play();
			this.addChild(help);
			help.appear();
			ask.removeEventListener(MouseEvent.CLICK, onAsk);
			ask.addEventListener(MouseEvent.CLICK, onDis);
			help.addEventListener(MouseEvent.CLICK, onDis);
		}



		private function dataChangeHandler(e: GamingDataUpdateEvent): void {
			myNewShow.f0 = myGamePlay.f[0];
			myNewShow.f1 = myGamePlay.f[1];
			myNewShow.f2 = myGamePlay.f[2];
			myNewShow.changeImg();
			times++;
			if (myNewShow.f0 == myNewShow.t_f0 && myNewShow.f1 == myNewShow.t_f1 && myNewShow.f2 == myNewShow.t_f2) {
				dispatchEvent(new ChangeEvent(ChangeEvent.LEVEL_PASSED, this.level));
				passLevel = new LevelPass(0, 0, this.level);
				this.addChild(passLevel);
			} else {
				if (times > 2) {
					showAns.start_show();
				}
			}
		}
		private function onShowAns(e: MouseEvent): void {
			this.addChild(myShowAnswer);
			this.setChildIndex(myShowAnswer, 1);
			showAns.removeEventListener(MouseEvent.CLICK, onShowAns);
		}
		private function onDis(e: MouseEvent): void {
				var sound: Move = new Move();
				sound.play();
			help.disappear();
			ask.addEventListener(MouseEvent.CLICK, onAsk);
		}
	}
}