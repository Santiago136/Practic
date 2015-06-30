package
{

import flash.display.Sprite;
import flash.text.TextField;
import downloader

public class Main extends Sprite
{
    public function Main()
    {
        var txt:TextField = new TextField();
        txt.width = 1000;
        txt.height = 1000;
        txt.text = "Hello world";
        addChild(txt);

        txt.text = server.load_info(1);
    }
}
}
