package demo;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

class ClickButton extends Sprite
{
    private static inline var BUTTON_WIDTH:Float = 400;
    private static inline var BUTTON_HEIGHT:Float = 100;

    private static inline var BUTTON_UP_COLOR:Int = 0xFFFFFF;
    private static inline var BUTTON_DOWN_COLOR:Int = 0xD9D9D9;

    private var m_label:TextField;
    private var m_isDown:Bool = false;

    public function new()
    {
        super();

        drawButton();

        m_label = new TextField();
        m_label.text = "Click Me";
        m_label.setTextFormat(new TextFormat(null, 32));
        m_label.width = BUTTON_WIDTH;
        m_label.height = BUTTON_HEIGHT;
        m_label.x = (-m_label.textWidth) / 2;
        m_label.y = (-m_label.textHeight) / 2;
        addChild(m_label);
    }

    private function drawButton():Void
    {
        this.graphics.beginFill(m_isDown ? BUTTON_DOWN_COLOR : BUTTON_UP_COLOR);
        this.graphics.drawRect(-BUTTON_WIDTH / 2, -BUTTON_HEIGHT / 2, BUTTON_WIDTH, BUTTON_HEIGHT);
        this.graphics.endFill();
    }
}