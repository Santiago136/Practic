package {

import flash.display.DisplayObject;
import flash.display.Sprite;


public class Field extends Sprite
{
    [Embed(source="field.jpg")]
    public static var Obj:Class;

    public function Field()
    {
        var field:DisplayObject = new Obj() as DisplayObject;
        field.height = 300;
        field.width = 500;
        addChild(field);
    }
}
}
