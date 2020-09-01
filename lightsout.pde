void setup() {
  size(500, 500);
}
boolean[][] grid = {
{false, false, false, false, false},
{false, false, false, false, false},
{false, false, false, false, false},
{false, false, false, false, false},
{false, false, false, false, false}
};

int clickedX;
int clickedY;

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < 500; i += 100) {
    line(i, 0, i, 500);
  }
  line(499, 0, 499, 499);
  
  for (int j = 0; j < 500; j += 100) {
    line(0, j, 500, j);
  }
  line(0, 499, 499, 499);
  
  for (int x = 0; x < 5; x++) {
    for (int y = 0; y < 5; y++) {
      fill(0);
      if (grid[x][y]) {
        fill(255);
      }
      rect(y*100, x*100, 100, 100);
    }
  }
}

void mouseClicked() {
  clickedX = floor(mouseX/100);
  clickedY = floor(mouseY/100);
  flipNeighbourhood(clickedX, clickedY);
}

void keyPressed() {
  if (key == 'r') {
    for (int count = 0; count < random(100, 500); count++) {
      flipNeighbourhood(floor(random(0, 5)), floor(random(0, 5)));
    }
  }
}

void flip(int x, int y) {
  if (grid[y][x]) {
    grid[y][x] = false;
  } else {
    grid[y][x] = true;
  }
}

void flipNeighbourhood(int x, int y) {
  flip(x, y);
  if (x != 0) {
    flip(x - 1, y);
  }
  if (x != 4) {
    flip(x + 1, y);
  }
  
  if (y != 0) {
    flip(x, y - 1);
  }
  if (y != 4) {
    flip(x, y + 1);
  }
}
