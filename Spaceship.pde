class Spaceship extends Floater  
{   
  private double myAcceleration;
  private double myRotationalSpeed;
  private boolean accelearting;
  public double getAcceleration() { return myAcceleration; }
  public double getRotationalSpeed() { return myRotationalSpeed; }


  public Spaceship() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0]= -8;
    yCorners[0]= -8;
    xCorners[1]= 16;
    yCorners[1]= 0; 
    xCorners[2]= -8;
    yCorners[2]= 8;
    xCorners[3]= -2;
    yCorners[3]= 0;
    myColor= color(255, 69, 99);
    myCenterX= width / 2.0;
    myCenterY= height / 2.0;
    myXspeed= 0.0;
    myYspeed= 0.0;
    myPointDirection= 0.0;
    myAcceleration= 0.1;
    myRotationalSpeed= 8.0;
    accelerating= false;
  }

 public void move() {
  if (accelerating) {
    accelerate(myAcceleration);
  }
  super.move();
 }


  public void hyperspace() {
    myXspeed = 0.0;
    myYspeed = 0.0;
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myPointDirection = Math.random() * 360.0;
  }
  public void setAccelerating(boolean a) {
    accelerating = a;
  }
  public boolean isAccelerating() {
    return accelerating;
  }
}
