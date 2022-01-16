class Water extends Particle
{
  int x;
  int y;
  int w;
  boolean stickLeft = true;
  Water(int x, int y, int w)
  {
    this.x = x;
    this.y = y;
    this.w = w;
  }

  void sim()
  {
    int i = x/res;
    int j = y/res;
    if (i-1 < 0)
      stickLeft = false;
    else if (i + 1 >= cols)
      stickLeft = true;

    if (j+1 < rows && grid[i][j+1] instanceof Air)
    {
      Air air = new Air(x, y, w);
      grid[i][j] =  air;
      grid[i][j+1] = this;
      y += res;
      j++;
    } // left
    else if ((i - 1 > -1) && grid[i-1][j] instanceof Air && stickLeft)
    {
      Air air = new Air(x, y, w);
      grid[i][j] =  air;
      grid[i-1][j] = this;
      i--;
      x -= res;
    }
    
    // right
    else if ((i+1 < cols) && grid[i+1][j] instanceof Air && !stickLeft)
    {
      Air air = new Air(x, y, w);
      grid[i][j] = air;
      grid[i+1][j] = this;
      i++;
      x += res;
    }
    else if ((i - 1 > -1) && !(grid[i-1][j] instanceof Air) || (i+1 < cols) && !(grid[i+1][j] instanceof Air))
    {
      stickLeft = !stickLeft;
    }
  }

  void display()
  {
    fill(color(66, 135, 245));
    stroke(color(66, 135, 245));
    rect(x, y, w-1, w-1);
  }

  public String toString()
  {
    return "water here!";
  }
}
