package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import starling.core.Starling;
	
	
	/**
	 * ...
	 * @author Lazi
	 */
	public class Main extends Sprite
	{
		private var _starling:Starling;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// Entry point
			SetupStarling();
			// New to AIR? Please read *carefully* the readme.txt files!
		}
		
		private function SetupStarling():void
		{
			_starling = new Starling(MyStarlingApp, stage);
			_starling.showStats = true;
			_starling.antiAliasing = 1;
			_starling.start();
		}
		
		private function deactivate(e:Event):void
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
			_starling.stop();
			//trace("stopped");
			addEventListener(Event.ACTIVATE, activate);
		}
		
		private function activate(e:Event):void
		{
			//trace("started");
			_starling.start();
			removeEventListener(Event.ACTIVATE, activate);
		}
	}
}