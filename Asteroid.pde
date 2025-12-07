public class Asteroid extends Floater {
  private double rotationSpeed;
  public double getX() { return myCenterX; }
  public double getY() { return myCenterY; }

  public Asteroid() {
    corners = 6;
    xCorners = new int[6];//{-20, -10, 10, 20, 10, -10}
    yCorners = new int[6]; //{0, -15, -20, 0, 20, 15}
    xCorners[0] = -20;
    yCorners[0] = 0;
    xCorners[1] = -10;
    yCorners[1] = -15;
    xCorners[2] = 10;
    yCorners[2] = -20;
    xCorners[3] = 20;
    yCorners[3] = 0;
    xCorners[4] = 10;
    yCorners[4] = 20;
    xCorners[5] = -10;
    yCorners[5] = 15;
    
    myColor = color(150);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 3 - 1; 
    myYspeed = Math.random() * 3 - 1;
    myPointDirection = Math.random() * 360;
    rotationSpeed = Math.random() * 4 - 2; 
  }
  
  public void move() {
  myCenterX += myXspeed;
  myCenterY += myYspeed;
  
  if (myCenterX > width)  myCenterX = 0;
  else if (myCenterX < 0) myCenterX = width;

  if (myCenterY > height) myCenterY = 0;
  else if (myCenterY < 0) myCenterY = height;
  turn(rotationSpeed);
  }
}

