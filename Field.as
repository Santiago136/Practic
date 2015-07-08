package {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;


public class Field extends Sprite
{
    [Embed(source="field.jpg")]
    public static var Image:Class;

    public var screen:TextField = new TextField();


    public function Field()
    {
        screen.x = 100;
        screen.y = 15;
        screen.border = true;
        screen.height = 20; //horizontal
        screen.width = 300; //vertical
        addChild(screen);

        var field:DisplayObject = new Image() as DisplayObject;
        field.height = 300;
        field.width = 500;
        addChild(field);
    }
}
}
