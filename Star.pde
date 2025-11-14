class Star //note that this class does NOT extend Floater
{
  private float x;
  private float y;
  private float brightness;
  private float size;
  public Star() {
    x = (float)(Math.random()*800);
    y = (float)(Math.random()*800);
    brightness = (float)(Math.random()*155+50); 
    size =(float)(Math.random()* 2.0+1.0);
  }
  public void show() {
    stroke(brightness);
    strokeWeight(size);
    point(x, y);
  }
}
