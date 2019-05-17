/* TextAdventure.pde
 * 
 * Main program code.
 * 
 * J Karstin Neill    05.16.2019
 */

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  
  PFont courierNew = createFont("CourierNew.ttf", 32);
  fill(0, 255, 255);
  textFont(courierNew);
  text("This is some text", 100, 100);
}
