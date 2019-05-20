/* UI.pde
 * 
 * Takes user input, and then displays a copy of said input to the screen, as well as acts on that input.
 * 
 * J Karstin Neill    05.20.2019
 */

class UI extends Screen {
  private boolean active;
  
  public UI() {
    super();
    this.active = false;
    this.print("Enter Text");
  }
  
  public UI(Coord tl, Coord s, int max) {
    super(tl, s, max);
    this.active = false;
    this.print("Enter Text");
  }
  
  public boolean activate(int mX, int mY) {
    if (mX >= this.tlCorner.x() && mX <= this.tlCorner.plus(this.size).x() &&
        mY >= this.tlCorner.y() && mY <= this.tlCorner.plus(this.size).y())
    {
      this.active = true;
      return true;
    }
    else return false;
  }
};
