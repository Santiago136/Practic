package {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class Building extends Sprite
{
    public var work_type:String;
    public var id:int;
    public var loader:URLLoader = new URLLoader();
    public var status:String;

    public function create(id:int, work_type:String, x:int, y:int, field:Field, err:Function):void
    {
        loader.load(new URLRequest("http:localhost:4567/new_b/"+id.toString()+"-"+work_type.toString()+"-"+x.toString()+"-"+y.toString() ));
        loader.addEventListener(Event.COMPLETE, onComplete);

        function onComplete(event:Event):void
        {
            var file:XML = XML(loader.data);
            status = file.status.@*.toXMLString();
            if (status == "Complete")
            {
                if (work_type == "factory")
                {
                    var factory:Factory = new Factory(field);
                    addChild(factory);
                    field.screen.text = "Check on building.as";
                }
                else
                    err();
            }
            else
            {
                err();
            }
        }
    }
}
}
