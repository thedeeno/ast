package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;

	public class ast extends MovieClip {
		private var _level:level = new level();
		private var _ship:ship = new ship();
		private var UpArrow:Boolean=false;
		private var DownArrow:Boolean=false;
		private var LeftArrow:Boolean=false;
		private var RightArrow:Boolean=false;
		private var SpaceBar:Boolean=false;
		private var _stageWidth:int=stage.stageWidth;
		private var _stageHeight:int=stage.stageHeight;
		//public var _stage:Stage;

		public function ast() {
			//_stage= this.Stage;
			stage.addChild(_ship);
			shipControl();
			trace(_ship.rotation);
			_ship.rotation=90;

			_ship.x=100;
			_ship.y=100;

		}
		function handleKeyPress(event:KeyboardEvent) {

			if (event.keyCode==37||event.keyCode==65) {
				LeftArrow=true;

			} else if (event.keyCode == 39 || event.keyCode==68) {
				RightArrow=true;

			} else if (event.keyCode == 38 || event.keyCode==87) {
				UpArrow=true;

			} else if (event.keyCode == 40 || event.keyCode==83) {
				DownArrow=true;
			} else if (event.keyCode == 32) {
				SpaceBar=true;
			}
		}


		function handleKeyRelease(event:KeyboardEvent) {

			if (event.keyCode==37||event.keyCode==65) {
				LeftArrow=false;

			} else if (event.keyCode == 39 || event.keyCode==68) {
				RightArrow=false;

			} else if (event.keyCode == 38 || event.keyCode==87) {
				UpArrow=false;

			} else if (event.keyCode == 40 || event.keyCode==83) {
				DownArrow=false;

			} else if (event.keyCode == 32) {
				SpaceBar=false;
			}
		}

		public function tic(e:Event) {
			//Rotate Ship
			if (LeftArrow) {
				_ship.turn(-10);
			}
			if (RightArrow) {
				_ship.turn(10);
			}
			if (UpArrow) {
				_ship.accelerate();
			}
			if (DownArrow) {
				
			}
			if (SpaceBar) {
				_ship.fireMissile();
				trace("space bar down");
			}
			
			
			
			_ship.tic();
			wrap();
		}

		function wrap() {
			//Object Wraparound
			if (_ship.x<0) {
				_ship.x=_stageWidth;
			} else if (_ship.x > _stageWidth) {
				_ship.x=0;
			}

			if (_ship.y<0) {
				_ship.y=_stageHeight;
			} else if (_ship.y > _stageHeight) {
				_ship.y=0;
			}
		}

		public function shipControl() {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyRelease);
			stage.addEventListener(Event.ENTER_FRAME, tic);
		}

	}
}