package {
	public class World {
		private var _stage:Stage;
		
		public World(st:stage) {
			_stage = st
		}
		
		public add(e:Entity) {
			_stage.addChild(e);
		}
	}
}