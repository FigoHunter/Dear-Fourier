package guiSet
{
	import flash.display.MovieClip;
	import flash.events.*;
	import events.*;
	import flash.filters.DropShadowFilter;
	
	public class TotalCover extends MovieClip
	{
		private var _coverAlphaRate:Number = 0.1; //不透明度变化速率
		private var _myState:String = "nothing";  //
		private var a:Number = 0.0;
		private var _blackFrames:int = 20;  //黑屏等待帧数
		private var i:int = _blackFrames;
		
		private var sceneNo:int;
		
		public function TotalCover(sceneno:int)
		{
			this.x=0;
			this.y=0;
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, 1280, 720);
			this.graphics.endFill();
			this.alpha = 0;
			this.sceneNo = sceneno;
		}
		
		public function appearCover():void   //出现函数
		{
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			_myState = "appearing";
		}

		public function deleteCover():void   //消失函数
		{
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			_myState = "disappearing";
		}
		
		private function enterFrameHandler(e:Event):void
		{
			if (_myState == "appearing")
			{
				if (this.alpha < 1)
				{
					this.alpha = this.alpha + _coverAlphaRate;
				}
				else{
					this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
					this.dispatchEvent(new CoverEvent(CoverEvent.COVER_IN_PLACE,this.sceneNo));
					}
			}
			
			else if (_myState == "disappearing")
			{
					if (i>0)
				{	
					i=i-1;
				}
				else
				{	if (this.alpha > 0)
				{	
					this.alpha = this.alpha - this._coverAlphaRate;
				}
				else
				{
					this.removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
					i=_blackFrames;
					this.parent.removeChild(this);
				}
			}
				
			}
		
		}
	}

}