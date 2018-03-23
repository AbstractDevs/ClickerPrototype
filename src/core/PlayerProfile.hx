package core;

import js.html.Storage;
import js.Browser;

class PlayerProfile
{
    private static inline var CLICK_KEY:String = "clicks";

    private static var ms_clickCount:Int;

    public static function getClickCount():Int
    {
        if(ms_clickCount == null)
        {
            var storage:Storage = Browser.window.localStorage;
            var clickCount:String = storage.getItem(CLICK_KEY);
            ms_clickCount = (clickCount != null ? Std.parseInt(clickCount) : 0);
        }

        return ms_clickCount;
    }

    public static function addClick():Void
    {
        ms_clickCount = getClickCount() + 1;
        var storage:Storage = Browser.window.localStorage;
        storage.setItem(CLICK_KEY, Std.string(ms_clickCount));
    }
}