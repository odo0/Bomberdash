/*
Summary:          The base class for every object
*/

class Object
{
  /*
  Summary:        Constructor for the object.
  Parameters:
    x:            X-coordinates
    y:            Y-Coordinates
    imageFile:    Source of the spritesheet/image
    name:         Name of the object
  */
  Object(float x, float y, String imageFile, String name){
    
    x_ = x; //<>//
    y_ = y;
    imageFile_ = imageFile;
    name_ = name;
    sprite_ = new Sprite(x_,y_, imageFile_, 32, 32);

  }
  
   /*
  Summary:       Updates the sprite of the object.
  */
  void update(){
    sprite_.setPosition(x_,y_);
    sprite_.update();
    
  }
  
  /*
  Summary:       Gets the sprite of the object.
  */  
  Sprite getSprite(){
    return sprite_;
  }
  
  /*
  Summary:       Sets the new x-coordinate for the object.
  Parameters:
    x:           New x-coordinate
  */ 
  void setX(float x){
    x_ = x;
  }
  
  /*
  Summary:       Gets the x-coordinate of the object.
  */
  float getX() {
    return x_;
  }
  
  /*
  Summary:       Sets the new y-coordinate for the object.
  Parameters:
  y:             New y-coordinate
  */
  void setY(float y){
    y_= y;
  }
 
  /*
  Summary:       Gets the y-coordinate of the object.
  */
  float getY(){
    return y_;
  }
  
  /*
  Summary:       Gets the image of the object.
  */
  String getImage(){
    return imageFile_;
  }
  /*
  Summary:       Sets the new name for the object.
  Parameters:
    name:       New name
  */
  void setname(String name){
    name_ = name;
  }
  
  /*
  Summary:       Gets the name of the object.
  */
  String getname(){
    return name_;
  }

  // Former Private section
  
  private float x_;
  private float y_;
  private String imageFile_;
  private String name_;
  private Sprite sprite_;

}
//-------------------------------------------------------------------------------------------


//-------------------------------------------------------------------------------------------
/*
Summary:          The base class for the Creature and Ground objects, extends Object class.
*/
class HPObject extends Object
{
  
  /*
  Summary:        Constructor for the object.
  Parameters:
  x:              X-coordinates
  y:              Y-Coordinates
  imageFile:      Source of the spritesheet/image
  name:           Name of the object
  hp:             Hit points of the object
  */
  HPObject(float x, float y, String imageFile, String name, int hp){

    // Calls the constructor of the parent class (super class).
    super(x,y,imageFile,name);
    hp_ = hp;
    /*x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  

  /*
  Summary:        Kills the object.
  */
  void die(){
    setHP(0);
  
  }
  
  /*
  Summary:        Decreases the HP of the object.
  */
  void damageObject(int d) {
    
    hp_ -= d;
    if(hp_ <= 0){
      die();
    }
  }
  
  /*
  Summary:        Increases the HP of the object.
  */
  void healObject(int h){
    hp_ += h;
  }
  
  /*
  Summary:        Sets the HP of the object.
  Parameters:
  hp:             Hit points of the object
  */
  void setHP(int hp){
    hp_ = hp;
    
    if(hp_ <= 0){
      die();
    }
  }
  
  /*
  Summary:        Gets the HP of the object.
  */
  int getHP(){
    return hp_;
  }
  
  
  // Private section
   private int hp_;
   /*private float x_;
   private float y_;
   private String imageFile_;
   private String name_;*/
 
  
}