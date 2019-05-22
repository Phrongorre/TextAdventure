/* TextAdventure.pde
 * 
 * Main program code.
 * 
 * J Karstin Neill    05.16.2019
 */

Screen screen;
UI ui;
int i;

void setup() {
  size(800, 600);
  screen = new Screen(new Coord(), new Coord(width, height-44), 22);
  ui = new UI(new Coord(0, height-44), new Coord(width, 44), 1);
  i = 0;
  screen.setColorMode(HSB);
}

void draw() {
  if (i > 255) i = 0;
  else i++;
  screen.setTextColor(i, 255, 255);
  screen.print(i);
  ui.print("current");
}
