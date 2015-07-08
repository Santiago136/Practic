package {

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.*


public class Button extends Sprite{
    public function Button(text:String, onClick:Function)
    {
        var button:Sprite = new Sprite();
        var button_text:TextField = new TextField();
        button.graphics.beginFill(0xFFCC00);
        button.graphics.drawRect(0, 0, 50, 20);
        button.buttonMode = true;
        button_text.text = text;
        button_text.width = 50; //vertical
        button_text.height = 20; //horizontal
        button_text.x = 2;
        button_text.y = 2;
        addChild(button);
        addChild(button_text);
        button_text.mouseEnabled = false;
        button.addEventListener(MouseEvent.CLICK, onClick);
    }
}
}

