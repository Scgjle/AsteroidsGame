//your variable declarations here
public void setup() 
{
  size(800, 800);
  ship = new Spaceship();
  stars = new Star[100];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();

  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
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

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    float notwow = dist((float)ship.myCenterX, (float)ship.myCenterY, (float)a.myCenterX, (float)a.myCenterY);
    if (notwow < 20) { 
      asteroids.remove(i);
    } else {
      a.move();
      a.show();
    }
  }
}

void keyPressed() { 
  if (key == CODED) {
    if (keyCode == LEFT)  ship.turn(-ship.myRotationalSpeed); // stuff for keyboard input
    if (keyCode == RIGHT) ship.turn(+ship.myRotationalSpeed);
    if (keyCode == UP) {
      ship.accelerate(ship.myAcceleration);
      ship.setAccelerating(true);
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

