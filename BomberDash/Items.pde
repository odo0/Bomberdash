/*
Summary:         The base class for different item types, extends Object.
*/
class Item extends Object
{
  Item(float x, float y, String imageFile, String name){

    super(x,y,imageFile,name);
   /* x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  
  // Private section
   /*private float x_;
   private float y_;
   private String imageFile_;
   private String name_;*/
 
  
}

//---------------------------------------------------------------------------

/*
Summary:           The class that implements the bombs, extends Item
*/
class Bomb extends Item
{
  /*
  Summary:        Constructor for the object.
  Parameters:
  x:              X-coordinates
  y:              Y-coordinates
  imageFile:      Source of the spritesheet/image
  name:           Name of the object
  radius:         Blast radius of the object
  */
  Bomb(float x, float y, String imageFile, String name, int radius){

    super(x,y,imageFile,name);
    radius_ = radius;
    /*x_ = x;
    y_ = y;
    name_ = name;
    imageFile_ = imageFile;*/
  }
  

  /* 
  Summary:      Sets the blast radius of the object.
  Parameters:
  radius:       Blast radius of the object
  */
  void setRadius(int radius){
    radius_ = radius;
  }
  
  /*
  Summary:      Gets the blast radius of the object.
  */
  int getRadius(){
    return radius_;
  }

  // Private section
   private int radius_;
   /*private float x_;
   private float y_;
   private String imageFile_;
   private String name_;*/
  
}