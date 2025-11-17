//your variable declarations here
public void setup() 
{
  size(800, 800);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}
public void draw() 
{
  background(0); // deleate if you want to make some art
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  ship.move();
  ship.show();
}

void keyPressed() { 
  if (key == CODED) {
    if (keyCode == LEFT)  ship.turn(-ship.myRotationalSpeed); // stuff for keyboard input
    if (keyCode == RIGHT) ship.turn(+ship.myRotationalSpeed);
    if (keyCode == UP) {
      ship.accelerate(ship.myAcceleration);
      ship.setAccelerating(true);
      text(ship.myAcceleration, 20, 20);
    }
  } else {
    if (key == 'h' || key == 'H') ship.hyperspace();
  }
}

void keyReleased() {
  if (key == CODED && keyCode == UP) {
    ship.setAccelerating(false);
  }
}

