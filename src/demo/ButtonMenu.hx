package demo;

import openfl.display.Sprite;

class ButtonMenu extends Sprite
{
    private static inline var MENU_WIDTH:Float = 640;
    private static inline var MENU_HEIGHT:Float = 480;
   
    private static inline var BUTTON_ANCHOR_X_POS:Float = 320;
    private static inline var BUTTON_ANCHOR_Y_POS:Float = 240;
    
    private static inline var MENU_BACKGROUND_COLOR:Int = 0x404040;

    private var m_button:ClickButton;

    public function new()
    {
        super();

        this.graphics.beginFill(MENU_BACKGROUND_COLOR);
        this.graphics.drawRect(0, 0, MENU_WIDTH, MENU_HEIGHT);
        this.graphics.endFill();

        m_button = new ClickButton();
        m_button.x = BUTTON_ANCHOR_X_POS;
        m_button.y = BUTTON_ANCHOR_Y_POS;
        addChild(m_button);
    }
}