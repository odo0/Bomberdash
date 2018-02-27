//determines the state of the game e.g. title screen, menu, running etc.
//0 = title screen ; 1 = name entry ; 2 = name entry ; 3 game level
int gameState = 0;
//used for checking how many inputs have been made in the name entry
int keyPressCounter = 0;

//test level coordinates for the ball
int xPos = 16;
int yPos = 16;

//A level
 Map level1 = null; //<>// //<>//

//used for getting name input keys
char lastKey = ' ';

//used for checking whether the user has entered a name or not
boolean nameExists = false;
boolean nameTyped = false;

//used for getting and storing player inputted characters
StringBuilder name = new StringBuilder(); 
String playerName;


void setup() {
       size(800, 640);
       stroke(255);
       background(192, 64, 0);
       

       //initializes the title screen
       background(0);
       fill(255,255,255);
       textSize(32);
       rect(100, 50, 400, 200);
       text("Press space to begin!",150,300);
       fill(255,0,0);
       textSize(100);
       text("BOMBER",105,130);
       text("DASH!!!",110,220);
       fill(255,255,255);
       textSize(10);
       text("Copyright: Aku Industries",400,580);
       
       level1 = new Map(20, 25);

}

void draw() {
     //line(150, 25, mouseX, mouseY);
     if(gameState == 0){
       titleScreen();
     }
     else if(gameState == 1){
       nameEntry();
     }
     else if(gameState == 2){
       storyScreen();
     }
     
     else if(gameState == 3){
       testLevel();
       level1.getScene().drawScene();
       level1.update();
     }
     else{
       background(192, 64, 0);
       

     }



}    


//this function is called every time a key is pressed
//it is used for moving the game character, entering player name and pausing the game
void keyPressed(){
  if (key == ENTER && gameState == 3){
   if(looping){
     pause();
    noLoop();
   }
   else{
     loop();
   }
  }
  //SPACE IS BOMB
  else if(key == ' ' && gameState == 0){
    gameState = gameState + 1;
  }
  else if(key == ' ' && gameState == 1 && nameExists == true){
    gameState = gameState + 1;
    loop();
  }
  else if(key == ' ' && gameState == 2){
    gameState = gameState + 1;
  }
  else if(key==' ' && gameState == 3){
    //BOMB();
  }
   else if(keyCode==UP && looping){
    UP();
 //<>//
  }
  else if(keyCode== DOWN && looping){
    DOWN();

  }
  else if(keyCode== LEFT & looping){
    LEFT();
  }
  else if(keyCode==RIGHT & looping){
    RIGHT();
  }  
}

//prints the pause text on screen
void pause(){
  textSize(32);
  text("PAUSE",350,300);
}

//prints the title screen on screen
void titleScreen(){
   background(0);
   fill(255,255,255);
   textSize(32);
   rect(64, 64, 672, 300);
   textSize(64);
   text("Press space to begin!",70,420);
   fill(255,0,0);
   textSize(150);
   text("BOMBER",105,200);
   text("DASH!!!",110,320);
   fill(255,255,255);
   
}
//placeholder function for asking the name of the player
//takes keyboard inputs and makes a string out of them
void nameEntry(){
  background (0);
  textSize(60);
  playerName = name.toString();
  text("Please enter your name", 64,128);
  text("When you are done", 128, 550); 
  text("press enter",240, 612);
  text(playerName,128,256);
  if(keyPressed == true){
    if(key == ENTER && nameTyped == true){
      nameExists = true;
      background(0);
      //String playerName = name.toString();
      text("Well hello there,",150,200);
      textSize(64);
      text(playerName,150,300);
      textSize(32);
      text("Press space to start ", 150, 600);
      text("your wonderful adventure!!!",150,630);
      playerName = name.toString();
      noLoop();
    }
    
    else if(key == BACKSPACE && keyPressCounter > 0){
      keyPressed = false;
      name.setLength(keyPressCounter -1);
      keyPressCounter = keyPressCounter -1;
    }
    
    else if(key != ' ' && key != ENTER && key != BACKSPACE && key != CODED && key != TAB && keyPressCounter < 10){
      keyPressed = false;
      lastKey = key;
      name.append(lastKey);
      nameTyped = true;
      keyPressCounter = keyPressCounter + 1;
    }
    
  }
}
//prints out the story of the game on screen
void storyScreen(){
  background(0);
  text("This is a story about Boulderman", width/5, height/6);
  textSize(16);
  text("One day Boulderman woke up to find that he was surrounded by dirt and rock.", width/10, 150);
  text("This was rather strange considering that previously he had never seen these", width/10, 182);
  text("things in his life. After coming to terms with this sudden new environment, ", width/10, 214);
  text("he started searching the area only to find out the he wasn't the only one there...", width/10, 246);
  textSize(32);
  text("Press space to continue", 150, 600);
}

//showcases the controls of the game
void controlScreen(){
}

//pops when the player character loses all of his lives
void gameOverScreen(){
}

//after the game is over a score board is shown
void scoreBoardScreen(){
}

//PLACEHOLDER, PLEASE DELETE WHEN FIRST LEVEL ACTUALLY PLAYABLE
void testLevel(){
  /*background(139,69,19);
  fill(0,0,255);
  ellipse(xPos,yPos,32,32);
  stroke(255,255,255);
  for(int i=0; i<width; i+=32){
   line(i,0,i,height);
 }
 for(int w=0; w<height; w+=32){
   line(0,w,width,w);
 }*/
 
 //Another test:
 
 
 //Map level1 = new Map(20, 25);
 //level1.getScene().drawScene();
}

//moves PC up one tile
void UP(){
  yPos = yPos -32;
  level1.playerUp();
}

//moves PC down one tile
void DOWN(){
  yPos = yPos +32;
  level1.playerDown();
  level1.update();
}

//moves PC left one tile
void LEFT(){
  xPos = xPos -32;
  level1.playerLeft();
}

//moves PC right one tile
void RIGHT(){
  xPos = xPos +32;
  level1.playerRight();
}