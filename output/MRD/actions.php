<?php
// automatically generated by the FlatBuffers compiler, do not modify

namespace MRD;

class actions
{
    const connect = 0;

    private static $names = array(
        actions::connect=>"connect",
    );

    public static function Name($e)
    {
        if (!isset(self::$names[$e])) {
            throw new \Exception();
        }
        return self::$names[$e];
    }
}
