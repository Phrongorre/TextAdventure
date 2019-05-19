/* TextAdventure.pde
 * 
 * Main program code.
 * 
 * J Karstin Neill    05.16.2019
 */

UI ui;

void setup() {
  size(1280, 720);
  ui = new UI();
}

void draw() {
  ui.print(0);
}
