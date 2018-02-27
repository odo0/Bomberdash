/*
Summary:      The base class for Player and Enemy classes, extends HPObject.
*/


class Creature extends HPObject
{
  /*
  Summary:        Constructor for the object.
  Parameters:
  x:              X-coordinates
  y:              Y-coordinates
  imageFile:      Source of the spritesheet/image
  name:           Name of the object
  hp:             Hit points of the object
  speed:          Speed of the object
  */
  Creature(float x, float y, String imageFile, String name, int hp, float speed){

    super(x,y,imageFile,name,hp);
    speed_ = speed;
    /*hp_ = hp;
    x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  

  /*
  Summary:        Moves the object to the new coordinates.
  Parameters:
  x:              new X-coordinates
  y:              new Y-coordinates
  */
  void move(float x, float y){
    setX(x);
    setY(y);
  
  }
  
  /*
  Summary:        Sets the speed of the object.
  Parameters:
  speed:          Speed of the object
  */
  void setSpeed(float speed){
   speed_ = speed; 
  }
  
  /*
  Summary:        Gets the speed of the object.
  */
  float getSpeed(){
   return speed_; 
  }
  
  // Private section
  
  private float speed_;
  /*private int hp_;
  private float x_;
  private float y_;
  private String imageFile_;
  private String name_;*/
  
}

//-------------------------------------------------------------------------------------------

/*
Summary:      The class that implements controllable player figure, extends Creature.
*/
class Player extends Creature
{
  /*
  Summary:        Constructor for the object.
  Parameters:
  x:              X-coordinates
  y:              Y-coordinates
  imageFile:      Source of the spritesheet/image
  name:           Name of the object
  hp:             Hit points of the object
  speed:          Speed of the object
  */
  Player(float x, float y, String imageFile, String name, int hp, float speed){

    super(x,y,imageFile,name,hp,speed); //<>// //<>//
    inventory_ = new Item[1];
    /*speed_ = speed;
    hp_ = hp;
    x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  
  /*
  Summary:      Adds an item to inventory ( doesn't work at the moment)
  */
 /* void addItem(Item item){
    inventory_ = append(inventory_, item);
  }*/

  // Private section
  Item[] inventory_;
  /*private float speed_;
  private int hp_;
  private float x_;
  private float y_;
  private String imageFile_;
  private String name_;*/
 
  
}
//-------------------------------------------------------------------------------------------

/*
Summary:        The base class for the different enemy types, extends Creature.
*/
class Enemy extends Creature
{
  /*
  Summary:        Constructor for the object.
  Parameters:
  x:              X-coordinates
  y:              Y-coordinates
  imageFile:      Source of the spritesheet/image
  name:           Name of the object
  hp:             Hit points of the object
  speed:          Speed of the object
  damage:         Damage of the object
  */
  Enemy(float x, float y, String imageFile, String name, int hp, float speed, int damage){

    super(x,y,imageFile,name,hp,speed);
    damage_= damage;
    /*speed_ = speed;
    hp_ = hp;
    x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  
  /*
  Summary:        Sets the damage of the object.
  Paramaters:
  damage:        Damage of the object
  */
  void setDamage(int damage){
    damage_ = damage; 
  
  }
  /*
  Summary:        Gets the damage of the object.
  */
  int getDamage(){
    return damage_;
  }
  
  // Private section
  
  private int damage_;
  /*private float speed_;
  private int hp_;
  private float x_;
  private float y_;
  private String imageFile_;
  private String name_;*/
  
}