class Bullet extends Floater {
  
  public float getBullX() { 
   return (float)myCenterX; 
  }
  public float getBullY() { 
   return (float)myCenterY; 
  }
  
  Bullet(Spaceship theShip) {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.GetMyPoint();
    accelerate(6.0);
  }
  
    public void show() {
    fill(255); // white bullet
    noStroke();
    ellipse((float)myCenterX, (float)myCenterY, 6, 6);
  }
}
