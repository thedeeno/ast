package{
	import flash.events.Event;
	public class missile extends Entity {
		private var _v:VelocityVector;
		private var _damage:Number;
		private var _distance:Number;
		//movement pattern
		private var _dX:Number;
		private var _dY:Number;
		
		function missile(v:VelocityVector) {
			addEventListener(Event.ENTER_FRAME, tic);
			_v = v;
			_dX=Math.sin(v.ang*Math.PI/180)*v.mag;
			_dY=Math.cos(v.ang*Math.PI/180)*v.mag*-1;
			trace(Math.cos(v.ang*Math.PI/180)*v.mag*-1);
			trace("missleX:" + _dX);
			trace("missleY:" + _dY);
		}		
		function tic(e:Event){
			//trace("missleX:" + _dX);
			x+=_dX;
			y+=_dY;
		}
	}
}