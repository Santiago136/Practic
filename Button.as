package {

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.*


public class Button extends Sprite{
    public function Button(x:int, y:int, text:String, onClick:Function)
    {
        var button:Sprite = new Sprite();
        var button_text:TextField = new TextField();
        button.graphics.beginFill(0xFFCC00);
        button.graphics.drawRect(x, y, 100, 70);
        button.buttonMode = true;
        button_text.text = text;
        button_text.width = 100;
        button_text.height = 70;
        button_text.x = x+5;
        button_text.y = y+5;
        addChild(button);
        addChild(button_text);
        button.addEventListener(MouseEvent.CLICK, onClick);
    }
}
}
