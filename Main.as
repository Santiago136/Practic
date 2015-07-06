package
{

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;

public class Main extends Sprite
{
    public var user:User = new User();
    public var building:Building = new Building();

    public var field:Field = new Field();
    public var screen:TextField = new TextField();
    public var btn1:Button = new Button(400, 250, "Read", btn1_click);

    public function Main():void
    {
        screen.x = 100;
        screen.y = 15;
        screen.border = true;
        screen.height = 20; //horizontal
        screen.width = 300; //vertical

        addChild(field);
        addChild(btn1);
        addChild(screen);
        user.Read_info(1, on_get);
    }

    public function btn1_click():void
    {
        building.Create(1, "factory", 150, 150, Build, Error);
    }

    public function on_get(file:XML):void
    {
        user.user_name = file.user.@name.toXMLString();
        user.surname = file.user.@surname.toXMLString();
        building.work_type = file.user.building.@work_type.toXMLString();
        screen.text = user.user_name + " " + user.surname + "/n";
        screen.appendText(building.work_type);
    }

    public function Build():void
    {
        addChild(building);
        screen.text = "Built";
    }

    public function Error():void
    {
        screen.text = "Can't build";
    }
}
}
