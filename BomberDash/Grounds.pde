/*
Summary:      The base class for the different ground types, extends HPObject.
*/
class Ground extends HPObject
{
  /*
  Summary:        Constructor for the object.
  Parameters:
  x:              X-coordinates
  y:              Y-coordinates
  imageFile:      Source of the spritesheet/image
  name:           Name of the object
  hp:             Hit points of the object
  destructible:   Is the object destructible
  */
  Ground(float x, float y, String imageFile, String name, int hp, boolean destructible){

    super(x,y,imageFile,name,hp);
    destructible_ = destructible;
    /*hp_ = hp;
    x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  
  /*
  Summary:        Gets the value of destructible
  */
  boolean isDestroyable(){
    return destructible_;
  }
  
   /*
  Summary:        Sets the value of destructible
  */
  void setDestructible(boolean destructible){
    destructible_ = destructible;
  }

  // Private section
   private boolean destructible_;
   /*private int hp_;
   private float x_;
   private float y_;
   private String imageFile_;
   private String name_;*/
  
}