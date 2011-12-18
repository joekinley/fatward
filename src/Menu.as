package
{
  import org.flixel.FlxState;
  import org.flixel.FlxSprite;
  import org.flixel.FlxG;
  import org.flixel.FlxText;
	/**
   * ...
   * @author Rafael Wenzel
   */
  public class Menu extends FlxState
  {

    public function Menu()
    {
      super( );
    }

    override public function create( ):void {
      var background:FlxSprite = new FlxSprite( 0, 0, Globals.IMG_TITLE );
      this.add( background );

      //var text:FlxText = new FlxText( 100, 10, 150, "[Press Any Key]" );
      var text2:FlxText = new FlxText( 100, 0, 150, "[Move with cursors or WASD]" );

      //this.add( text );
      this.add( text2 );
    }

    override public function update( ):void {

      if ( FlxG.keys.any( ) ) {
        FlxG.switchState( new Game );
      }

      super.update( );
    }

  }

}