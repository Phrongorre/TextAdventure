/* TextAdventure.pde
 * 
 * Main program code.
 * 
 * J Karstin Neill    05.16.2019
 */

Screen screen;

void setup() {
  size(1280, 720);
  screen = new Screen(5);
}

void draw() {
  screen.print(0);
}
