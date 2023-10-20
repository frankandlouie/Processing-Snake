void setup()
{
  //background(0);
  size(700,900);
  frameRate(60);
}

game game = new game();

void draw()
{
  game.runGame();  
}
