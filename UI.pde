/* UI.pde
 * 
 * UI system to easily display "command line"-style data to the window.
 * 
 * J Karstin Neill    05.18.2019
 */

public class UI {
  private color bColor;
  private color tColor;
  private PFont tFont;
  private int edgePadding;
  private int lineHeight;
  private int maxSavedLines;
  private int savedLines;
  private String[] lines;
  
  public UI() {
    bColor = #000000;
    tColor = #00FFFF;
    tFont = createFont("CourierNew.ttf", 24);
    edgePadding = 10;
    lineHeight = 24;
    maxSavedLines = (height-2*edgePadding)/lineHeight;
    savedLines = 0;
    lines = new String[maxSavedLines];
  }
  
  public UI(color b, color t, String path, int s, int e, int l, int max) {
    bColor = b;
    tColor = t;
    tFont = createFont(path, s);
    edgePadding = e;
    lineHeight = l;
    maxSavedLines = max;
    savedLines = 0;
    lines = new String[maxSavedLines];
  }
  
  public void setBackgroundColor(color b) {
    bColor = b;
  }
  
  public void setTextColor(color t) {
    tColor = t;
  }
  
  public void setFont(String path, int s) {
    tFont = createFont(path, s);
  }
  
  public void setEdgePadding(int e) {
    edgePadding = e;
  }
  
  public void setLineHeight(int l) {
    lineHeight = l;
  }
  
  public void setMaxSavedLines(int max) {
    maxSavedLines = max;
    String[] tmp = new String[maxSavedLines];
    for (int i=0; i < savedLines && i < maxSavedLines; i++)
      tmp[i] = lines[i];
    lines = tmp;
  }
  
  public void print(String message) {
    addLine(message);
    background(bColor);
    fill(tColor);
    textFont(tFont);
    for (int i=0; i < savedLines; i++)
      text(lines[i], edgePadding, height-edgePadding-i*lineHeight);
  }
  
  public void print(int value) {
    print(Integer.toString(value));
  }
  
  private void addLine(String l) {
    if (savedLines < maxSavedLines) savedLines++;
    for (int i=savedLines-1; i > 0; i--)
      lines[i] = lines[i-1];
    lines[0] = l;
  }
};
