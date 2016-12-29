package guiSet {
	import flash.events.MouseEvent;
	import events.ChangeEvent;
	import flash.display.MovieClip;
	public class levelChoose extends MovieClip{//这个类我都忘了啥时候写的，感觉貌似不需要了



		public function levelChoose() {
			level1.addEventListener(MouseEvent.CLICK,level1clicked);
level2.addEventListener(MouseEvent.CLICK,level2clicked);
level3.addEventListener(MouseEvent.CLICK,level3clicked);
		}
function level1clicked(e:MouseEvent):void{
 	var events= new ChangeEvent(ChangeEvent.GO_LEVEL,1);
	this.dispatchEvent(events);
}
function level2clicked(e:MouseEvent):void{
	var events= new ChangeEvent(ChangeEvent.GO_LEVEL,2);
	this.dispatchEvent(events);
}
function level3clicked(e:MouseEvent):void{
	var events= new ChangeEvent(ChangeEvent.GO_LEVEL,3);
	this.dispatchEvent(events);
}

	}
	
}
