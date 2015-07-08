package {

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

public class Factory extends Building
{
    public function Factory(field:Field):void
    {
        field.screen.text = "Check 1 on Factory.as";
        var loader:Loader = new Loader();
        loader.load(new URLRequest("http://localhost:4567/factory.png"));
        loader.addEventListener(Event.COMPLETE, onComplete);
        field.screen.text = "Check 2 on Factory.as";

        function onComplete(e:Event):void
        {
            var image:Bitmap = loader.contentLoaderInfo.content as Bitmap;
            addChild(image);
            field.screen.text = "Created";
        }
    }
}
}
