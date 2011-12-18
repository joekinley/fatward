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
  import org.flixel.FlxPath;
  import org.flixel.FlxObject;
  import org.flixel.FlxText;
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

    private var text:FlxText;
    private var texts:Array;
    private var textTimes:Array;
    private var currentTextTimer:Number;
    private var currentTextMaxTime:Number;
    private var triggerCount:int;
    private var triggers:int;

    public function Game()
    {
      this.Image = Globals.IMG_TILES;
      this.triggerCount = 0;
      this.triggers = 0;
      this.currentTextTimer = 0;
      this.currentTextMaxTime = 0;
      this.texts = new Array;
      this.textTimes = new Array;
    }

    override public function create( ):void {

      FlxG.playMusic( Globals.ASS_MUSIC );

      // initialize world
      this.initializeWorld( );

      // initialize player
      this.initializePlayer( );

      // map post processing
      this.initMapPostprocessing( );

      // text thingy
      this.initText( );

      this.createFilter( );
    }

    public function createFilter( ):void {
      var filter:FlxSprite = new FlxSprite;
      filter.loadGraphic( Globals.IMG_FILTER, true, false, 320, 240 );
      filter.addAnimation( 'idle', [0,1,2], 1 );
      filter.play( 'idle' );
      filter.scrollFactor.x = 0;
      filter.scrollFactor.y = 0;
      this.add( filter );
    }

    override public function update( ):void {
      this.debug( );

      FlxG.collide( this.player, this.map );
      FlxG.collide( this.player, this.objects );

      this.showTexts( );

      super.update( );
    }

    public function initText( ):void {

      this.text = new FlxText( 110, 50, 150 );
      this.text.scrollFactor.x = 0;
      this.text.scrollFactor.y = 0;
      add( this.text );

      this.addText( "My name is Edward", 4 );
      this.addText( "They call me Fatward", 4 );
      this.addText( "I don't like that name", 4 );
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
      this.objects.loadMap( objectString, this.Image, Globals.TILE_WIDTH, Globals.TILE_HEIGHT, 0, 1, 1, 1 );
      this.objects.setTileProperties( Globals.TILE_TRIGGER_1, FlxObject.NONE, this.triggerEvent, Player, 12 );
      this.add( this.objects );

    }

    public function initMapPostprocessing( ):void {

      // player start position
      var startPoint:FlxPoint = this.map.getTileCoords( Globals.TILE_PLAYER_START, false )[ 0 ];
      //var startPoint:FlxPoint = new FlxPoint( 20, 20 ); // TODO
      this.player.x = startPoint.x;
      this.player.y = startPoint.y;
      this.map.setTile( startPoint.x / Globals.TILE_WIDTH, startPoint.y / Globals.TILE_HEIGHT, Globals.TILE_FLOOR_RED );

      // initialize showlights
      // red
      var redLight:FlxSprite = new FlxSprite;
      redLight.loadGraphic( Globals.IMG_SHOWLIGHTS, true, false, Globals.SHOWLIGHT_WIDTH, Globals.SHOWLIGHT_HEIGHT );
      redLight.addAnimation( 'idle', [0] );
      redLight.play( 'idle' );
      redLight.immovable = true;
      var path:FlxPath = new FlxPath;
      var points:Array = this.objects.getTileCoords( 2, false );
      for ( var i:int = 0; i < points.length; i++ ) {
        path.addPoint( points[ i ] );
        this.objects.setTile( points[ i ].x / Globals.TILE_WIDTH, points[ i ].y / Globals.TILE_HEIGHT, 0 );
        redLight.x = points[ i ].x;
        redLight.y = points[ i ].y;
      }
      redLight.followPath( path, 100, FlxObject.PATH_YOYO, true );
      this.add( redLight );

      // yellow
      var yellowLight:FlxSprite = new FlxSprite;
      yellowLight.loadGraphic( Globals.IMG_SHOWLIGHTS, true, false, Globals.SHOWLIGHT_WIDTH, Globals.SHOWLIGHT_HEIGHT );
      yellowLight.addAnimation( 'idle', [1] );
      yellowLight.play( 'idle' );
      yellowLight.immovable = true;
      path = new FlxPath;
      points = this.objects.getTileCoords( 3, false );
      for ( i = 0; i < points.length; i++ ) {
        path.addPoint( points[ i ] );
        this.objects.setTile( points[ i ].x / Globals.TILE_WIDTH, points[ i ].y / Globals.TILE_HEIGHT, 0 );
        yellowLight.x = points[ i ].x;
        yellowLight.y = points[ i ].y;
      }
      yellowLight.followPath( path, 100, FlxObject.PATH_YOYO, true );
      this.add( yellowLight );

      // blue
      var blueLight:FlxSprite = new FlxSprite;
      blueLight.loadGraphic( Globals.IMG_SHOWLIGHTS, true, false, Globals.SHOWLIGHT_WIDTH, Globals.SHOWLIGHT_HEIGHT );
      blueLight.addAnimation( 'idle', [2] );
      blueLight.play( 'idle' );
      blueLight.immovable = true;
      path = new FlxPath;
      points = this.objects.getTileCoords( 4, false );
      for ( i = 0; i < points.length; i++ ) {
        path.addPoint( points[ i ] );
        this.objects.setTile( points[ i ].x / Globals.TILE_WIDTH, points[ i ].y / Globals.TILE_HEIGHT, 0 );
        blueLight.x = points[ i ].x;
        blueLight.y = points[ i ].y;
      }
      blueLight.followPath( path, 100, FlxObject.PATH_YOYO, true );
      this.add( blueLight );
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

    public function openDoor( no:int, replace:int = 0 ):void {

      var tiles:Array = this.objects.getTileInstances( no );
      if ( tiles == null ) return;

      for ( var i:int = 0; i < tiles.length; i++ ) {
        this.objects.setTileByIndex( tiles[ i ], replace );
      }
    }

    public function triggerEvent( tile:FlxTile, player:Player ):void {

      switch( tile.index ) {

        case Globals.TILE_TRIGGER_1: // enter prom
          if ( triggers > 0 ) return;
          this.openDoor( Globals.TILE_DOOR_1 );
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_2: // talk to johnny and emily
          if ( this.triggers > 1 ) return;
          this.openDoor( Globals.TILE_DOOR_2 );
          this.addText( "\"Go away Fatward\"", 3, true );
          this.addText( "\"You stink\"", 5 );
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_3: // bang paperbag
          if ( this.triggers > 2 ) return;
          this.openDoor( Globals.TILE_BALLOON ); // removes balloon
          this.addText( "*BANG*", 2, true );
          this.addText( "\"Waaaaaaaaaaaaah....\"", 7 );
          this.addText( "*chuckles*", 4 );
          this.openDoor( Globals.TILE_DOOR_3 );
          this.openDoor( Globals.TILE_ENEMIES_JOHNNY );
          this.openDoor( Globals.TILE_ENEMIES_EMILY );
          this.openDoor( Globals.TILE_ENEMIES_JOHNNY2, Globals.TILE_ENEMIES_JOHNNY );
          this.openDoor( Globals.TILE_ENEMIES_EMILY2, Globals.TILE_ENEMIES_EMILY );
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_4: // get kitten
          if ( this.triggers > 3 ) return;
          this.openDoor( Globals.TILE_KITTEN ); // removes kitten
          this.addText( "Look a cute little kitten.", 3, true );
          this.addText( "I'll show it to the other guys", 5 );
          this.openDoor( Globals.TILE_DOOR_4 );
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_5: // talk to johnny and emily, show kitten
          if ( this.triggers > 4 ) return;
          this.addText( "\"Leave us in peace\"", 5, true );
          this.openDoor( Globals.TILE_DOOR_5 );
          this.openDoor( Globals.TILE_ENEMIES_JOHNNY );
          this.openDoor( Globals.TILE_ENEMIES_EMILY );
          this.openDoor( Globals.TILE_ENEMIES_JOHNNY3, Globals.TILE_ENEMIES_JOHNNY );
          this.openDoor( Globals.TILE_ENEMIES_EMILY3, Globals.TILE_ENEMIES_EMILY );
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_6A:
          if ( this.triggers > 5 ) return;
          if ( this.triggerCount == 0 ) {
            this.addText( "Oh a flashlight.", 4 );
            this.addText( "This should come in handy in this dark building", 5 );
            this.triggerCount++;
          }
          break;

        case Globals.TILE_TRIGGER_6B:
          if ( this.triggerCount == 1 ) {
            this.triggerCount++;
            this.addText( "\"Why don't you leave us alone?\"", 6 );
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY );
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY4, Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY4, Globals.TILE_ENEMIES_EMILY );
          }
          break;

        case Globals.TILE_TRIGGER_6C:
          if ( this.triggerCount == 2 ) {
            this.triggerCount++;
            this.addText( "\"You need help Fatward!\"", 7 );
            this.addText( "\"You need help!\"", 3 );
            this.addText( "\"We need help!\"", 1 );
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY );
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY5, Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY5, Globals.TILE_ENEMIES_EMILY );
          }
          break;

        case Globals.TILE_TRIGGER_6D:
          if ( this.triggers > 5 ) return;
          if ( this.triggerCount == 3 ) {
            this.openDoor( Globals.TILE_DOOR_6 );
            this.triggerCount = 0;
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY );
            this.addText( "\"No Fatward! NO!\"", 6 );
            this.addText( "", 4 );
            this.addText( "I've always been this ugly", 4 );
            this.addText( "I was born with a deformed face", 4 );
            this.addText( "But I have much love to give", 4 );
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY );
            this.openDoor( Globals.TILE_ENEMIES_JOHNNY6, Globals.TILE_ENEMIES_JOHNNY );
            this.openDoor( Globals.TILE_ENEMIES_EMILY6, Globals.TILE_ENEMIES_EMILY );
            this.triggers++;
          }
          break;

        case Globals.TILE_TRIGGER_7:
          if ( this.triggers > 6 ) return;
          this.openDoor( Globals.TILE_DOOR_7 );
          // TODO: talk text
          this.addText( "What are you people doing here?", 3 );
          this.addText( "\"Edward please, please leave us alone.\"", 5 );
          this.addText( "\"Please don't harm us\"", 5 );
          this.addText( "", 5 );
          this.addText( "Sometimes I cry myself to sleep", 5 );
          this.addText( "All I want is a friend", 5 );
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_8:
          if ( this.triggers > 7 ) return;
          this.openDoor( Globals.TILE_DOOR_8 );
          this.addText( "\"There he is, don't move Edward!\"", 4, true );
          this.addText( "\"There is police everywhere! Give up your rampage!\"", 5 );
          // TODO: summon police, talk text
          this.triggers++;
          break;

        case Globals.TILE_TRIGGER_FINAL:
          if ( this.triggers > 8 ) return;
          // TODO: play die animation and end game
          this.player.die( );
          this.triggers++;
          this.addText( "", 5, true );
          this.addText( "Nobody understands me", 5 );
          this.addText( "Why don't people like me?", 5 );
          this.addText( "...", 5 );
          this.addText( "Now I will be alone forever", 10 );
          this.addText( "", 5 );
          this.addText( "News: A young student with a deformed face has gone rampage on a school prom tonight.", 8 );
          this.addText( "He has first planted a bomb in the toilet, and then he attacked students in the schoolyard with a knive.", 8 );
          this.addText( "Later he got himself a gun and hunted two students through the school building.", 8 );
          this.addText( "He forced all the students into a dark classroom, threatening them with a gun.", 8 );
          this.addText( "As the police arrived in the school he jumped outside a window, killing himself in the process.", 8 );
          this.addText( "We find no words for this cruel act on the poor students of the school.", 8 );
          this.addText( "", 5 );
          this.addText( "THE END", 1000 );
          // TODO: show outro
          break;
      }
    }

    public function addText( text:String, time:Number, force:Boolean = false ):void {

      if ( force ) {
        this.texts = new Array;
        this.textTimes = new Array;
        this.currentTextTimer = 0;
      }
      this.texts.push( text );
      this.textTimes.push( time );
    }

    public function showTexts( ):void {

      if ( this.currentTextTimer == 0 ) {

        if ( this.texts.length == 0 ) {
          this.text.text = "";
          this.currentTextTimer = 0;
          return;
        }

        this.text.text = this.texts.shift( );
        this.currentTextMaxTime = this.textTimes.shift( );
      }

      this.currentTextTimer += FlxG.elapsed;
      if ( this.currentTextTimer >= this.currentTextMaxTime ) {
        this.currentTextTimer = 0;
      }

    }


    public function debug( ):void {

      if ( FlxG.keys.justPressed( 'ONE' ) ) {
        this.openDoor( Globals.TILE_DOOR_1 );
      } else if ( FlxG.keys.justPressed( 'TWO' ) ) {
        this.openDoor( Globals.TILE_DOOR_2 );
      } else if ( FlxG.keys.justPressed( 'THREE' ) ) {
        this.openDoor( Globals.TILE_DOOR_3 );
      } else if ( FlxG.keys.justPressed( 'FOUR' ) ) {
        this.openDoor( Globals.TILE_DOOR_4 );
      } else if ( FlxG.keys.justPressed( 'FIVE' ) ) {
        this.openDoor( Globals.TILE_DOOR_5 );
      } else if ( FlxG.keys.justPressed( 'SIX' ) ) {
        this.openDoor( Globals.TILE_DOOR_6 );
      } else if ( FlxG.keys.justPressed( 'SEVEN' ) ) {
        this.openDoor( Globals.TILE_DOOR_7 );
      } else if ( FlxG.keys.justPressed( 'EIGHT' ) ) {
        this.openDoor( Globals.TILE_DOOR_8 );
      } else if ( FlxG.keys.justPressed( 'NINE' ) ) {
        this.player.die( );
      }
    }

  }

}