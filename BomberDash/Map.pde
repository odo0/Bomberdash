//Summary: A single square on a Map. 

class MapSquare {
  Object objectOnSquare_; //<>// //<>// //<>// //<>// //<>//
  Object objectInFront_;
  Player player_;
  Ground ground_;
  int x_;
  int y_;
  
  /*
  Summary:        Constructor for MapSquare
  Parameters:     x is the x coordinate of the square
                  y is the y coordinate of the square
  */
  
  MapSquare(int x, int y){
    x_ = x;
    y_ = y;
  }
  
  /*
  Summary:        Updates the MapSquare and what is inside it
  */
  
  void update(){
    if (objectOnSquare_ != null){
      objectOnSquare_.update();
    }
    if (objectInFront_ != null){
      objectInFront_.update();
    }
    if (player_ != null){
      player_.update();
    }
    if (ground_ != null){
      ground_.update();
    }
  }
  
  void setPlayerToSquare(Player player){
    player_ = player;
  }
  
  void setObjectToSquare(Object object){
    objectOnSquare_ = object;
  }
  
  void setObjectToFront(Object object){
    objectInFront_ = object;
  }
  
  Player getPlayerOnSquare(){
    return player_;
  }
  
  Object getObjectOnSquare(){
    return objectOnSquare_;
  }
  
  Object getObjectInFront(){
    return objectInFront_;
  }
   //<>// //<>// //<>//
  void setGround(Ground ground){
    ground_ = ground;
  }
  
  Ground getGround(){
    return ground_;
  }
  
}
 //<>// //<>//
class Map {
  MapSquare[][] mapSquareArray; //<>//
  Scene scene_;
  Player player_;
  Ground bedrock_;
  Ground dirt_;
  //for testing and early versions, is probably removed when the rest of the program changes:
  //Sprite playerSprite_;
  int squareSize_ = 32;
  
  
  
  /*
  Summary:        Constructor for Map
  Parameters:     width is the width of the map
                  height is the height of the map
  */
  
  Map(int height, int width){
    mapSquareArray = new MapSquare[width][height];
    
    for (int i = 0; i < width; i = i + 1){
      for (int j = 0; j < height; j = j + 1){
        mapSquareArray[i][j] = new MapSquare(i,j);
      }
    }
    scene_ = new Scene();
    
    initialize();
  }
  
  /*
  Summary:        Updates all the MapSquares in the Map
  */
  
  void update(){
    
    //Checks if mapSquareArray is empty
    if (mapSquareArray.length == 0){
      return;
    }
    
    // Calls the update function in every mapSquare
    for (int i = 0; i < mapSquareArray.length; i = i + 1){
      for (int j = 0; j < mapSquareArray[0].length; j = j + 1){
        mapSquareArray[i][j].update();
      }
    }
  }
  
  /*
  Summary:        Initializes the Map. This is where the Map is made into a level.
  */
  
