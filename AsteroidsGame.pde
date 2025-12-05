Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullet;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();


void setup() {
  size(800, 800);
  ship = new Spaceship();
  stars = new Star[100];
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < 15; i++) {
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

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    float distance = dist((float)ship.getX(), (float)ship.getY(), (float)a.getX(), (float)a.getY());
    if (distance < 25) { // slightly larger threshold
      asteroids.remove(i);
    } else {
      a.move();
      a.show();
    }
    textSize(17);
    int bulletsLeft = 5 - bullets.size();
    int asteroidsLeft = asteroids.size();
    text("bullets left: " + String.valueOf(bulletsLeft) + " asteroids left: " + String.valueOf(asteroidsLeft), 40, 40, 280, 320); 
  }
  
  // stuff
  for (int i = 0; i < bullets.size(); i++) { 
  Bullet b = bullets.get(i);
  b.move();
  b.show();
  System.out.println(bullets.size());
  }
  
   for (int i = bullets.size()-1; i >= 0; i--) {
     for (int j = asteroids.size()-1; j >= 0; j--) {
       if (dist((float)bullets.get(i).getBullX(), (float)bullets.get(i).getBullY(),
                (float)asteroids.get(j).getX(), (float)asteroids.get(j).getY()) < 20) {
          bullets.remove(i);
          asteroids.remove(j);
        break;
      }
    }
  }

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT)  ship.turn(-ship.getRotationalSpeed());
    if (keyCode == RIGHT) ship.turn(+ship.getRotationalSpeed());
    if ((keyCode == 16) && bullets.size() < 5) bullets.add(new Bullet(ship));
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
