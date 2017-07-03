package pixelDrawing;
enum ShapeEnum {
    ECircle( circle: Circle );
    ELine( line: Line );
    EQuadratic( quatratic: Quadratic );
    ECubic( cubic: Cubic );
    ETriangle( triangle: Triangle );
    ERectangle( rectangle: Rectangle );
    EGroup( group: Array<ShapeEnum> );
    ENull( );
}
