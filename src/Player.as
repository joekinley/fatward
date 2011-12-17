package
{
  import org.flixel.FlxSprite;
  import org.flixel.FlxObject;
  import org.flixel.FlxG;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Player extends FlxSprite
  {
    private var Image:Class;

    public function Player( )
    {
      super( );

      //this.x = x;
      //this.y = y;

      this.Image = Globals.IMG_TILES;
      loadGraphic( this.Image, true, false, Globals.PLAYER_TILE_WIDTH, Globals.PLAYER_TILE_HEIGHT );

      width = 12;
      height = 12;
      drag.x = Globals.PLAYER_SPEED * 8;
      drag.y = Globals.PLAYER_SPEED * 8;
      centerOffsets( );

      addAnimation( 'idle_down', [2] );
      addAnimation( 'idle_right', [3] );
      addAnimation( 'idle_left', [4] );
      addAnimation( 'idle_up', [5] );
      addAnimation( 'walk_down', [6, 7], Globals.PLAYER_ANIMATION_SPEED );
      addAnimation( 'walk_up', [8, 9], Globals.PLAYER_ANIMATION_SPEED );
      addAnimation( 'walk_right', [10, 11], Globals.PLAYER_ANIMATION_SPEED );
      addAnimation( 'walk_left', [12, 13], Globals.PLAYER_ANIMATION_SPEED );
    }

    override public function update( ):void {

      this.handleMovement( );
      this.handleAnimation( );
      super.update( );
    }

    public function handleMovement( ):void {

      this.velocity.x = 0;
      this.velocity.y = 0;

      // movement
      if ( FlxG.keys.LEFT ) {
        this.facing = FlxObject.LEFT;
        this.velocity.x = -Globals.PLAYER_SPEED;
      } else if ( FlxG.keys.RIGHT ) {
        this.facing = FlxObject.RIGHT;
        this.velocity.x = Globals.PLAYER_SPEED;
      } else if ( FlxG.keys.UP ) {
        this.facing = FlxObject.UP;
        this.velocity.y = -Globals.PLAYER_SPEED;
      } else if ( FlxG.keys.DOWN ) {
        this.facing = FlxObject.DOWN;
        this.velocity.y = Globals.PLAYER_SPEED;
      }
    }

    public function handleAnimation( ):void {

      // handle animation
      if ( this.velocity.x != 0 ) {
        if ( this.facing == FlxObject.LEFT ) play( 'walk_left' );
        else if ( this.facing == FlxObject.RIGHT ) play( 'walk_right' );
      }

      if ( this.velocity.y != 0 ) {
        if ( this.facing == FlxObject.UP ) play( 'walk_up' );
        else if ( this.facing == FlxObject.DOWN ) play( 'walk_down' );
      }

      if ( this.velocity.x == 0 && this.velocity.y == 0 ) {
        switch( this.facing ) {
          case FlxObject.UP: play( 'idle_up' ); break;
          case FlxObject.DOWN: play( 'idle_down' ); break;
          case FlxObject.LEFT: play( 'idle_left' ); break;
          case FlxObject.RIGHT: play( 'idle_right' ); break;
        }
      }
    }

  }

}