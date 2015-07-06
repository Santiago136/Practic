package {

import flash.events.*;
import flash.net.*;


public class User
{
    public var user_name:String = "name";
    public var surname:String = "surname";
    public var id:int = 1;
    public var deposit:int = 0;
    public var loader:URLLoader = new URLLoader();

    public function Create(name:String, surname:String):void
    {
        loader.load(new URLRequest("http:localhost:4567/new_u/"+name.toString()+"-"+surname.toString()));
    }

    public function Read_info(id:int,fn:Function):void
    {
        var file:XML = new XML();
        var loader:URLLoader = new URLLoader();
        loader.load(new URLRequest("http:localhost:4567/read_u/"+id.toString()));
        loader.addEventListener(Event.COMPLETE, onComplete);

        function onComplete(event:Event):void
        {
            file = XML(loader.data);
            fn(file);
        }
    }

    public function Del(id:int):void
    {
        loader.load(new URLRequest("http:localhost:4567/del_u/"+id.toString()));
    }
}
}
