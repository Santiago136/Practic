package
{

import flash.display.Sprite;
import flash.text.TextField;
import users

public class Main extends Sprite
{
    public var user:users = new users();
    public function Main()
    {
        var txt:TextField = new TextField();
        txt.width = 1000;
        txt.height = 1000;
        var user:users = new users();
        addChild(txt);

        user.read_info(1, txt);
    }
}
}
