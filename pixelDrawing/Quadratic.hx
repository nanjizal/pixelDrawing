package pixelDrawing;
import pixelDrawing.*;
import hxPixels.Pixels;

using pixelDrawing.Plot;
class Quadratic implements IPixelShape {
    public var pixels: Pixels;
    var dxc: Float;
    var dyc: Float;
    var dxe: Float;
    var dye: Float;

    public var bx: Float;
    public var by: Float;
    public var cx: Float;
    public var cy: Float;
    public var ex: Float;
    public var ey: Float;
    public var bxi: Int;
    public var byi: Int;
    public var cxi: Int;
    public var cyi: Int;
    public var exi: Int;
    public var eyi: Int;
    public var thickness: Float;

	public function new( pixels_: Pixels, bx_: Float, by_: Float, cx_: Float, cy_: Float, ex_: Float, ey_: Float, w: Float ): Void{
        pixels = pixels_;
        dxc = cx_ - bx_;
        dyc = cy_ - by_;
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
        cx = bx_ + dxc;
        cy = by_ + dyc;
        ex = bx_ + dxe;
        ey = by_ + dye;
        bxi = Std.int( bx );
        byi = Std.int( by );
        cxi = Std.int( cx );
        cyi = Std.int( cy );
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
        //Plot.plotQuadBezierSeg( pixels, bxi, byi, cxi, cyi, exi, eyi, col, a );
        //Plot.plotQuadBezierSegAA( pixels, bxi, byi, cxi, cyi, exi, eyi, col, a );
        Plot.plotQuadBezier( pixels, bxi, byi, cxi, cyi, exi, eyi, col, a );
    }
}
