/* Coord.pde
 * 
 * 2D Coordinate space management
 * 
 * J Karstin Neill    05.20.2019
 */

class Coord {
  private float x;
  private float y;
  
  public Coord() {
    this.setX(0f);
    this.setY(0f);
  }
  public Coord(float x, float y) {
    this.setX(x);
    this.setY(y);
  }
  
  public void setX(float x) {
    this.x = x;
  }
  
  public void setY(float y) {
    this.y = y;
  }
  
  public float x() {
    return this.x;
  }
  
  public float y() {
    return this.y;
  }
  
  public Coord plus(Coord c) {
    return new Coord(this.x()+c.x(), this.y()+c.y());
  }
};
