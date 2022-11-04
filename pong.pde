import processing.sound.*;

puck pu;
Paddle left;
Paddle right;
SoundFile ding;

int leftScore=0;
int rightScore=0;
void setup()
{
  size(600,400);
   pu=new puck(); 
    ding=new SoundFile(this,"ding.mp3");
    //tap=new SoundFile(this,"tapp.mp3");
   left =new Paddle(true);
   right=new Paddle(false);
}
void draw()
{
  background(0);
 pu.update();

 pu.checkPaddleRight(right);
 pu.checkPaddleLeft(left);
 pu.edge(); 
 pu.show();
 left.update();
 right.update();
 fill(255);
 textSize(32);
 text(leftScore,32,40);
 text(rightScore,width-64,40);
 left.show();
 right.show(); 
 // to check if left side wins condition
 if(leftScore==10)
 {
   fill(255);

   textSize(28);
   text("Player left wins press n to reset",58,height/2+40);
   //textAlign(CENTER);
   pu.xspeed=0;
   pu.yspeed=0;

 }// to check if right side wins
 else if(rightScore==10)
 {
   fill(255);

 
  // textAlign(CENTER);
   textSize(28);
   text("Player Right wins press n to reset",58,height/2+40);
   pu.xspeed=0;
   pu.yspeed=0;
   
 }
 

 //if(leftScore==11 || rightScore==11)
 //{
  // delay(500);
  // reset();
// }
 
  }
  void keyReleased(){
  left.move(0);
  right.move(0);
  }
  
  // reset function defined
  void reset()
  {
    leftScore=0;
    rightScore=0;
    pu.reset();
    //this is the same reset function called from puck
  }
    
  
  void keyPressed(){
    if(key=='w'){
      left.move(-5);
    }
    else  if(key=='s')
    { left.move(5);
    }
    
     if(key=='o'){
      right.move(-5);
    }
    else  if(key=='l')
    { right.move(5);
    }
    
    if(key=='n')
    {
     reset(); 
     //when n pressed it is reset
    }
  }
