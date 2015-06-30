package
{

import flash.display.Sprite;
import flash.text.TextField;
import server

public class Main extends Sprite
{
    public function Main()
    {
        var txt:TextField = new TextField();
        txt.width = 1000;
        txt.height = 1000;
        txt.text = "If you see this, there is an error";
        addChild(txt);

        var srv:server = new server();
        txt.text = srv.load_info(1);
    }
}
}

