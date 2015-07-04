package {
import flash.display.Sprite;

public class Fields extends Sprite
{
    public function Fields() 
    {
        var field:Sprite = new Sprite();
        field.graphics.beginFill(0x25D500);
        field.width = 700;
        field.height = 700;
        addChild(field);
    }
}
}
