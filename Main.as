package
{

import flash.display.Sprite;
import flash.text.TextField;

public class Main extends Sprite
{
    public var user:User = new User();
    public var building:Building = new Building();
    public var field:Field = new Field();
    public var screen:TextField = new TextField();
    public var btn1:Button = new Button(200, 200, "Read", btn1_click);

    public function main():void
    {
        screen.width = 300;
        screen.height = 200;
        screen.x = 10;
        screen.y = 10;
        screen.border = true;
        screen.borderColor =  0x000000;
        screen.text = "Error";
        addChild(screen);
        user.read_info(1, on_get);
    }

    private function btn1_click():void
    {
        screen.appendText("BUTTONS!!! YEP YEP!");
    }

    private function on_get(file:XML):void
    {
        user.user_name = file.user.@name.toXMLString();
        user.surname = file.user.@surname.toXMLString();
        building.work_type = file.user.building.@work_type.toXMLString();
        screen.text = user.user_name + " " + user.surname + "/n";
        screen.appendText(building.work_type);
    }
}
}
