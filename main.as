package
{

import flash.display.Sprite;
import flash.text.TextField;

public class main extends Sprite
{
    public var user:users = new users();
    public var txt:TextField = new TextField();
    public var building:buildings = new buildings();

    public function main()
    {

        txt.width = 300;
        txt.height = 200;
        txt.x = 50;
        txt.y = 50;
        txt.border = true;
        txt.borderColor =  0x000000;
        txt.text = "Error";
        addChild(txt);
        user.read_info(1, on_get);
    }

    private function on_get(file:XML):void
    {
        user.user_name = file.user.@name.toXMLString();
        user.surname = file.user.@surname.toXMLString();
        var temp:XML = file.user.child [0];
        building.work_type = file.user.building.@work_type.toXMLString();
        txt.text = user.user_name + " " + user.surname + "/n";
        txt.appendText(building.work_type);
    }
}
}
