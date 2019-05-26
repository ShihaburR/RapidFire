class Timer
{
  float Time; 

  Timer(float set) // constructor for Timer
  {
    Time = set;
  }
  float getTime() // returns current Time
  {
    return(Time);
  }
  void setTime (float set) // sets the Timer based on temp variable (60 secs)
  {
    Time = set;
  }
  void countDown() //counts down so its an actual timer
  {
    Time -= 1/frameRate;
  }
}
