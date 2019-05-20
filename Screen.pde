/* Screen.pde
 * 
 * UI system to easily display "command line"-style data to the window.
 * 
 * J Karstin Neill    05.18.2019
 */

public class Screen {
  private Coord tlCorner;
  private Coord size;
  private color bColor;
  private color tColor;
  private PFont tFont;
  private int edgePadding;
  private int lineHeight;
  private int maxSavedLines;
  private int savedLines;
  private String[] lines;
  
  public Screen() {
    this.setBackgroundColor(#000000);
    this.setTextColor(#00FFFF);
    this.setFont("CourierNew.ttf", 24);
    this.edgePadding = 10;
    this.lineHeight = 24;
    this.maxSavedLines = (height-2*this.edgePadding)/this.lineHeight;
    this.tlCorner = new Coord(0, height-2*this.edgePadding-this.lineHeight*this.maxSavedLines);
    this.size = new Coord(width, 2*this.edgePadding+this.lineHeight*this.maxSavedLines);
    this.savedLines = 0;
    this.lines = new String[this.maxSavedLines];
  }
  
  public Screen(int max) {
    this.setBackgroundColor(#000000);
    this.setTextColor(#00FFFF);
    this.setFont("CourierNew.ttf", 24);
    this.edgePadding = 10;
    this.lineHeight = 24;
    this.maxSavedLines = max;
    this.tlCorner = new Coord(0, height-2*this.edgePadding-this.lineHeight*this.maxSavedLines);
    this.size = new Coord(width, 2*this.edgePadding+this.lineHeight*this.maxSavedLines);
    this.savedLines = 0;
    this.lines = new String[this.maxSavedLines];
  }
  
  public void setBackgroundColor(color b) {
    this.bColor = b;
  }
  
  public void setTextColor(color t) {
    this.tColor = t;
  }
  
  public void setFont(String path, int s) {
    this.tFont = createFont(path, s);
  }
  
  public void setEdgePadding(int e) {
    this.edgePadding = e;
  }
  
  public void setLineHeight(int l) {
    this.lineHeight = l;
  }
  
  public void setMaxSavedLines(int max) {
    this.maxSavedLines = max;
    String[] tmp = new String[this.maxSavedLines];
    for (int i=0; i < this.savedLines && i < this.maxSavedLines; i++)
      tmp[i] = this.lines[i];
    this.lines = tmp;
  }
  
  public void print(String message) {
    this.addLine(message);
    fill(this.bColor);
    rect(this.tlCorner.x(), this.tlCorner.y(), this.size.x(), this.size.y());
    fill(this.tColor);
    textFont(this.tFont);
    for (int i=0; i < this.savedLines; i++)
      text(this.lines[i], this.tlCorner.x()+this.edgePadding, this.tlCorner.plus(this.size).y()-this.edgePadding-i*this.lineHeight);
  }
  
  public void print(int value) {
    this.print(Integer.toString(value));
  }
  
  private void addLine(String l) {
    if (this.savedLines < this.maxSavedLines) this.savedLines++;
    for (int i=this.savedLines-1; i > 0; i--)
      this.lines[i] = this.lines[i-1];
    this.lines[0] = l;
  }
};
