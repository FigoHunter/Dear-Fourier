package games {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.media.*;
	import flash.events.Event;
	public class VolumeScroll extends MovieClip {
		var trans: SoundTransform;
		public function VolumeScroll() {
			x = 961;
			y = 30;
			mc.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			trans = new SoundTransform();
		}

		function onDown(event: MouseEvent): void {
			mc.startDrag(true, new Rectangle(0,mc.y,line.width,0));
			mc.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onUp);

		}
		function onUp(event: MouseEvent): void {
			mc.stopDrag();
			mc.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
		}



		function onMove(event: MouseEvent): void {
			//创建转换对象 

			//获取声音的值，并加入转换对象 
			trans.volume = mc.x/line.width;

			SoundMixer.soundTransform = trans;

		}
	}
}