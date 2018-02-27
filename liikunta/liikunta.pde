PImage sprite;
PImage sprite2;
int xPos;                      //Position of the ball
int yPos;
int speed=1;                   //How fast is it moving?
int xDir=1;                    //what direction is the ball going?
int score=0;                   //Inital score
int lives=5;                   //Number of lives you start with
boolean dead=false;            //Have you lost yet?
int w = 50;
int i = 50;

void setup()                   //Runs once when program launches
{
  size (400,400);
  sprite = loadImage("pixel.gif");
  sprite2 = loadImage("pahis.gif");
  smooth();
  xPos=190;   //Centers our ball
  yPos=190;
  fill(255,0,0);               //Makes the ball and text green
  textSize(13);                //Sets the size of our text
}

void draw(){
  background(255);
  fill(255,0,0);
  ellipse(xPos,yPos,20,20);
  image(sprite,0,0);
  image(sprite2,360,360);
  stroke(255,0,0);
  for(int i=0; i<width; i+=20){
   line(i,0,i,height);
 }
 for(int w=0; w<height; w+=20){
   line(0,w,width,w);
 }

  if(yPos <= 10 || yPos >= 390 || xPos <= 10 || xPos >= 390){
    die();
  }
}
 
void keyPressed(){
  if (key == ENTER && dead == false){
   if(looping){
     pause();
    noLoop();
   }
   else{
     loop();
   }
  }
  else if(key == ENTER && dead == true){
    xPos=190;   //Centers our ball
    yPos=190;
    fill(255,0,0);               //Makes the ball and text green
    textSize(13);
    dead = false;
    loop();
   }
  else if(key=='w'){
    UP();
  }
  else if(key=='s'){
    DOWN();
  }
  else if(key=='a'){
    LEFT();
  }
  else if(key=='d'){
    RIGHT();
  }
  else if(key==' '){
    JUMP();
  }
}

void UP(){
  yPos = yPos -20;
}
void DOWN(){
  yPos = yPos +20;
}
void LEFT(){
  xPos = xPos -20;
}
void RIGHT(){
  xPos = xPos +20;
}
void JUMP(){
  yPos = yPos - 60;
}

//prints the pause text on screen
void pause(){
  textSize(32);
  fill(0,0,255);
  text("PAUSE",250,300);
}
void die(){
  background(0);
  dead = true;
  textSize(32);
  fill(0,0,255);
  text("YOU ARE DEAD",100,200);
  text("press enter to continue",25,100);
  noLoop();
}