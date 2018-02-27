/*
  Class:
    GraphicObject
  
  Declaration:
    GraphicObject (float x, float y)
  
  Summary:
    The most basic graphics object, from which ohters are derivered
*/
abstract class GraphicObject
{
  
  GraphicObject(float x, float y)
  {
    x_ = x;
    y_ = y;
    visible_ = true;
  }
  
  /*Summary: Updates the sprites internal systems. Needs to be implemented by derivatives
  */
  abstract void update();
  
  /*
  Summary:   Sets the new location for the sprite
  Parameters:
    x:       New x-coordinates
    y:       New y-coordinates
  */
  void setPosition(float x, float y)
  {
    x_ = x;
    y_ = y;
  }
  
   /*
  Summary:   Sets the new x-coordinate for the sprite
  Parameters:
    x:       New x-coordinates
  */
  void setX(float x)
  {
    x_ = x;
  }
  
  /*
  Summary:   Sets the new y-coordinate for the sprite
  Parameters:
    y:       New y-coordinates
  */
  void setY(float y)
  {
    y_ = y;
  }
  
  /*
  Summary:   Gets the X-Coordinates
  Returns:  X-coordinates
  */
  float getX()
  {
    return x_;
  }
  
  /*
  Summary:   Gets the Y-Coordinates
  Returns:  Y-coordinates
  */
  float getY()
  {
    return y_;
  }
  
  void hide()
  {
    visible_ = false;
  }
  
  void show()
  {
    visible_ = true;
  }
  
  boolean getVisible()
  {
    return visible_;
  }
  
  /*************************************************************
  *                                                            *
  *                       PRIVATE                              *
  *                                                            *
  **************************************************************/
  
  private float x_;
  private float y_;
  private boolean visible_;
  
}

/*
  Class:
    Scene
  
  Declaration:
    Scene()
  
  Summary:
    Used to draw a scene. This contains all the graphical object that are part of that scene.
*/
class Scene
{
  Scene()
  {
    layers = new GraphicObject[20][0];
  }
  
  /*
  Summary:  Draws the scene and all objects added to it.
  */
  void drawScene()
  {
    //The layers in INVERSE order.
    for(int i = layers.length-1; i >= 0; i--)
    {
      for(int j = 0; j < layers[i].length; j++)
      {
        if(layers[i][j] != null) //Make sure we are not accidentally trying to update to null
        {
          layers[i][j].update();
        }
      }
    }
  }
  
  /*
  Summary:  Adds a new object to the scene on the default layer
  Parameters:
    t:      New object to be added
  */
  void addObject(GraphicObject t)
  {
    
    int position = findEmpty(0);
    
    //If there was no free position, increase size of array and search again
    if(position < 0)
    {
      increaseLayerMembers(0);
      position = findEmpty(0);
    }
    
    layers[0][ position ] = t;
    
  }
  
  /*
  Summary:  Adds a new object to the scene on the given layer
  Parameters:
    t:      New object to be added
    layer:  On what layer the sprite is added. Max layer is layer 20
  */
  void addObject(GraphicObject t, int layer)
  {
    //This to prevent outside bounds errors. Layer 20 is the max, so if you try to put beyond that, stuff gets placed to layer 20
    if(layer > layers.length)
    {
      layer = layers.length - 1;
    }
    
    int position = findEmpty(layer);
    
    //If there was no free position, increase size of array and search again
    if(position < 0)
    {
      increaseLayerMembers(layer);
      position = findEmpty(layer);
    }
    
    layers[layer][ position ] = t;
  }
  
  /*
  Summary:  Removes the object from the scene
  Parameters:
    t:      Object to be removed
  */
  void removeObject(GraphicObject t)
  {
    for(int i = 0; i < layers.length; i++)
    {
      for(int j = 0; j < layers[i].length; j++)
      {
        if(t == layers[i][j])
        {
          layers[i][j] = null;
          //No stopping here, keep going in case we have accidentally added the same sprite more than once
        }
      }
    }
  }
  
  /********************************************
                PRIVATE SECTION
  ********************************************/
  
  private GraphicObject[][] layers;
  
  //Used to increase the size of layer
  void increaseLayerMembers(int layer)
  {
    GraphicObject[] copy = layers[layer];
    
    layers[layer] = new GraphicObject[ layers[layer].length + 1 ];
    
    for(int i = 0; i < copy.length; i++)
    {
      layers[layer][i] = copy[i];
    }
    
  }
  
  //Finds empty place on layer. If there is no empty place, returns -1
  int findEmpty(int layer)
  {
    for(int i = 0; i < layers[layer].length; i++)
    {
      if(layers[layer][i] == null)
      {
        return i;
      }
    }
    return -1;
  }
  
}