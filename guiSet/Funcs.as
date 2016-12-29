package guiSet
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import events.*;
	
	public class Funcs extends MovieClip
	{
		//投影相关，不重要
		private var myShadow:DropShadowFilter;
		
		private var w0:Number = 1.0;
		private var w1:Number = 3.0;
		private var w2:Number = 5.0;
		
		//函数图像尺寸
		public var funcL:Number = 535;
		public var funcH:Number = 276;
		
		//函数一格占多长
		private var lstep:Number = 40.0;
		private var hstep:Number = 40.0;
		
		//函数最左端起始位置
		private var inix:Number = 200;
		private var iniy:Number = 200;
		
		//函数图线
		private var points:Array;
		private var lines:Array;
		
		//操作函数线相关
		private var line_thick:Number = 3;
		private var line_color:Number = 0x000000;
		private var line_opacity:Number = 0.8;
		//目标函数线相关
		private var t_line_thick:Number = 1;
		private var t_line_color:Number = 0x000000;
		private var t_line_opacity:Number = 0.5;
		
		//目标函数变量
		public var t_f0:Number = 1.0;
		public var t_f1:Number = 2.0;
		public var t_f2:Number = 3.0;
		
		//
		public var f0:Number = 0;
		public var f1:Number = 0;
		public var f2:Number = 0;
		
		//public function Funcs():void { initial(); }
		
		public function Funcs(T_f0:Number, T_f1:Number, T_f2:Number, W0:Number, W1:Number, W2:Number):void {
			
			t_f0 = T_f0;
			t_f1 = T_f1;
			t_f2 = T_f2;
			
			setFreq(W0, W1, W2);
			
			initial();
		}
		
		public function setFreq(W0:Number, W1:Number, W2:Number):void
		{
			w0 = W0;
			w1 = W1;
			w2 = W2;
		}
		
		public function initial():void
		{
			
			this.x = 0;
			this.y = 0;
			addEventListener(Event.ENTER_FRAME, funcs_E_F_Handler);
			createShadow();
			points = new Array();
			lines = new Array();
			
			//建立目标函数点、画目标函数线
			var t_points:Array = new Array();
			
			for (var i:int = 0; i < funcL; i++)
			{
				t_points.push(new MyDraw(i, funcH / 2 + (t_f0 * Math.sin(w0 * (i as Number) / lstep) + t_f1 * Math.sin(w1 * (i as Number) / lstep) + t_f2 * Math.sin(w2 * (i as Number) / lstep)) * hstep));
				addChild(t_points[i]);
			}
			
			var t_line = new Sprite();
			t_line.graphics.lineStyle(t_line_thick, t_line_color, t_line_opacity);
			t_line.graphics.moveTo(t_points[0].x, t_points[0].y);
			for (var i:int = 1; i < funcL; i++)
			{
				
				t_line.graphics.lineTo(t_points[i].x, t_points[i].y);
			}
			addChild(t_line);
			
			//建立操作函数点
			for (var i:int = 0; i < funcL; i++)
			{
				points.push(new MyDraw(i, funcH / 2));
				addChild(points[i]);
			}
			
			//新建两条线
			lines[0] = new Sprite();
			lines[0].graphics.lineStyle(line_thick, line_color, line_opacity);
			lines[0].graphics.moveTo(points[0].x, points[0].y);
			for (var i:int = 1; i < funcL; i++)
			{
				
				lines[0].graphics.lineTo(points[i].x, points[i].y);
			}
			addChild(lines[0]);
		
		/*	lines[1] = new Sprite();
		   lines[1].graphics.lineStyle(line_thick, line_color, line_opacity);
		   lines[1].graphics.moveTo(points[0].x, points[0].y);
		   for (var j:int = 1; j < funcL; j++){
		
		   lines[1].graphics.lineTo(points[j].x, points[j].y);
		   }
		   addChild(lines[1]);*/
		}
		
		
		//IMAGE_CHANGE 的Handler
		public function changeImg():void
		{
			for (var i:int = 0; i < funcL; i++)
			{
				//points[i].moveNext(((funcH / 2 + (f0 * Math.sin(w0 * (i / 7)) + f1 * Math.sin(w1 * (i / 7)) + f2 * Math.sin(w2 * (i / 7))) * 10));
				points[i].moveNext(funcH / 2 + (f0 * Math.sin(w0 * (i as Number) / lstep) + f1 * Math.sin(w1 * (i as Number) / lstep) + f2 * Math.sin(w2 * (i as Number) / lstep)) * hstep);
			}
			                                                                      
		}
			
		
		
		//DATA_CHANGE 的Handler，检测是否过关
		public function checkPass():void {
			if ( f0 == t_f0 && f1 == t_f1 && f2 == t_f2 )
				dispatchEvent(new ChangeEvent(ChangeEvent.LEVEL_PASSED,0));
		}
		
		
		private function funcs_E_F_Handler(e:Event):void
		{
			
			lines[1] = new Sprite();
			lines[1].graphics.lineStyle(line_thick, line_color, line_opacity);
			lines[1].graphics.moveTo(points[0].x, points[0].y);
			
			for (var k:int = 1; k < funcL; k++)
			{
				
				lines[1].graphics.lineTo(points[k].x, points[k].y);
			}
			
			addChild(lines[1]);
			removeChild(lines[0]);
			lines.shift(); //顶出数组最靠前的那个
		}
		
		private function createShadow():void
		{
			myShadow = new DropShadowFilter();
			myShadow.distance = 0;
			myShadow.angle = 0;
			myShadow.blurX = 5;
			myShadow.blurY = 5;
			myShadow.alpha = 0.5;
			this.filters = [myShadow];
		}
		public function funcs_directChange():void{
			for (var i:int = 0; i < funcL; i++)
			{
				points[i].mydraw_directChange(funcH / 2 + (f0 * Math.sin(w0 * (i as Number) / lstep) + f1 * Math.sin(w1 * (i as Number) / lstep) + f2 * Math.sin(w2 * (i as Number) / lstep)) * hstep);
				}
			}
	
	}
}