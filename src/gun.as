package{
	import flash.events.Event;
	import flash.geom.Point;
	public class gun extends Entity {
		private var _interval:Number;
		private var _speed:Number;
		//movement pattern
		public var ang:Number;
		
		function gun(angle:Number) {
			_speed = 10;
			ang = angle; 
		}
		
		function fire(){
			var newMissile:missile = new missile(new VelocityVector(ang, _speed));
			var abs:Point = parent.localToGlobal(new Point(this.x, this.y));
			newMissile.x= abs.x;
			newMissile.y=abs.y;
			
			stage.addChild(newMissile);
			trace("FIRE!");
		}
	}
}