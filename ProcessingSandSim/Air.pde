class Air extends Particle
{
  int x;
  int y;
  int w;
  Air(int x, int y, int w)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    display();
  }

  void display()
  {
    fill(0);
    stroke(0);
    rect(x, y, w-1, w-1);
  }
  
  public String toString()
  {
    return "air here!";
  }
}
