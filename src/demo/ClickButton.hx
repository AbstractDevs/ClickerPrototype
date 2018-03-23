package demo;

import core.PlayerProfile;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
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
        m_label.mouseEnabled = false;
        m_label.x = (-m_label.textWidth) / 2;
        m_label.y = (-m_label.textHeight) / 2;
        addChild(m_label);

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function drawButton():Void
    {
        this.graphics.clear();
        this.graphics.beginFill(m_isDown ? BUTTON_DOWN_COLOR : BUTTON_UP_COLOR);
        this.graphics.drawRect(-BUTTON_WIDTH / 2, -BUTTON_HEIGHT / 2, BUTTON_WIDTH, BUTTON_HEIGHT);
        this.graphics.endFill();
    }

    private function addListeners():Void
    {
        this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    }

    private function removeListeners():Void
    {
        this.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        this.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    }

    private function onAddedToStage(e:Event):Void
    {
        addListeners();
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onRemovedFromStage(e:Event):Void
    {
        removeListeners();
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onMouseDown(e:MouseEvent):Void
    {
        m_isDown = true;
        drawButton();
    }

    private function onMouseUp(e:MouseEvent):Void
    {
        if(!m_isDown)
        {
            return;
        }
        
        //Add a click
        PlayerProfile.addClick();
        dispatchEvent(new ScoreEvent(ScoreEvent.SCORE_CHANGED));

        m_isDown = false;
        drawButton();
    }
}