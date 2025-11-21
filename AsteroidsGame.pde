Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;

void setup() {
  size(800, 800);
  ship = new Spaceship();
  stars = new Star[100];
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
}

void draw() {
  background(0);
  
  // Draw stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  
  // Update ship
  ship.move();
  ship.show();

  // Update asteroids + collision
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    float distance = dist((float)ship.getX(), (float)ship.getY(), (float)a.getX(), (float)a.getY());
    if (distance < 25) { // slightly larger threshold
      asteroids.remove(i);
    } else {
      a.move();
      a.show();
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT)  ship.turn(-ship.getRotationalSpeed());
    if (keyCode == RIGHT) ship.turn(+ship.getRotationalSpeed());
    if (keyCode == UP) {
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
