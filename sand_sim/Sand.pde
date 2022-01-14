class Sand extends Particle
{
  int x;
  int y;
  int w;
  Sand(int x, int y, int w)
  {
    this.x = x;
    this.y = y;
    this.w = w;
  }

  void sim()
  {
    iterate();
  }

  void iterate()
  {
    int i = x/res;
    int j = y/res;
    while (j+1 < rows)
    {
      if (grid[i][j+1] instanceof Air)
      {
        Air air = new Air(x, y, w);
        grid[i][j] =  air;
        grid[i][j+1] = this;
        y += res;
      } else if ((i - 1 > -1) && grid[i-1][j+1] instanceof Air)
      {
        Air air = new Air(x, y, w);
        grid[i][j] =  air;
        grid[i-1][j+1] = this;
        i--;
        x -= res;
        y += res;
      } else if ((i+1 < cols) && grid[i+1][j+1] instanceof Air)
      {
        Air air = new Air(x, y, w);
        grid[i][j] = air;
        grid[i+1][j+1] = this;
        i++;
        x += res;
        y += res;
      }
      j++;
    }
  }

  void display()
  {
    fill(color(107, 84, 43));
    stroke(color(107, 84, 43));
    rect(x, y, res-1, res-1);
  }

  public String toString()
  {
    return "sand here!";
  }
}
