package {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class Building extends Sprite
{
    public var work_type:String;
    public var xx:int;
    public var yy:int;
    public var id:int;
    public var loader:URLLoader = new URLLoader();
    public var status:String;

    [Embed(source="factory.png")]
    public static var Factory:Class;

    [Embed(source="auto_workshop.png")]
    public static var Auto_Workshop:Class;

    public function Create(id:int, work_type:String, x:int, y:int, fn:Function, err:Function):void
    {
        loader.load(new URLRequest("http:localhost:4567/new_b/"+id.toString()+"-"+work_type.toString()+"-"+x.toString()+"-"+y.toString() ));
        loader.addEventListener(Event.COMPLETE, onComplete);

        function onComplete(event:Event):void
        {
            var file:XML = XML(loader.data);
            status = status.@*.toXMLString();
            if (status == "Complete")
            {
                if (work_type = "factory")
                {
                    var field:DisplayObject = new Factory() as DisplayObject;
                    field.height = 70;
                    field.width = 70;
                    addChild(field);
                    fn();
                }
                if (work_type = "auto_workshop") {
                    var field:DisplayObject = new Auto_Workshop() as DisplayObject;
                    field.height = 70;
                    field.width = 70;
                    addChild(field);
                    fn();
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
