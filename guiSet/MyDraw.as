package guiSet
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.Event;
	
	public class MyDraw extends MovieClip
	{
		private var fillclr:Number = 0x000000;  //线的颜色
		
		private var line_thick:Number = 0;   //线粗细
		
		private var f_use:int = 10;
		
		private var m_step:Number;
		
		private var newpy:Number = 0.0;
		
		private var f_enable:Boolean = false;
		
		public function MyDraw(px:Number, py:Number):void
		{
			
			graphics.beginFill(fillclr);
			graphics.drawCircle(0, 0, line_thick);
			graphics.endFill();
			x = px;
			y = py;
			addEventListener(Event.ENTER_FRAME, myDraw_E_F_Handler);
		
		}
		
		public function moveNext(Newpy:Number):void
		{
			newpy = Newpy;
			m_step = (newpy - this.y) / f_use;
			f_enable = true;
		}
		
		private function myDraw_E_F_Handler(e:Event):void
		{
			if (f_enable == true)
			{
				if (int(Math.abs(newpy - this.y)) <= int(Math.abs(m_step)))
				{
					this.y = newpy;
					f_enable = false;
				}
				else
					this.y += m_step;
			}

		}
		public function mydraw_directChange(Newpy:Number):void{
			f_enable=false;
				this.y=Newpy;
			}
	
	}
}