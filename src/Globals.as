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

    public static const TILE_DOOR_1:int = 42; // DOOR 1 TILE
    public static const TILE_DOOR_2:int = 46; // DOOR 2 TILE
    public static const TILE_DOOR_3:int = 47; // DOOR 3 TILE
    public static const TILE_DOOR_4:int = 48; // DOOR 4 TILE
    public static const TILE_DOOR_5:int = 49; // DOOR 5 TILE
    public static const TILE_DOOR_6:int = 50; // DOOR 6 TILE
    public static const TILE_DOOR_7:int = 56; // DOOR 7 TILE
    public static const TILE_DOOR_8:int = 57; // DOOR 8 TILE

    public static const TILE_TRIGGER_1:int = 81; // TRIGGER 1
    public static const TILE_TRIGGER_2:int = 82; // TRIGGER 2
    public static const TILE_TRIGGER_3:int = 83; // TRIGGER 3
    public static const TILE_TRIGGER_4:int = 84; // TRIGGER 4
    public static const TILE_TRIGGER_5:int = 85; // TRIGGER 5
    public static const TILE_TRIGGER_6A:int = 86; // TRIGGER 6A
    public static const TILE_TRIGGER_6B:int = 89; // TRIGGER 6B
    public static const TILE_TRIGGER_6C:int = 90; // TRIGGER 6C
    public static const TILE_TRIGGER_6D:int = 91; // TRIGGER 6D
    public static const TILE_TRIGGER_7:int = 87; // TRIGGER 7
    public static const TILE_TRIGGER_8:int = 88; // TRIGGER 8
    public static const TILE_TRIGGER_FINAL:int = 92; // TRIGGER FINAL

    public static const PLAYER_TILE_WIDTH:int = 16;
    public static const PLAYER_TILE_HEIGHT:int = 16;
    public static const PLAYER_ANIMATION_SPEED:int = 4;
    public static const PLAYER_SPEED:int = 100;

    public static const SHOWLIGHT_WIDTH:int = 64;
    public static const SHOWLIGHT_HEIGHT:int = 64;

    [Embed(source = '../assets/graphics/tiles.png')] public static const IMG_TILES:Class;
    [Embed(source = '../assets/graphics/map.png')] public static const IMG_MAP:Class;
    [Embed(source = '../assets/graphics/objects.png')] public static const IMG_OBJECTS:Class;
    [Embed(source = '../assets/graphics/showlight.png')] public static const IMG_SHOWLIGHTS:Class;
    [Embed(source = '../assets/graphics/filter_2.png')] public static const IMG_FILTER:Class;


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

      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 2 - 14 NOTHING

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
      0, // 1

      0x00FFFF, // 2 SHOWLIGHT RED
      0x00FFFE, // 3 SHOWLIGHT YELLOW
      0x00FFFD, // 4 SHOWLIGHT BLUE

      0, 0, 0, 0, 0, 0, // 5 - 10
      0, 0, 0, 0, 0, 0, 0, // 11 - 17
      0xFF0000, // 18 ENEMY JOHNNY
      0, // 19
      0xFC0000, //  20 ENEMY EMILY
      0, 0, 0, 0, 0, 0,
      0xFE0000, // 27 ENEMY RANDOM NPC MALE DOWN
      0xFD0000, // 28 ENEMY RANDOM NPC FEMALE DOWN
      0, 0, // 29 - 30
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 31 - 40
      0, // 41

      0x00FF00, // 42 DOOR 1

      0, 0, 0, // 43 - 45

      0x00FE00, // 46 DOOR 2
      0x00FD00, // 47 DOOR 3
      0x00FC00, // 48 DOOR 4
      0x00FB00, // 49 DOOR 5
      0x00FA00, // 50 DOOR 6

      0xFFFF00, // 51 TABLE LEFT
      0xFFFE00, // 52 TABLE RIGHT
      0, // NOTHING OBJECT RELATED
      0xFFFD00, // 54 TRASH CAN
      0xFFFC00, // 55 PLANT TOP

      0x00F900, // 56 DOOR 7
      0x00F800, // 57 DOOR 8

      0, 0, 0, 0, 0, 0, 0, // 58 - 64

      0xFFFB00, // 65 PLANT BOTTOM

      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 66 - 80

      0x0000FF, // 81 TRIGGER 1
      0x0000FE, // 82 TRIGGER 2
      0x0000FD, // 83 TRIGGER 3
      0x0000FC, // 84 TRIGGER 4
      0x0000FB, // 85 TRIGGER 5
      0x0000FA, // 86 TRIGGER 6A
      0x0000F9, // 87 TRIGGER 7
      0x0000F8, // 88 TRIGGER 8
      0x0000F7, // 89 TRIGGER 6B
      0x0000F6, // 90 TRIGGER 6C
      0x0000F5, // 91 TRIGGER 6D
      0x0000F4, // 92 TRIGGER FINAL
      0
    );
  }

}