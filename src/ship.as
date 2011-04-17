package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	public class ship extends MovieClip {

		private var _max_velocity:Number;
		private var _dX:Number;
		private var _dY:Number;
		private var _gunArray:Array = new Array();

		public function ship() {
			_max_velocity=5;
			_dX=0;
			_dY=0;
			mountGun(10,0);
			mountGun(-10,0);
			mountGun(0,0);
		}

		public function mountGun(X:int, Y:int){
			var newGun:gun = new gun();
			_gunArray.push(newGun);
			addChild(newGun);
			newGun.x=X;
			newGun.y=Y;
		}


		function turn(degrees:int) {
			this.rotation+=degrees;
		}

		function moveShip() {
			this.x+=_dX;
			this.y+=_dY;
		}

		function accelerate() {
			//_velocity += 1;
			//_velocity = Math.min(_velocity, _max_velocity);
			_dX+=Math.sin(this.rotation*Math.PI/180);
			_dY+=Math.cos(this.rotation*Math.PI/180)*-1;
			//_dX = Math.min(_dX, _max_velocity);
			//_dY = Math.min(_dY, _max_velocity);
		}
		function tic():void {
			moveShip();
		}

		function fireMissile() {
			for (var i:int = 0; i< _gunArray.length; i++){
				_gunArray[i].fire();
				trace("gun fired " + i);
			}
		}


	}
}