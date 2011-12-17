package
{
  import flash.display.BitmapData;
  import org.flixel.FlxState;
  import org.flixel.FlxGroup;
  import org.flixel.FlxTilemap;
  import org.flixel.system.FlxTile;
  import org.flixel.FlxG;
  import org.flixel.FlxRect;
  import org.flixel.FlxCamera;
  import org.flixel.FlxSprite;
  import org.flixel.FlxPoint;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Game extends FlxState
  {
    private var Image:Class;
    private var player:Player;

    private var maps:FlxGroup;
    private var map:FlxTilemap;
    private var objects:FlxTilemap;

    public function Game()
    {
      this.Image = Globals.IMG_TILES;
    }

    override public function create( ):void {

      // initialize world
      this.initializeWorld( );

      // initialize player
      this.initializePlayer( );

      // map post processing
      this.initMapPostprocessing( );

    }

    override public function update( ):void {
      this.debug( );

      FlxG.collide( this.player, this.map );

      super.update( );
    }

    public function initializeWorld( ):void {

      // initialize group
      //this.maps = new FlxGroup;
/*
      // initialize main map
      var map:FlxTilemap = new FlxTilemap;
      map.loadMap( FlxTilemap.arrayToCSV( Globals.LVL_MAIN, Globals.LVL_MAIN_WIDTH ), this.Image, Globals.TILE_WIDTH, Globals.TILE_HEIGHT, 0, 1, 1, Globals.TILE_SOLID );
      this.maps.add( map );

      // add maps for rendering
      this.add( this.maps );
      return;
*/
      var worldPixels:BitmapData = new FlxSprite( 0, 0, Globals.IMG_MAP ).pixels;
      var worldString:String = FlxTilemap.bitmapToCSV( worldPixels, false, 1, Globals.LVL_TILEMAP );

      var objectPixels:BitmapData = new FlxSprite( 0, 0, Globals.IMG_OBJECTS ).pixels;
      var objectString:String = FlxTilemap.bitmapToCSV( objectPixels, false, 1, Globals.LVL_OBJECTMAP );

      // initialize main map
      this.map = new FlxTilemap;
      this.map.loadMap( worldString, this.Image, Globals.TILE_WIDTH, Globals.TILE_HEIGHT, 0, 1, 1, Globals.TILE_SOLID );
      this.add( this.map );

      // initialize objects
      this.objects = new FlxTilemap;
      this.objects.loadMap( objectString, this.Image, Globals.TILE_WIDTH, Globals.TILE_HEIGHT, 0, 1, 1, Globals.TILE_SOLID );
      this.add( this.objects );

    }

    public function initMapPostprocessing( ):void {

      // player start position
      var startPoint:FlxPoint = this.map.getTileCoords( Globals.TILE_PLAYER_START, false )[ 0 ];
      //var startPoint:FlxPoint = new FlxPoint( 20, 20 ); // TODO
      this.player.x = startPoint.x;
      this.player.y = startPoint.y;
      this.map.setTile( startPoint.x / Globals.TILE_WIDTH, startPoint.y / Globals.TILE_HEIGHT, Globals.TILE_FLOOR_RED );

      // initialize johnny
      // TODO
    }

    public function initializePlayer( ):void {

      this.player = new Player( );
      this.add( this.player );

      //this.correctCameraBounds( );

      FlxG.camera.follow( this.player );
      FlxG.camera.setBounds( 0, 0, map.width, map.height );
      FlxG.worldBounds = new FlxRect( 0, 0, map.width, map.height );
    }

     public function addLevel( lvl:int ):void {

      if ( this.maps.length != lvl ) return;

      switch( lvl ) {

        case Globals.LVLS_TOILET:
          var tilemap:FlxTilemap = new FlxTilemap;
          tilemap.loadMap( FlxTilemap.arrayToCSV( Globals.LVL_TOILET, Globals.LVL_TOILET_WIDTH ), this.Image, Globals.TILE_WIDTH, Globals.TILE_HEIGHT, 0, 1, 1, Globals.TILE_SOLID );
          tilemap.x = Globals.LVL_TOILET_SNAP.x;
          tilemap.y = Globals.LVL_TOILET_SNAP.y;
          this.maps.add( tilemap );
          break;

      }

      // correct map overlays
      for ( var i:int = this.maps.length-1; i > 0; i-- ) {
        (FlxTilemap)(this.maps.members[ i - 1 ]).overlapsWithCallback( (FlxTilemap)(this.maps.members[ i ]), this.mapOverlapCorrector );
      }

      this.correctCameraBounds( );
    }

    public function mapOverlapCorrector( tile:FlxTile, map:FlxTilemap ):void {
      tile.tilemap.setTile( (int)(tile.x / Globals.TILE_WIDTH), (int)(tile.y / Globals.TILE_HEIGHT), 0 );
    }

    public function correctCameraBounds( ):void {
      var x:int = 0, y:int = 0, w:int = 0, h:int = 0;

      for ( var i:int = 0; i < this.maps.length; i++ ) {

        var current:FlxTilemap = (FlxTilemap)(this.maps.members[ i ]);

        if ( x > current.x ) x = current.x; // left border
        if ( y > current.y ) y = current.y; // top border

        if ( w < current.x + current.width ) w = current.x + current.width; // right border
        if ( h < current.y + current.height ) h = current.y + current.height; // bottom border
      }

      if ( x < 0 ) w += Math.abs( x );
      if ( y < 0 ) h += Math.abs( y );

      FlxG.camera.setBounds( x, y, w * 2, h * 2 );
      FlxG.worldBounds = new FlxRect( x, y, w * 2, h * 2 );
      FlxG.camera.follow( this.player );
    }


    public function debug( ):void {

      if ( FlxG.keys.justPressed( 'ONE' ) ) {
        this.addLevel( Globals.LVLS_TOILET );
      }
    }

  }

}