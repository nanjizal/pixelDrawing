package pixelDrawing;
import pixelDrawing.*;
import hxPixels.Pixels;
using pixelDrawing.Plot;
class Fill{

    /** Fills the specified rect area, with `value` expressed in ARGB format. */
    /** the try is not ideal but better that no bound checking. */
    public static inline function fillRectColorAndPixel( pixels: Pixels, x: Int, y: Int, wid: Int, hi: Int, col: Int, alpha: Int ):Void {
        var pos = (y * pixels.width + x) << 2;
        var stridePixels = new Pixels( wid, 1, true);
        stridePixels.format = pixels.format;
        var stride = wid << 2;
        for (x in 0...wid) {
            Plot.setPixelColorAndAlpha( stridePixels, x, 0, col, alpha );
            //trace( 'setting color ' + col );
        }
        for (y in 0...hi) {
            try{
                pixels.bytes.blit( pos, stridePixels.bytes, 0, stride );
            } catch ( e: Dynamic ){
                trace( 'fill broken at xy: ' + x + ', ' + y );
            }
            pos += pixels.width << 2;
        }
    }

}
