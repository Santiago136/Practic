package
{
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.net.URLRequest;

public class Main extends Sprite
{
    public var user:User = new User();
    public var building:Building = new Building();

    public var field:Field = new Field();
    public var btn_read:Button = new Button("Read", btn_read_click);
    public var btn_create:Button = new Button("Create", btn_create_click);
    public var btn_clear:Button = new Button("Clear", btn_clear_click);

    public function Main():void
    {
        addChild(field);

        var loader:Loader = new Loader();
        loader.load(new URLRequest("http://localhost:4567/factory.png"));
        loader.addEventListener(Event.COMPLETE, onComplete);

        function onComplete(e:Event):void
        {
            var image:Bitmap = loader.contentLoaderInfo.content as Bitmap
            addChild(image);
        }

        btn_read.x = 400;
        btn_read.y = 250;
        field.addChild(btn_read);
        btn_create.x = 325;
        btn_create.y = 250;
        field.addChild(btn_create);
        addChild(field.screen);
    }

    private function btn_read_click(e:Event):void
    {
        user.read_info(1, read_xml);
    }

    private function btn_create_click(e:Event):void
    {
        building.create(1, "factory", 150, 150, field, err);
    }

    private function btn_clear_click():void
    {
        field.screen.text = "";
    }

    private function read_xml(file:XML):void
    {
        user.user_name = file.user.@name.toXMLString();
        user.surname = file.user.@surname.toXMLString();
        building.work_type = file.user.building.@work_type.toXMLString();
        field.screen.text = "Greetings " + user.user_name + " " + user.surname + "!";
    }

    private function err():void
    {
        field.screen.text = "ERROR"
    }
}
}
