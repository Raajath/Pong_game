 //class that defines ball
class puck{
  float x=width/2;
  float y=height/2;
  float xspeed;
  float yspeed  ;
  
  float r=12;

puck()
{
reset();
  
}
void show()
{
 fill(255);
 ellipse(x,y,r*2,r*2);
 
}
//move the ball
void update()
{
  x=x+xspeed;
  y=y+yspeed;
}

void reset()
{
  x=width/2;
  y=height/2;
    float angle =random(-PI/4,PI/4);
   // angle=0;
  xspeed=5*cos((angle));
  yspeed=5*sin((angle));
  if(random(1)<0.5)
  {
    xspeed*=-1;
  }
  
}//function thatmakes the ball rebound in tyhe bottom and top and also resets the game when we go left or right
void edge()
{
  if(y-r<0 || y+r>height)
  {
    yspeed *=-1;

  }
  if(x-r>width)
  {
    ding.play();
    leftScore++;
    reset();
    
    
  }
  if(x+r<0)
  { ding.play();
    rightScore++;
    reset();
    
  }
 // ding.pause();
}
void checkPaddleRight(Paddle p)
{
 
  if(x+r>p.x -p.w/2 && y<p.y+p.h/2 && y> p.y-p.h/2)
  {
    if(x+r>p.x)
    {
      //float diff =y-(p.y-p.h/2);
      
     // float angle=map(diff,0,p.h,-135,135);
      //xspeed=5*cos(radians(angle));
      //yspeed=5*sin(radians(angle));
      
    xspeed*=-1;
    //x=p.x-p.w/2-r;
    
    }
  }
}
void checkPaddleLeft(Paddle p)
{
 
  if(x-r<p.x -p.w/2 && y<p.y+p.h/2 && y> p.y-p.h/2)
  {
    if(x-r<p.x)
    {
     //    float diff =y-(p.y-p.h/2);
         
      //float angle=map(diff,0,p.h,-45,45);
      //xspeed=5*cos(radians(angle));
      //yspeed=5*sin(radians(angle));
        //  x=p.x+p.w/2+r;
          
    xspeed*=-1;
    }
  }
}

}
