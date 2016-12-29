package guiSet {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import events.*;
	public class SimpleFuncs extends MovieClip {
			//投影相关，不重要
			private var myShadow: DropShadowFilter;

			private var w0: Number = 1.0;
			private var w1: Number = 3.0;
			private var w2: Number = 5.0;

			private var phase:Number = 35.0;
			//函数图像尺寸
			public var funcL: Number = 400;
			public var funcH: Number = 160;

			//函数一格占多长
			private var lstep: Number = 50.0;
			private var hstep: Number = 25.0;

			//函数最左端起始位置
			private var inix: Number = -100;
			private var iniy: Number = -40;

			//函数图线
			private var points: Array;
			private var lines: Array;

			//操作函数线相关
			private var line_thick: Number = 3;
			private var line_color: Number = 0x000000;
			private var line_opacity: Number = 0.8;

			//
			public var f:Array= new Array();


			//public function Funcs():void { initial(); }

			public function SimpleFuncs(W0: Number, W1: Number, W2: Number): void {
				setFreq(W0, W1, W2);

				initial();
			}

			public function setFreq(W0: Number, W1: Number, W2: Number): void {
				w0 = W0;
				w1 = W1;
				w2 = W2;
			}

			public function initial(): void {
				this.x = 0;
				this.y = 0;
				addEventListener(Event.ENTER_FRAME, funcs_E_F_Handler);
				createShadow();
				points = new Array();
				lines = new Array();
				for(var i:int =0; i<3;i++)
				{
					f.push(0);
					}
				//建立操作函数点
				for (var i: int = 0; i < funcL; i++) {
					points.push(new MyDraw(inix+i, iniy+funcH / 2));
					addChild(points[i]);
				}

				//新建两条线
				lines[0] = new Sprite();
				lines[0].graphics.lineStyle(line_thick, line_color, line_opacity);
				lines[0].graphics.moveTo(inix+points[0].x, iniy + points[0].y);
				for (var i: int = 1; i < funcL; i++) {

					lines[0].graphics.lineTo(inix+points[i].x, iniy+points[i].y);
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
			public function changeImg(): void {
				for (var i: int = 0; i < funcL; i++) {
					//points[i].moveNext(((funcH / 2 + (f0 * Math.sin(w0 * (i / 7)) + f1 * Math.sin(w1 * (i / 7)) + f2 * Math.sin(w2 * (i / 7))) * 10));
					points[i].moveNext(iniy+funcH / 2 + (f[0] * Math.sin(w0 * (i + phase) / lstep) + f[1] * Math.sin(w1 * (i + phase) / lstep) + f[2] * Math.sin(w2 * (i + phase) / lstep)) * hstep);
				}

			}


			private function funcs_E_F_Handler(e: Event): void {

				lines[1] = new Sprite();
				lines[1].graphics.lineStyle(line_thick, line_color, line_opacity);
				lines[1].graphics.moveTo(inix+points[0].x, iniy+points[0].y);

				for (var k: int = 1; k < funcL; k++) {

					lines[1].graphics.lineTo(inix+points[k].x, iniy+points[k].y);
				}

				addChild(lines[1]);
				removeChild(lines[0]);
				lines.shift(); //顶出数组最靠前的那个
			}

			private function createShadow(): void {
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
				points[i].mydraw_directChange(iniy+funcH / 2 + (f[0] * Math.sin(w0 * (i + phase) / lstep) + f[1] * Math.sin(w1 * (i + phase) / lstep) + f[2] * Math.sin(w2 * (i + phase) / lstep)) * hstep);
				}
			}
		}
	}