package guiSet {
		import guiSet.*;
	import games.*;
	import events.*;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	public class p2Int extends MovieClip {
		var times: int = 2;
		var waveX: int = -225;
		var waveY: int = 155;
		var myShow = new SimpleFuncs(1, 3, 5);
		var myShowP1 = new SimpleFuncs(1, 3, 5);
		var myShowP2 = new SimpleFuncs(1, 3, 5);
		var myShowP3 = new SimpleFuncs(1, 3, 5);
		var back: Sprite = new Sprite();
		public function p2Int() {
			// constructor code
		myShow.f[0] = 3;
			myShow.f[1] = 2;
			myShow.f[2] = 1;
			myShow.funcs_directChange();
			myShow.x = waveX;
			myShow.y = waveY;
			back.x = waveX;
			back.y = waveY;
			back.graphics.beginFill(0x000000, 1);
			back.graphics.drawRect(-twinkle1.width / 2, -twinkle1.height / 2, twinkle1.width, twinkle1.height);
			back.alpha = 0;
			myShowP1.x = waveX;
			myShowP1.y = waveY;
			myShowP2.x = waveX;
			myShowP2.y = waveY;
			myShowP3.x = waveX;
			myShowP3.y = waveY;
			this.addChild(myShow);
			this.addChild(back);
			back.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);// constructor code
		}
		function onMouseDown(e: MouseEvent): void {
			if (times >= 0) {
				myShow.f[times] = 0;
				myShow.changeImg();
			}
			switch (times) {
				case 2:
					this.addChild(myShowP3);
					myShowP3.f[2] = 1;
					myShowP3.changeImg();
					myShowP3.startDrag();
					this.twinkle1.twinkle(2);
					break;
				case 1:
					this.addChild(myShowP2);
					myShowP2.f[1] = 2;
					myShowP2.changeImg();
					myShowP2.startDrag();
					this.twinkle2.twinkle(2);
					break;
				case 0:
					this.addChild(myShowP1);
					myShowP1.f[0] = 3;
					myShowP1.changeImg();
					myShowP1.startDrag();
					this.twinkle3.twinkle(2);
					break;
			}

			back.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		function onMouseUp(e: MouseEvent): void {
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			switch (times) {
				case 2:
					myShowP3.stopDrag();
					if (myShowP3.x > (twinkle1.x - twinkle1.width / 2) && myShowP3.x < (twinkle1.x + twinkle1.width / 2) && myShowP3.y > (twinkle1.y - twinkle1.height / 2) && myShowP3.y < (twinkle1.y + twinkle1.height / 2)) {
						myShowP3.x = twinkle1.x;
						myShowP3.y = twinkle1.y;
						times--;
					} else {
						myShowP3.x = waveX;
						myShowP3.y = waveY;
						this.removeChild(myShowP3);
						myShowP3.f[2] = 0;
						myShowP3.funcs_directChange();
						myShow.f[2] = 1;
						myShow.changeImg();
					}
					break;
				case 1:
					myShowP2.stopDrag();
					if (myShowP2.x > (twinkle2.x - twinkle2.width / 2) && myShowP2.x < (twinkle2.x + twinkle2.width / 2) && myShowP2.y > (twinkle2.y - twinkle2.height / 2) && myShowP2.y < (twinkle2.y + twinkle2.height / 2)) {
						myShowP2.x = twinkle2.x;
						myShowP2.y = twinkle2.y;
						times--;
					} else {
						myShowP2.x = waveX;
						myShowP2.y = waveY;
						this.removeChild(myShowP2);
						myShowP2.f[1] = 0;
						myShowP2.funcs_directChange();
						myShow.f[1] = 2;
						myShow.changeImg();
					}
					break;
				case 0:
					myShowP1.stopDrag();
					if (myShowP1.x > (twinkle3.x - twinkle3.width / 2) && myShowP1.x < (twinkle3.x + twinkle3.width / 2) && myShowP1.y > (twinkle3.y - twinkle3.height / 2) && myShowP1.y < (twinkle3.y + twinkle3.height / 2)) {
						myShowP1.x = twinkle3.x;
						myShowP1.y = twinkle3.y;
						times--
					} else {
						myShowP1.x = waveX;
						myShowP1.y = waveY;
						this.removeChild(myShowP1);
						myShowP1.f[0] = 0;
						myShowP1.funcs_directChange();
						myShow.f[0] = 3;
						myShow.changeImg();
					}
					break;
			}
			back.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);

		}

	}
	
}
