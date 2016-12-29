package guiSet {

	import flash.events.MouseEvent;
		import flash.display.MovieClip;
	public class Page2 extends MovieClip {
		
		public function Page2() {
		retry.addEventListener(MouseEvent.CLICK, onRetry);
	}
		private function onRetry(e:MouseEvent):void{
				this.removeChild(interaction);
				interaction = new p2Int();
				this.addChild(interaction);
			}
}
}