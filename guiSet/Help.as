package guiSet {
		import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import events.*;
	import guiSet.*;
	
	public class Help extends MovieClip{
	private var aStep:Number=0.2;
	private var state:int=0;
		public function Help() {
			alpha=0;
			this.addEventListener(Event.ENTER_FRAME,efHandler)
			// constructor code
		}
			private function efHandler(e:Event):void{
				if(state==1)
				{
					if(alpha<1)
					{alpha += aStep;}
					else
					{alpha=1;
						state=0;
						}
				}else if(state==2)
				if(alpha>0)
				{alpha-= aStep;}
				else
				{alpha=0;
					state=0;
					this.parent.removeChild(this);}
			}
			public function disappear():void{
					state=2;
				}
				public function appear():void{
						state=1;
					}
	}
	
}
