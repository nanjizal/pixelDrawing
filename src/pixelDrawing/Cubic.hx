package pixelDrawing;
import pixelDrawing.*;
import hxPixels.Pixels;

using pixelDrawing.Plot;
class Cubic implements IPixelShape {
    public var pixels: Pixels;
    var dxc0: Float;
    var dyc0: Float;
    var dxc1: Float;
    var dyc1: Float;
    var dxe: Float;
    var dye: Float;

    public var bx: Float;
    public var by: Float;
    public var c0x: Float;
    public var c0y: Float;
    public var c1x: Float;
    public var c1y: Float;
    public var ex: Float;
    public var ey: Float;
    public var bxi: Int;
    public var byi: Int;
    public var c0xi: Int;
    public var c0yi: Int;
    public var c1xi: Int;
    public var c1yi: Int;
    public var exi: Int;
    public var eyi: Int;
    public var thickness: Float;

	public function new( pixels_: Pixels, bx_: Float, by_: Float
                        , c0x_: Float, c0y_: Float
                        , c1x_: Float, c1y_: Float
                        , ex_: Float, ey_: Float, w: Float ): Void{
        pixels = pixels_;
        dxc0 = c0x_ - bx_;
        dyc0 = c0y_ - by_;
        dxc1 = c1x_ - bx_;
        dyc1 = c1y_ - by_;
        dxe = ex_ - bx_;
        dye = ey_ - by_;
        move( bx_, by_ );
        thickness = w;
        // max and min not implemented yet?
    }

    public function fill( col: Int, alpha: Float ):Void {}

    public function move( bx_: Float, by_: Float ){
        bx = bx_;
        by = by_;
        c0x = bx_ + dxc0;
        c0y = by_ + dyc0;
        c1x = bx_ + dxc1;
        c1y = by_ + dyc1;
        ex = bx_ + dxe;
        ey = by_ + dye;
        bxi = Std.int( bx );
        byi = Std.int( by );
        c0xi = Std.int( c0x );
        c0yi = Std.int( c0y );
        c1xi = Std.int( c1x );
        c1yi = Std.int( c1y );
        exi = Std.int( ex );
        eyi = Std.int( ey );
    }

    public function translate( tx_: Float, ty_: Float ){
        move( bx + tx_, by + ty_ );
    }

    public function hitTest( x_: Float, y_: Float ): Bool {
        // check bounding box first.
        //if(!( x_ > minX && x_ < maxX && y_ > minY && y_ < maxY )) return;
        return false;
    }
    public function plot( col: Int, alpha: Float, ?w: Float = 1 ): Void {
        var a: Int = Std.int( alpha * 0xff );
        Plot.plotCubicBezier( pixels, bxi, byi, c0xi, c0yi, c1xi, c1yi, exi, eyi, col, a );
    }
}
