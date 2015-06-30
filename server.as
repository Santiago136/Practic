package
{
import flash.net.*;
import flash.events.*;

public class server
{
    public function load_info(id:int):String
    {
        var info:String;
        var loader:URLLoader = new URLLoader();
        loader.load(new URLRequest("http://localhost:4567/read_b/"+id.toString()));
        loader.addEventListener(Event.COMPLETE, onComplete);

        function onComplete(event:Event):void
        {
            var file:XML = XML(loader.data);
            info = file.user.@*.toXMLString();

            for each (var building:XML in file.building)
            {
                info += building.@*.toXMLString();
            }
        }
        return info;
    }
}
}