  void initialize(){
    player_ = new Player(squareSize_, squareSize_, "/data/BoulderMan.png", "player", 100, 1);
    mapSquareArray[1][1].setPlayerToSquare(player_);
    
    player_.setY(squareSize_);
    player_.setX(squareSize_);


    //change this when objects return sprites
    //playerSprite_ = new Sprite(1*squareSize_,1*squareSize_,"/data/BoulderMan.png",19, 27);
    //scene_.addObject(playerSprite_,1);
    scene_.addObject(player_.getSprite(), 1);
    
    //add diamonds:
    mapSquareArray[5][5].setObjectToSquare(new Item(squareSize_*5, squareSize_*5, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);
    
    mapSquareArray[10][3].setObjectToSquare(new Item(squareSize_*10, squareSize_*3, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);
    
    mapSquareArray[20][15].setObjectToSquare(new Item(squareSize_*20, squareSize_*15, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);
    
    mapSquareArray[19][8].setObjectToSquare(new Item(squareSize_*19, squareSize_*8, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);
    
    mapSquareArray[23][1].setObjectToSquare(new Item(squareSize_*23, squareSize_*1, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);
    
    mapSquareArray[15][15].setObjectToSquare(new Item(squareSize_*15, squareSize_*15, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);
    
    mapSquareArray[3][17].setObjectToSquare(new Item(squareSize_*3, squareSize_*17, "/data/Diamond.png", "Diamond"));
    scene_.addObject(mapSquareArray[5][5].getObjectOnSquare().getSprite(),10);

    
    //add background
    scene_.addObject(new Sprite(0,0,"/media/background1.JPG"),19);
    
  /*  
    for (int i = 0; i < mapSquareArray.length; i++){
      for (int j = 0; j < mapSquareArray[0].length; j = j + mapSquareArray[0].length - 1 ){
        bedrock_ = new Ground(squareSize_ * i, squareSize_ * j, "/data/Bedrock.png", "bedrock", 100, false);
        mapSquareArray[i][j].setObjectToFront(bedrock_);
        
      }
    }
    for (int j = 1; j < mapSquareArray[0].length; j++){
      for (int i = 0; i < mapSquareArray.length; i = i + mapSquareArray.length - 1 ){
        bedrock_ = new Ground(squareSize_ * i, squareSize_ * j, "/data/Bedrock.png", "bedrock", 100, false);
        mapSquareArray[i][j].setObjectToFront(bedrock_);
        
      }
    }
    */
   for ( int i = 0; i < mapSquareArray.length; i++){
     for (int j = 0; j < mapSquareArray[0].length; j++){
      if( i != 1 || j !=1){
        if(i == 0 || j == 0 || i == mapSquareArray.length -1 || j == mapSquareArray[0].length -1){
           bedrock_ = new Ground(squareSize_ * i, squareSize_ * j, "/data/Bedrock.png", "bedrock", 100, false);
           mapSquareArray[i][j].setGround(bedrock_);
        }
        else{
          dirt_ = new Ground(squareSize_ * i, squareSize_ * j, "/data/DirtBlock.png", "dirt", 100, true);
          mapSquareArray[i][j].setGround(dirt_);
        }
     }
    }
   }
 }
  Scene getScene(){
    return scene_;
  }
  
  
  void playerUp(){
    for (int i = 0; i < mapSquareArray.length; i++){
      for (int j = 0; j < mapSquareArray[0].length; j++){
        if(mapSquareArray[i][j].getPlayerOnSquare() != null){
          //Player is on this square
          if(j > 0){
            //There is a next square
            if(mapSquareArray[i][j-1].getGround() == null){
              //Next square doesn't have anything to stop the player
              mapSquareArray[i][j-1].setPlayerToSquare(player_); //<>//
              mapSquareArray[i][j].setPlayerToSquare(null);
              player_.setY((j - 1)*squareSize_);
              player_.update();
              
              MapSquare currentSquare = mapSquareArray[i][j-1];
              if (currentSquare.getObjectOnSquare() != null){
                if(currentSquare.getObjectOnSquare().getname() == "Diamond"){
                  //add point adding here
                  scene_.removeObject(currentSquare.getObjectOnSquare().getSprite());
                  currentSquare.setObjectToSquare(null);
                }
              }
              return;
            }
            if(mapSquareArray[i][j-1].getGround().isDestroyable() == true){
              //scene_.removeObject(mapSquareArray[i][j-1].getGround().getSprite());
              mapSquareArray[i][j-1].setGround(null);
              return;
            }
          } //<>//
        }
      }
    }
  }
  
  void playerRight(){
    for (int i = 0; i < mapSquareArray.length; i++){
      for (int j = 0; j < mapSquareArray[0].length; j++){
        if(mapSquareArray[i][j].getPlayerOnSquare() != null){
          //Player is on this square
          if(i+1<mapSquareArray.length){
            //There is a next square
            if(mapSquareArray[i+1][j].getGround() == null){
              //Next square doesn't have anything to stop the player
              mapSquareArray[i+1][j].setPlayerToSquare(player_);
              mapSquareArray[i][j].setPlayerToSquare(null);
              player_.setX((i + 1)*squareSize_);
              player_.update();
              
              MapSquare currentSquare = mapSquareArray[i+1][j];
              if (currentSquare.getObjectOnSquare() != null){
                if(currentSquare.getObjectOnSquare().getname() == "Diamond"){
                  //add point adding here
                  scene_.removeObject(currentSquare.getObjectOnSquare().getSprite());
                  currentSquare.setObjectToSquare(null);
                }
              }
              return;
            }
             if(mapSquareArray[i+1][j].getGround().isDestroyable() == true){
               //scene_.removeObject(mapSquareArray[i+1][j].getGround().getSprite());
              mapSquareArray[i+1][j].setGround(null);
              return;
            }
          }
        }
      }
    }
  }
  
  void playerLeft(){
      for (int i = 0; i < mapSquareArray.length; i++){
      for (int j = 0; j < mapSquareArray[0].length; j++){
        if(mapSquareArray[i][j].getPlayerOnSquare() != null){
          //Player is on this square
          if(i > 0){
            //There is a next square
            if(mapSquareArray[i-1][j].getGround() == null){
              //Next square doesn't have anything to stop the player
              mapSquareArray[i-1][j].setPlayerToSquare(player_);
              mapSquareArray[i][j].setPlayerToSquare(null);
              player_.setX((i - 1)*squareSize_);
              player_.update();
              
              MapSquare currentSquare = mapSquareArray[i-1][j];
              if (currentSquare.getObjectOnSquare() != null){
                if(currentSquare.getObjectOnSquare().getname() == "Diamond"){
                  //add point adding here
                  scene_.removeObject(currentSquare.getObjectOnSquare().getSprite());
                  currentSquare.setObjectToSquare(null);
                }
              }
              return;
            }
             if(mapSquareArray[i-1][j].getGround().isDestroyable() == true){
                //scene_.removeObject(mapSquareArray[i-1][j].getGround().getSprite());
                mapSquareArray[i-1][j].setGround(null);
                return;
            }
          }
        }
      }
    }
  }
  
  void playerDown(){
    for (int i = 0; i < mapSquareArray.length; i++){ //<>//
      for (int j = 0; j < mapSquareArray[0].length; j++){
        if(mapSquareArray[i][j].getPlayerOnSquare() != null){
          //Player is on this square
          if(j+1<mapSquareArray[i].length){
            //There is a next square

            if(mapSquareArray[i][j+1].getGround() == null){
              //Next square doesn't have anything to stop the player
              mapSquareArray[i][j+1].setPlayerToSquare(player_);
              mapSquareArray[i][j].setPlayerToSquare(null);

              player_.setY((j + 1)*squareSize_);
              player_.update();
              
              MapSquare currentSquare = mapSquareArray[i][j+1];
              if (currentSquare.getObjectOnSquare() != null){
                if(currentSquare.getObjectOnSquare().getname() == "Diamond"){
                  //add point adding here
                  scene_.removeObject(currentSquare.getObjectOnSquare().getSprite());
                  currentSquare.setObjectToSquare(null);
                }
              }
              return;
            }      

             if(mapSquareArray[i][j+1].getGround().isDestroyable() == true){
              // scene_.removeObject(mapSquareArray[i][j+1].getGround().getSprite());
               mapSquareArray[i][j+1].setGround(null);
              return;
            }

          }
        }
      }
    }
  }
  
}