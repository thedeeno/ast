package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	public class ship extends MovieClip {

		private var _dX:Number;
		private var _dY:Number;

		public function ship() {
			_dX = 0;
			_dY = 0;
		}

	function turn(degrees:int){
				this.rotation+=degrees;
	}

  function accelerate(){
		this.y+=Math.cos(this.rotation*Math.PI/180)*-1;
		this.x+=Math.sin(this.rotation*Math.PI/180);
	}
		function checkMove(e:Event):void {


			//Max Accels
			
			if(_dX > 5){
				_dX = 5;
			} else if (_dX < -5) {
				_dX = -5;
			}
			
			if(_dY > 5){
				_dY = 5;
			} else if (_dY < -5) {
				_dY = -5;
			}
			//Object Wraparound
/*			if (this.x<0) {
				this.x=_stageWidth;
			} else if (this.x > _stageWidth) {
				this.x=0;
			}

			if (this.y<0) {
				this.y=_stageHeight;
			} else if (this.y > _stageHeight) {
				this.y=0;
			}*/

		}

		function fireMissile() {
			var newMissile:missile = new missile();
			newMissile.x=this.x;
			newMissile.y=this.y;
			stage.addChild(newMissile);
			trace("FIRE!");
		}

		
	}
}