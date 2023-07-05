int x_pos; 
float x_dir;    //  공의 x좌표, 방향
int y_pos;
float y_dir;    //  공의 y좌표, 방향
int [][] block = new int[4][10];

int speed = 3;      //  공의 속도 설정
int padle;      // 패들 변수
int score = 0;

void setup()
{
  size(600, 400);
  
  x_pos = width/2;    // x좌표 초기값
  y_pos = height/2;   // y좌표 초기값
  x_dir = speed;      // 공의 x속도
  y_dir = speed;      // 공의 y속도
  
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j < 10; j++)
    {
      block[i][j] = 1;
    }
  }
  
  padle = width/2;
  fill(100);
  strokeWeight(4);
  stroke(255);
}

void draw()
{
  background(0);      // 배경 설정
  x_pos += x_dir;     // 공의 x좌표 이동
  y_pos += y_dir;     // 공의 y좌표 이동
  
  for(int i = 0; i < 4; i++)
  {
    for(int j = 0; j <10; j++)
    {
      if(block[i][j] == 1)    rect(j*60, i*15, 60, 15);
    }
  }
  
  ellipse(x_pos, y_pos, 20, 20);    // 공 그리기
  textSize(25);
  text(score, 550, 390); 
  
  if(x_pos >= width-10)    x_dir *= -1;  // 오른쪽 최대값
  if(x_pos <= 0+10)        x_dir *= -1;  // 왼쪽 최대값
  if(y_pos >= height-10)
  {
    x_dir = 0;
    y_dir = 0;
    textSize(50);
    text("Game Over", 180, 150);
  }
  if(y_pos <= 0+10)        y_dir *= -1;  // 위쪽 최대값
  
  if(y_pos < 60)
  {
    if(block[y_pos/15][x_pos/60] == 1)
    {
      block[y_pos/15][x_pos/60] = 0;
      y_dir *= -1;
      score += 10;
    }
    if(y_pos <= 0)  y_dir *= -1;
  }
  
  padle = mouseX;
  line(padle+40, height-50, padle-40, height-50);
  
  if(y_pos <= height-50)
  {
    if(y_pos > height-50-10 && x_pos > padle-40 && x_pos < padle+40)
    {
      y_dir = random(1,7);
      y_dir *= -1;
    }
  }
}
