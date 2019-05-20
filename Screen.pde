/* Screen.pde
 * 
 * UI system to easily display "command line"-style data to the window.
 * 
 * J Karstin Neill    05.18.2019
 */

public class Screen {
  protected Coord tlCorner;
  protected Coord size;
  protected color bColor;
  protected color tColor;
  protected int colorMode;
  protected PFont tFont;
  protected int edgePadding;
  protected int lineHeight;
  protected int maxSavedLines;
  protected int savedLines;
  protected String[] lines;
  
  public Screen() {
    this.setColorMode(RGB);
    this.setBackgroundColor(0, 0, 0);
    this.setTextColor(0, 255, 255);
    this.setFont("CourierNew.ttf", 24);
    this.edgePadding = 10;
    this.lineHeight = 24;
    this.maxSavedLines = (height-2*this.edgePadding)/this.lineHeight;
    this.tlCorner = new Coord(0, height-2*this.edgePadding-this.lineHeight*this.maxSavedLines);
    this.size = new Coord(width, 2*this.edgePadding+this.lineHeight*this.maxSavedLines);
    this.savedLines = 0;
    this.lines = new String[this.maxSavedLines];
  }
  
  public Screen(Coord tl, Coord s, int max) {
    this.setColorMode(RGB);
    this.setBackgroundColor(0, 0, 0);
    this.setTextColor(0, 255, 255);
    this.setFont("CourierNew.ttf", 24);
    this.edgePadding = 10;
    this.lineHeight = 24;
    this.maxSavedLines = max;
    this.tlCorner = tl;
    this.size = s;
    this.savedLines = 0;
    this.lines = new String[this.maxSavedLines];
  }
  
  public void setBackgroundColor(float a, float b, float c) {
    colorMode(this.colorMode);
    this.bColor = color(a, b, c);
  }
  
  public void setTextColor(float a, float b, float c) {
    colorMode(this.colorMode);
    this.tColor = color(a, b, c);
  }
  
  public void setColorMode(int mode) {
    this.colorMode = mode;
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
    noStroke();
    fill(this.bColor);
    rect(this.tlCorner.x(), this.tlCorner.y(), this.size.x(), this.size.y());
    stroke(this.tColor);
    noFill();
    rect(this.tlCorner.x()+this.edgePadding/2, this.tlCorner.y()+this.edgePadding/2, this.size.x()-this.edgePadding, this.size.y()-this.edgePadding);
    fill(this.tColor);
    textFont(this.tFont);
    for (int i=0; i < this.savedLines; i++)
      text(this.lines[i], this.tlCorner.x()+this.edgePadding, this.tlCorner.plus(this.size).y()-this.edgePadding-i*this.lineHeight);
  }
  
  public void print(int value) {
    this.print(Integer.toString(value));
  }
  
  protected void addLine(String l) {
    if (this.savedLines < this.maxSavedLines) this.savedLines++;
    for (int i=this.savedLines-1; i > 0; i--)
      this.lines[i] = this.lines[i-1];
    this.lines[0] = l;
  }
};
