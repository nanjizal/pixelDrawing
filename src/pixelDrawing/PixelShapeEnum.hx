package pixelDrawing;
enum PixelShapeEnum {
    ECircle( circle: PixelCircle );
    ELine( line: PixelLine );
    EQuadratic( quatratic: PixelQuadratic );
    ETriangle( triangle: PixelTriangle );
    ERectangle( rectangle: PixelRectangle );
    EGroup( group: Array<PixelShapeEnum> );
    ENull( );
}
