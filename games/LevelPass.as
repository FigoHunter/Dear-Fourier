package games {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import events.*;
	import guiSet.*;

	public class LevelPass extends MovieClip {

		var under_musk = new Sprite();

		//引用设定
		private var next_level: Next_Level;
		private var re_level: Re_Level;
		private var flag: Flag;
		private var accomp_text: Accomp_Text;


		//当前关卡
		private var current_level: Number;

		//内部布局
		private var y_inter: Number = 100;
		private var x_inter: Number = 100;

		//状态切换
		private var my_state: Number = 0;

		//动画速度效果相关
		private var how_big: Number = 1.2;
		private var frame_used_flag: Number = 10;
		private var frame_used_other: Number = 30;

		private var alpha_step_flag: Number;
		private var scale_step_flag: Number;

		private var alpha_step_other: Number;

		//投影相关
		private var myShadow: DropShadowFilter;

		public function LevelPass(X: Number, Y: Number, Current_Level: Number): void {
			next_level = new Next_Level();
			re_level = new Re_Level();
			flag = new Flag();
			accomp_text = new Accomp_Text();

			this.x = X;
			this.y = Y;

			current_level = Current_Level;

			initial();

		}

		private function initial(): void {

			createMusk();

			addChild(next_level);
			addChild(re_level);
			addChild(flag);
			addChild(accomp_text);

			createShadow();

			re_level.addEventListener(MouseEvent.CLICK, re_levelHandler);
			next_level.addEventListener(MouseEvent.CLICK, next_levelHandler);

			this.addEventListener(Event.ENTER_FRAME, LevelPass_E_F_Handler);

			flag.alpha = 0;
			flag.scaleX = how_big;
			flag.scaleY = how_big;
			flag.y = -y_inter / 2;

			accomp_text.alpha = 0;
			accomp_text.scaleX = how_big;
			accomp_text.scaleY = how_big;
			accomp_text.y = 2 * y_inter;

			re_level.alpha = 0;
			next_level.alpha = 0;

			alpha_step_flag = 1.0 / frame_used_flag;
			scale_step_flag = (how_big - 1.0) / frame_used_flag;

			alpha_step_other = 1.0 / frame_used_other;

			re_level.y = y_inter / 2;
			next_level.y = y_inter / 2;
			re_level.x = -x_inter / 2;
			next_level.x = x_inter / 2;

		}

		private function LevelPass_E_F_Handler(e: Event): void {
			if (my_state == 0) {
				if (flag.alpha < 1) {
					flag.alpha += alpha_step_flag;
					flag.scaleX -= scale_step_flag;
					flag.scaleY -= scale_step_flag;

					accomp_text.alpha += alpha_step_flag;
					accomp_text.scaleX -= scale_step_flag;
					accomp_text.scaleY -= scale_step_flag;
				} else
					my_state++;
			} else if (my_state == 1) {
				if (re_level.alpha < 1) {
					re_level.alpha += alpha_step_other;
					next_level.alpha += alpha_step_other;
				}
			}
		}

		private function re_levelHandler(e: Event): void {
			var sound: Back = new Back();
			sound.play();
			this.parent.dispatchEvent(new ChangeEvent(ChangeEvent.REPLAY_LEVEL, current_level));
			//去掉点击
			re_level.removeEventListener(MouseEvent.CLICK, re_levelHandler);
			next_level.removeEventListener(MouseEvent.CLICK, next_levelHandler);
		}

		private function next_levelHandler(e: Event): void {
			var sound: Confirm = new Confirm();
			sound.play();
			this.parent.dispatchEvent(new ChangeEvent(ChangeEvent.NEXT_LEVEL, current_level));
			//去掉点击
			re_level.removeEventListener(MouseEvent.CLICK, re_levelHandler);
			next_level.removeEventListener(MouseEvent.CLICK, next_levelHandler);
		}

		private function createMusk(): void {



			under_musk.graphics.beginFill(0xffffff);
			under_musk.graphics.drawRect(0 - this.x - 640, 60 - this.y - 360, 1280 - this.x, 720 - this.y);
			under_musk.graphics.endFill();
			under_musk.alpha = 0.3;

			addChild(under_musk);
		}

		private function createShadow(): void {
			myShadow = new DropShadowFilter();
			myShadow.distance = 0;
			myShadow.angle = 0;
			myShadow.blurX = 10;
			myShadow.blurY = 10;
			myShadow.alpha = 0.5;

			this.filters = [myShadow];

		}
	}

}