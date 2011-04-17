package{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	public class gun extends MovieClip{
		private var _interval:Number;
		private var _velocity:Number;
		//movement pattern
		private var _angle:Number;
		
		function gun() {
			
		}
		
		function fire(){
			var newMissile:missile = new missile();
			var abs:Point = parent.localToGlobal(new Point(this.x, this.y));
			newMissile.x= abs.x;
			newMissile.y=abs.y;
			stage.addChild(newMissile);
			trace("FIRE!");
		}
	}
}