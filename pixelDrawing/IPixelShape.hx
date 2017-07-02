package pixelDrawing;

interface IPixelShape {
    function hitTest( x: Float, y: Float ): Bool;
    function fill( col: Int, alpha: Float ):Void;
    function plot( col: Int, alpha: Float, ?wid: Float = 1 ): Void;
    function move( x: Float, y: Float ):Void;
    function translate( x: Float, y: Float ):Void;
}
