class Button
{
  boolean Pressed = false, Clicked = false;
  float xPos = 0, yPos = 0;
  float Width = 0, Height = 0;
  String Text;

  Button(int x, int y, float w, float h, String t)   // constructor for button
  {
    xPos = x;
    yPos = y;
    Width = w;
    Height = h; 
    Text = t;
  }
  void update() {
    if (mousePressed == true && mouseButton == LEFT && Pressed == false)
    {
      Pressed = true;
      if (mouseX>= xPos && mouseX<= xPos + Width && mouseY >= yPos && mouseY <= yPos + Height)
      {
        Clicked = true;
      }
    } else
    {
      Clicked = false;
      Pressed = false;
    }
  }
  void render()
  {
    fill(#E8E8E8); // buttons will be grey 
    rect(xPos, yPos, Width, Height); // xPos and yPos is given from main tab while  
    // the last two variables are to keep buttons the same dimensions

    fill(0);
    textSize(75);
    textAlign(CENTER, CENTER);
    text(Text, xPos+(Width/2), yPos+(Height/2));
  }

  boolean isClicked() // use to validate if button is clicked
  {
    return Clicked;
  }
}
