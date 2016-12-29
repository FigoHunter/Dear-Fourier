package guiSet {
	import flash.display.MovieClip;
	import events.ChangeEvent;
	import flash.events.MouseEvent;
	public class Stage4 extends MovieClip {
		var toLevel: int;
		var maxLevel: int;
		var level2: MovieClip = new locked_level();
		var level3: MovieClip = new locked_level();
		var level4: MovieClip = new locked_level();
		var level5: MovieClip = new locked_level();
		var level6: MovieClip = new locked_level();
		public function Stage4(maxLevel: int) { //元件Stage4，选关界面
			this.maxLevel = maxLevel; //构造时输入当前已解锁的最大关卡

			goHome.addEventListener(MouseEvent.CLICK, ongoHome);
			switch (maxLevel) //计划用不加break的分支语句。倒序排列，利用switch语句的特殊性。
			{
				case 6:
					level6 = new level_6();
					level6.addEventListener(MouseEvent.CLICK, gotoLevel6)
				case 5:
					level5 = new level_5();
					level5.addEventListener(MouseEvent.CLICK, gotoLevel5);
				case 4:
					level4 = new level_4();
					level4.addEventListener(MouseEvent.CLICK, gotoLevel4);
				case 3:
					level3 = new level_3();
					level3.addEventListener(MouseEvent.CLICK, gotoLevel3);
				case 2:
					level2 = new level_2();
					level2.addEventListener(MouseEvent.CLICK, gotoLevel2);
				case 1:
					level1.addEventListener(MouseEvent.CLICK, gotoLevel1); //第一关按钮可用
					break;
			}
			level2.x = 0;
			level2.y = -40;
			level3.x = 105;
			level3.y = -40;
			level4.x = -105;
			level4.y = 50;
			level5.x = 0;
			level5.y = 50;
			level6.x = 105;
			level6.y = 50;
			this.addChild(level2);
			this.addChild(level3);
			this.addChild(level4);
			this.addChild(level5);
			this.addChild(level6);
		}
		private function ongoHome(e: MouseEvent): void {
			var sound: Back = new Back();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_HOME, 0));
		}
		private function gotoLevel1(e: MouseEvent): void { //点击第6关按钮
			var sound: Confirm = new Confirm();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_LEVEL, 1)); //发送去第6关的事件。
		}
		private function gotoLevel2(e: MouseEvent): void { //点击第5关按钮
			var sound: Confirm = new Confirm();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_LEVEL, 2)); //发送去第5关的事件。
		}
		private function gotoLevel3(e: MouseEvent): void { //点击第4关按钮
			var sound: Confirm = new Confirm();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_LEVEL, 3)); //发送去第4关的事件。
		}
		private function gotoLevel4(e: MouseEvent): void { //点击第3关按钮
			var sound: Confirm = new Confirm();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_LEVEL, 4)); //发送去第3关的事件。
		}
		private function gotoLevel5(e: MouseEvent): void { //点击第2关按钮
			var sound: Confirm = new Confirm();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_LEVEL, 5)); //发送去第2关的事件。
		}
		private function gotoLevel6(e: MouseEvent): void { //点击第1关按钮
			var sound: Confirm = new Confirm();
			sound.play();
			this.dispatchEvent(new ChangeEvent(ChangeEvent.GO_LEVEL, 6)); //发送去第一关的事件。
		}
	}
}