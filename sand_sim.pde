Particle[][] grid;
Particle[][] next;
int cols;
int rows;
int res = 15;

int timeInterval = 25;
int lastRecordedTime;

int lastKey = 1;
boolean continueRight = false;
boolean continueLeft = true;

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
    {
      int x = i * res;
      int y = j * res;
      grid[i][j] = new Air(x, y, res);
    }
  next = grid;    
}

void draw()
{
  /*for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      int x = i * res;
      int y = j * res;
      /*if (grid[i][j] instanceof Air)
      {
        fill(0);
        stroke(0);
        rect(x, y, res-1, res-1);
      } /*else if (grid[i][j] instanceof Sand)
      {
        Sand sand = new Sand(x, y, res);
        /*fill(color(107, 84, 43));
        stroke(color(107, 84, 43));
        rect(x, y, res-1, res-1);
      } else if (grid[i][j] instanceof Water)
      {
        fill(color(66, 173, 245));
        stroke(color(66, 173, 245));
        rect(x, y, res-1, res-1);
      }
    }
  }*/
  if (millis() - lastRecordedTime > timeInterval)
  {
    iterate();
    lastRecordedTime = millis();
  }
  if (keyPressed)
  {
    switch(key)
    {
      case ('1'):
      lastKey = 1;
      break;
      case('2'):
      lastKey = 2;
      break;
      case('c'):
      grid = new Particle[cols][rows];
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
      /*if (yVal + 1 > rows - 1)
        yVal = rows-2;
      if (yVal + 2 > rows - 2)
        yVal = rows-3;
      /*if (grid[xVal][yVal+1] != 0 &&  grid[xVal][yVal + 2] == 0)
       grid[xVal][yVal] = 0;*/
      if (lastKey == 1 && grid[xVal][yVal] instanceof Air)
      {
        Sand sand = new Sand(xVal * res, yVal * res, res);
        sand.displayClicked();
        sand.sim();
      }
        
      //if (lastKey == 2) 
      //  grid[xVal][yVal] = 2;
    }
    //anything else and we delete
    else
    {
      grid[xVal][yVal] = new Air(xVal * res, yVal * res, res);
    }
  }
}
void iterate()
{
  /*for (Particle[] a: grid)
    for (Particle b: a)
      b.sim();*/
  // the grid of the next frame
  /*
  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j++)
    {

      Particle obj = grid[i][j]; // check the object type 0 -> Air, 1 -> Sand, 2 -> Water, 3 -> Stone
      Particle obj_under = new Air(i, j+1, res);
      Particle obj_left = new Air(i-1, j, res);;
      Particle obj_left_down = new Air(i-1, j+1, res);;
      Particle obj_right_down = new Air(i+1, j+1, res);;
      Particle obj_right = new Air(i+1, j, res);;

      int iLeft = i - 1;
      int iRight = i + 1;
      int jDown = j + 1;

      int left_or_right = floor(random(2));
      // make sure we don't get any funny errors
      if (jDown > rows - 1)
        jDown = rows - 1;
      if (iLeft < 0)
        iLeft = 0;
      if (iRight > cols - 1)
        iRight = cols-1;

      obj_under = grid[i][jDown];
      obj_left = grid[iLeft][j];
      obj_right = grid[iRight][j];
      obj_left_down = grid[iLeft][jDown];
      obj_right_down = grid[iRight][jDown];

      
      // sand logic
      /*if (obj instanceof Sand)
      {
        count++;
        if (obj_under instanceof Air)
        {
          if (j == rows - 2)
          {
            next[i][j] = new Sand(i, j, res);
          } else
            next[i][jDown] = new Sand(i, jDown, res);
        } /*else
        {
          // if left down spot is available go there
          if (obj_left_down == 0 && left_or_right == 0)
            next[iLeft][jDown] = 1;
          // if right down spot is available go there
          else if (obj_right_down == 0 && left_or_right == 1)
            next[iRight][jDown] = 1;
          // if neither is available stay in palce
          else 
          next[i][j] = 1;
        }
      }
      //watah logic
      /*if (obj == 2)
      {
        if (obj_under == 0)
        {
          if (j == rows - 2)
          {
            next[i][j] = 2;
          } else
            next[i][jDown] = 2;
        } else
        {
          // if left spot is available go there
          if (obj_left == 0 && (obj_right_down == 2 || obj_right_down != 0 || obj_right != 0))
          {
            if (iLeft < 0)
            {
              next[i][j] = 2;
            } else
              next[iLeft][j] = 2;
          }
          // if right spot is available go there
          else if (obj_right == 0 && (obj_left_down == 2 || obj_left_down == 0 || obj_left != 0))
          {
            if (i == rows-1)
            {
              next[i][j] = 2;
            } else
              next[iRight][j] = 2;
          } else 
          next[i][j] = 2;
        }
        // if neither is available stay in palce
      }
    }
  }
  grid = next;*/
}
