package
{
  import org.flixel.FlxPoint;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Globals
  {

    public function Globals()
    {
    }

    public static const TILE_SOLID:int = 41; // tile index that starts to be auto solid
    public static const TILE_WIDTH:int = 16;
    public static const TILE_HEIGHT:int = 16;

    public static const TILE_PLAYER_START:int = 1; // player start tile indicator
    public static const TILE_FLOOR_RED:int = 15;

    public static const TILE_ENEMIES_JOHNNY:int = 18; // enemy indicator johnny

    public static const PLAYER_TILE_WIDTH:int = 16;
    public static const PLAYER_TILE_HEIGHT:int = 16;
    public static const PLAYER_ANIMATION_SPEED:int = 4;
    public static const PLAYER_SPEED:int = 500;

    [Embed(source = '../assets/graphics/tiles.png')] public static const IMG_TILES:Class;
    [Embed(source = '../assets/graphics/map.png')] public static const IMG_MAP:Class;
    [Embed(source = '../assets/graphics/objects.png')] public static const IMG_OBJECTS:Class;


    public static const LVLS_MAIN:int = 0; // index in map array for that level
    public static const LVLS_TOILET:int = 1;

    // main prom map; dancing floor
    public static const LVL_MAIN_WIDTH:int = 24;
    public static const LVL_MAIN:Array = new Array(
      41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 41,
      41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41
    );

    // toilet
    public static const LVL_TOILET_SNAP:FlxPoint = new FlxPoint( -4 * Globals.TILE_WIDTH, 15 * Globals.TILE_HEIGHT );
    public static const LVL_TOILET_WIDTH:int = 7;
    public static const LVL_TOILET:Array = new Array(
      41, 41, 41, 41, 41, 41, 41,
      41, 17, 17, 17, 17, 17, 17,
      41, 17, 17, 17, 17, 17, 17,
      41, 17, 17, 17, 41, 17, 41,
      41, 17, 17, 17, 41, 17, 41,
      41, 17, 17, 17, 41, 17, 41,
      41, 17, 17, 17, 41, 17, 41,
      41, 17, 17, 17, 41, 17, 41,
      41, 17, 17, 17, 41, 17, 41,
      41, 41, 41, 41, 41, 41, 41
    );


    public static const LVL_TILEMAP:Array = new Array(
      0xFFFFFF, // 0 WHITE NOTHING
      0x00FF00, // 1 PLAYER START POSITION

      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 1- 14 NOTHING

      0xFFD3D3, // 15 RED FLOOR TILE
      0xFFD2D2, // 16 SHADOWY RED FLOOR TILE
      0xFFE6E6, // 17 BATHROOM FLOOR TILE

      // ENEMIES
      0xFF0001, // 18 ENEMY JOHNNY
      0xFFD1D1, // 19 OUTSIDE FLOOR
      0xFF0002, // 20 ENEMY EMILY
      0xFFD4D4, // 21 STAIRS TILE
      0xFFD5D5, // 22 SCHOOL FLOOR TILE 1
      0xFFD6D6, // 23 SCHOOL FLOOR TILE 2
      0xFFD7D7, // 24 SCHOOL FLOOR TILE 3
      0xFFD8D8, // 25 SCHOOL FLOOR TILE 4
      0xFFD9D9, // 26 GRAVEL PIT

      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 27 - 40 NOTHING

      0x313131, // 41 WALL
      0x0000FF, // 42 DOOR 1
      0x303030, // 43 BATHROOM STALL WALL HORIZONTAL
      0x303029, // 44 BATHROOM STALL WALL VERTICAL
      0x303028, // 45 BATHROOM STALL CONNECTOR
      0x0000FE, // 46 DOOR 2
      0x0000FD, // 47 DOOR 3

      0, 0, 0, // 48 - 50 NOTHING

      0x3A3A3A, // 51 TABLE LEFT PART
      0x3A3A3B, // 52 TABLE RIGHT PART
      0x333333, // 53 SCHOOL LOCKER

      0 // LAST TILE SHALL ALWAYS BE A 0
    );

    public static const LVL_OBJECTMAP:Array = new Array(
      0, // 0
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 1 - 10
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 11 - 20
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 21 - 30
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 31 - 40
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 41 - 50

      0xFFFF00, // 51 TABLE LEFT
      0xFFFE00, // 52 TABLE RIGHT
      0, // NOTHING OBJECT RELATED
      0xFFFD00, // 53 TRASH CAN
      0
    );
  }

}