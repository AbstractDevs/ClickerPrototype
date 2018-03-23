package demo;

import openfl.events.Event;

class ScoreEvent extends Event
{
    public static inline var SCORE_CHANGED:String = "SCORE_CHANGED";

    public function new(type:String)
    {
        super(type, false, false);
    }
}