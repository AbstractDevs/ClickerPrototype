package demo;

import core.PlayerProfile;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

class ButtonMenu extends Sprite
{
    private static inline var MENU_WIDTH:Float = 640;
    private static inline var MENU_HEIGHT:Float = 480;
   
    private static inline var BUTTON_ANCHOR_X_POS:Float = 320;
    private static inline var BUTTON_ANCHOR_Y_POS:Float = 220;

    private static inline var SCORE_ANCHOR_X_POS:Float = 320;
    private static inline var SCORE_ANCHOR_Y_POS:Float = 320;

    private static inline var MENU_BACKGROUND_COLOR:Int = 0x404040;

    private var m_button:ClickButton;
    private var m_scoreLbl:TextField;

    public function new()
    {
        super();

        this.graphics.beginFill(MENU_BACKGROUND_COLOR);
        this.graphics.drawRect(0, 0, MENU_WIDTH, MENU_HEIGHT);
        this.graphics.endFill();

        m_button = new ClickButton();
        m_button.x = BUTTON_ANCHOR_X_POS;
        m_button.y = BUTTON_ANCHOR_Y_POS;
        m_button.addEventListener(ScoreEvent.SCORE_CHANGED, onScoreChanged);
        addChild(m_button);

        m_scoreLbl = new TextField();
        m_scoreLbl.width = MENU_WIDTH;
        m_scoreLbl.height = MENU_HEIGHT;
        m_scoreLbl.mouseEnabled = false;
        m_scoreLbl.setTextFormat(new TextFormat(null, 24, 0xFFFFFF));
        updateScoreLbl();
        addChild(m_scoreLbl);
    }

    private function onScoreChanged(e:ScoreEvent):Void
    {
        updateScoreLbl();
    }

    private function updateScoreLbl():Void
    {
        var score:Int = PlayerProfile.getClickCount();
        m_scoreLbl.text = 'You have clicked the button $score times';
        m_scoreLbl.x = SCORE_ANCHOR_X_POS - (m_scoreLbl.textWidth / 2);
        m_scoreLbl.y = SCORE_ANCHOR_Y_POS - (m_scoreLbl.textHeight / 2);
    }
}