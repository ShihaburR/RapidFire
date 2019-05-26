import processing.sound.*; // import sound library
SoundFile bang;
int menu = 0;
PImage img;
/*
0 main menu
 1 play game
 2 end game
 */
float centreX, centreY;
float sizeX, sizeY;
int Score = 0;
float i=0;
int r= 0;
boolean GameOver = false;
Button Play;
Button Exit;
Timer CountDown = new Timer(30);
void setup() {
  fullScreen();
  img = loadImage("MainMenu.jpg");
  centreX = width/2;
  centreY = height/2;
  sizeX = 50;
  sizeY = 50;
  Play = new Button((width/2) - 220, (height/2), 425, 125, "Play Game");
  Exit = new Button((width/2) -220, (height/2) + 200, 425, 125, "Exit");
  bang = new SoundFile(this, "Bang.wav");
}

void draw() {
  switch(menu)
  {
  case 0: //main menu
    {
      tint(255, 128); // transparency 
      image(img, 0, 0); // displays image
      textSize(100);
      fill(255, 255, 255); // white text
      textAlign(CENTER, CENTER);
      text("Rapid Fire", (width/2), 100); // position & display of title
      Play.update();
      Play.render();
      Exit.update();
      Exit.render();
      if (Play.isClicked())
      {
        menu = 1;
      }
      if (Exit.isClicked())
      {
        exit();
      }
    }
    break;
  case 1: //Play game
    {
      background(100+(i/4), i, r);
      CountDown.countDown();
      fill(0);
      textAlign(CENTER);
      text("Timer: " + int(CountDown.getTime()), width/2, 100);
      fill(255, random(255)/2, 0);
      ellipse(centreX, centreY, sizeX, sizeY);
      i=i+1;
      if (CountDown.Time <= 0.9)
      {
        menu = 2;
      }

      if (CountDown.Time <= 20.9)
      {
        i= i-1;
        r++;
      }
    }
    break;
  case 2: //End game
    {
      background(0, 0, 255);
      fill(0);
      textSize(80);
      textAlign(CENTER, CENTER);
      text("Your Score was: " + Score, width/2, height/2);
      text("Press any Key to go back to Main Menu", width/2, height/2 + 200);

      if (keyPressed)
      {
        menu = 0;
      }
    }
    break;
  }
}
void mousePressed()
{
  bang.play();
  if (dist(mouseX, mouseY, centreX, centreY) < (sizeY / 2)) 
  {
    centreX = random(0, width);
    centreY = random(0, height);
    sizeX = random(50, 200);
    sizeY = sizeX;
    Score++;
  }
}
