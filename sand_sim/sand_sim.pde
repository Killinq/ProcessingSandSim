Particle[][] grid;
int cols;
int rows;
int res = 15;

int timeInterval = 10;
int lastRecordedTime;

int xVal;
int yVal;

void setup()
{
  size(500, 500);
  //left_or_right = floor(random(2));
  cols = width/res;
  rows = height/res;
  grid = new Particle[cols][rows];
  for (int i = 0; i < cols; i++)  
    for (int j = 0; j < rows; j++)
      grid[i][j] = new Air(i * res, j * res, res);
}

void draw()
{
  for (Particle[] a : grid)
  {
    for (Particle b : a)
    {
      b.sim();
      b.display();
    }
  }
  if (mousePressed)
  {
    // i didn't come up with this but it stops OOB errors trust me
    xVal = int (map(mouseX, 0, width, 0, width/res));
    yVal = int (map(mouseY, 0, height, 0, height/res));
    xVal = constrain(xVal, 0, width/res - 1);
    yVal = constrain(yVal, 0, height/res - 1);
    // on left click, create object
    if (mouseButton == LEFT)
    { 
      if (grid[xVal][yVal] instanceof Air)
      {
        Sand sand = new Sand(xVal * res, yVal * res, res);
        grid[xVal][yVal] = sand;
        sand.display();
      }
    } else
      grid[xVal][yVal] = new Air(xVal * res, yVal * res, res);
  }

  
}
