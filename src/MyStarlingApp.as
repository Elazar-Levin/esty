package
{
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import flash.sensors.Accelerometer;
	import flash.events.AccelerometerEvent;
	/**
	 * ...
	 * @author Lazi
	 */
	public class MyStarlingApp extends Sprite
	{
		[Embed(source = "/../assets/pic.png")]
		private static const MyImage:Class
		public static var my_acc:Accelerometer;
		private var _image:Image;
		private var accSupported:Boolean;
		public function MyStarlingApp()
		{
			super();
			my_acc = new Accelerometer();
			accSupported = Accelerometer.isSupported;
			trace(accSupported);
			//var ball:Ball = new Ball();
			//ball.x = stage.stageWidth/2;
			//ball.y = stage.stageHeight/2;
			//addChild(ball);
			my_acc.setRequestedUpdateInterval(50);
			my_acc.addEventListener(AccelerometerEvent.UPDATE,onAccUpdate)
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
		}
		
		private function onAccUpdate(e:AccelerometerEvent):void 
		{
			trace("X axis = "+e.accelerationX);
			trace("Y axis = "+e.accelerationY);
			trace("Z axis = " + e.accelerationZ);
			_image.x = ((e.accelerationX+1) / -2) * stage.stageWidth;
			_image.y = ((e.accelerationY + 1) / 2) * stage.stageHeight;
			_image.scale=((e.accelerationZ+1)/2)
		}
		
		private function onEnterFrame(e:Event):void
		{
		//	_image.rotation -= 0.01;
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createAndShowImage();
		}
		
		private function createAndShowImage():void
		{
			var myBitmap:Bitmap = new MyImage();
			_image = new Image(Texture.fromBitmap(myBitmap));
			
			_image.pivotX = _image.width / 2;
			_image.pivotY = _image.height / 2;
			
			_image.x = stage.stageWidth / 2;
			_image.y = stage.stageHeight / 2;
			
			addChild(_image);
		}
	
	}

}