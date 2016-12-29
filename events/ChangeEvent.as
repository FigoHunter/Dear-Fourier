package events {
	import flash.events.Event;
	public class ChangeEvent extends Event{
		public var level:int = 0;
		public static const CHANGE_NAV:String = "changenav";
		public static const GO_HOME:String = "gohome";
		public static const GO_BACK:String = "goback";
		public static const REPLAY_LEVEL:String = "replaylevel";
		public static const NEXT_LEVEL:String = "nextlevel";
		public static const ASK:String = "ask";
		public static const GO_PLAY:String = "goplay";
		public static const GO_LEARN:String =  "golearn";
		public static const GO_LEVEL:String = "golevel";
		public static const LEVEL_PASSED:String="levelpassed";
		public function ChangeEvent (type:String,lev:int){
			super(type);
				this.level=lev;
		}
	}
	
	
}