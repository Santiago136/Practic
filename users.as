package {

import flash.display.Sprite;
import flash.text.TextField;import flash.net.*;
import flash.events.*;

public class users extends Sprite
{
    public var user_name:String = "name";
    public var surname:String = "surname";
    public var id:int = 1;
    public var deposit:int = 0;
    public var loader:URLLoader = new URLLoader();
    //For tests
    public function show_info(txt:TextField):void
    {
        txt.text = "If you see this, there is an error";
        txt.text = "Name: " + user_name + "\nSurname: " + surname + "\nId: " + id;
        addChild(txt);
    }

    public function create(name:String, surname:String):void
    {
        loader.load(new URLRequest("http:localhost:4567/new_u/"+name.toString()+"-"+surname.toString()));
    }

    public function read_info(id:int, txt:TextField):void
    {
        var info:String;
        var file:XML = new XML();
        var loader:URLLoader = new URLLoader();
        loader.load(new URLRequest("http:localhost:4567/"));  //read_u/"+id.toString()));
        loader.addEventListener(Event.COMPLETE, onComplete);

        function onComplete(event:Event):void
        {
            file = XML(loader.data);
            user_name = file.user.@name.toXMLString();
            surname = file.user.@surname.toXMLString();
            txt.text = user_name + " " + surname;
        }
    }

    public function del(id:int):void
    {
        loader.load(new URLRequest("http:localhost:4567/del_u/"+id.toString()));
    }
}
}
