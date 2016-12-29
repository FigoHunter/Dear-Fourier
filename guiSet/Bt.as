package guiSet
{
	import flash.display.MovieClip;
	import flash.events.*;
	import guiSet.*;
	import flash.filters.DropShadowFilter;
	
	// 蜗牛类
	public class Bt extends MovieClip
	{
		// 蜗牛的速度、状态和名字
		public var mystate:String;
		private var _scaleRate:Number = 1.1;
		private var _scaleStep:Number = 0.05;
		private var _real_scaleRate:Number = 1.3;
		
		private var myShadow:DropShadowFilter;
		private var _shadowBlurStep:Number = 5;
		private var _shadowAlphaStep:Number = 0.07;
		
		private var changing:int = 0;
		
		// 蜗牛的构造函数，设置速度状态和名称，添加Enter_Frame事件
		public function Bt()
		{
			this.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			createShadow();
		}
		
		private function createShadow():void
		{
			myShadow = new DropShadowFilter();
			myShadow.distance = 0;
			myShadow.angle = 0;
			myShadow.blurX = 0;
			myShadow.blurY = 0;
			myShadow.alpha = 0;
			this.filters = [myShadow];
		}
		
		private function mouseOverHandler(e:Event):void
		{
			mystate = "OVER";
		}
		
		private function mouseOutHandler(e:Event):void
		{
			mystate = "OUT";
		}
		
		private function mouseDownHandler(e:Event):void
		{
			mystate = "DOWN";
		}
		
		private function mouseUpHandler(e:Event):void
		{
			//mystate = "OUT";
		}
		
		// 处理Enter_Frame事件
		// 蜗牛运行的控制
		private function enterFrameHandler(e:Event):void
		{
			if (mystate == "OVER" || changing == 1)
			{
				scaleUp();
			}
			else if (mystate == "OUT")
			{
				scaleDown();
			}
			else if (mystate == "DOWN")
			{
				scaleReallyUp();
			}
		}
		
		private function scaleUp()
		{
			if (this.scaleX < _scaleRate)
			{
				changing = 1
				this.scaleX += _scaleStep;
				this.scaleY += _scaleStep;
				myShadow.blurX += _shadowBlurStep;
				myShadow.blurY += _shadowBlurStep;
				myShadow.alpha += _shadowAlphaStep;
				this.filters = [myShadow];
			}
			else changing = 0;
		}
		
		private function scaleDown()
		{
			if (this.scaleX > 1)
			{
				this.scaleX -= _scaleStep;
				this.scaleY -= _scaleStep;
				myShadow.blurX -= _shadowBlurStep;
				myShadow.blurY -= _shadowBlurStep;
				
				if (myShadow.alpha > 0) myShadow.alpha -= _shadowAlphaStep;
				this.filters = [myShadow];
			}
		}
		
		private function scaleReallyUp()
		{
			this.scaleX = _real_scaleRate;
			this.scaleY = _real_scaleRate;
		}
	}
}