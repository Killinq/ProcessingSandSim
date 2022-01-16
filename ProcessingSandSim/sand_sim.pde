import java.util.concurrent.CopyOnWriteArrayList;
import java.util.List;
Particle[][] grid;
List<Particle> particles;
int cols;
int rows;
int res = 15;

int timeInterval = 10;
int lastRecordedTime = 0;

int xVal;
int yVal;

int lastKeyPressed = 1;
void setup()
{
  size(500, 500);
  frameRate(1000);
  init();
}

void init()
{
  cols = width/res;
  rows = height/res;
  grid = new Particle[cols][rows];
  for (int i = 0; i < cols; i++)  
    for (int j = 0; j < rows; j++)
      grid[i][j] = new Air(i * res, j * res, res);
  particles = new CopyOnWriteArrayList<Particle>();
}

void draw()
{
  if (millis() - lastRecordedTime > timeInterval)
  {
    for (Particle b : particles)
    {
      b.sim();
      b.display();
    }
    lastRecordedTime = millis();
  }
  if (keyPressed)
  {
    switch (key)
    {
      case('1'):
        lastKeyPressed = 1;
        break;
      case('2'):
        lastKeyPressed = 2;
        break;
      case('c'):
        init();
        break;
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
      if (lastKeyPressed == 1 && grid[xVal][yVal] instanceof Air)
      {
        Sand sand = new Sand(xVal * res, yVal * res, res);
        grid[xVal][yVal] = sand;
        particles.add(sand);
        sand.display();
      }
      if (lastKeyPressed == 2 && grid[xVal][yVal] instanceof Air)
      {
        Water water = new Water(xVal * res, yVal * res, res);
        grid[xVal][yVal] = water;
        particles.add(water);
        water.display();
      }
    } else
    {
      Particle removedSand = grid[xVal][yVal];
      grid[xVal][yVal] = new Air(xVal * res, yVal * res, res);
      particles.remove(removedSand);
    }
  }
  
}
