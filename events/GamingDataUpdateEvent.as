package events {
import flash.events.Event;	
 public class GamingDataUpdateEvent extends Event {	//我估计这个类，以后要加一个事件，就是过关了以后，要赶紧发出一个事件让最大解锁关卡加1
        public static  const DATA_CHANGED:String="datachanged";
		public static const CHANGE_IMAGE:String="changeimage";
        public function GamingDataUpdateEvent(type:String) {
		super(type);
        }
    }
}
