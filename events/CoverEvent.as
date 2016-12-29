package events {
	import flash.events.Event;
	public class CoverEvent extends Event{
	public var toPage:int;
 public static  const COVER_IN_PLACE:String="coverinplace";
        public function CoverEvent(type:String,toPage:int) {
		super(type);
			this.toPage=toPage;
        }
	}
	
}
