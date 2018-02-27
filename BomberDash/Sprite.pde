/*
  Class:
    Sprite
  
  Declaration:
    Sprite (float x, float y, String imageFile, int spriteWidth, int spriteHeight)
  
  Summary:
    Used to store sprites. Takes a sprite size and initial location, as well as the sprite sheet to use. This sprite sheet is then turned to frames, which can be turned into animations.
    With this, the user does not need to worry about nitty-gritty of splicing the animation. Instead, user can simply create a sprite, give it size, give it a sheet and then declare what
    frames are used for which animation
*/
class Sprite extends GraphicObject {
  
  //Public section
  /*
  Summary:        Constructor for the sprite. This one will generate a set of frames based on the given width and height.
  Parameters:
    x:            X-coordinates
    y:            Y-Coordinates
    imageFile:    Source of the spritesheet/image
    spriteWidth:  Width of the sprite.
    spriteHeight: Height of the sprite.
  */
  Sprite (float x, float y, String imageFile, int spriteWidth, int spriteHeight)
  {
    super(x, y);
    sheet_ = loadImage(imageFile); //Load sprite sheet
    width_ = spriteWidth;
    height_ = spriteHeight;
    setUpFrames();
    animations = new Animation[0]; //Set this up as empty for starters
    //Create "basic" animation with only 1 frame, the very first frame
    addAnimation("Basic", 0, 0);
    playAnimation("Basic");
  }
  
  /*
  Summary:        Constructor for the sprite. Uses the entire image as a one frame. Useful for images that lack animations
  Parameters:
    x:            X-coordinates
    y:            Y-Coordinates
    imageFile:    Source of the spritesheet/image
  */
  Sprite (float x, float y, String imageFile)
  {
    super(x,y);
    sheet_ = loadImage(imageFile); //Load sprite sheet
    width_ = sheet_.width;
    height_ = sheet_.height;
    setUpFrames();
    animations = new Animation[0]; //Set this up as empty for starters
    //Create "basic" animation with only 1 frame, the very first frame
    addAnimation("Basic", 0, 0);
    playAnimation("Basic");
  }
  
  void update()
  {
    if( !getVisible() )
    {
      return;
    }
     currentAnimation.play( getX() , getY() );
  }
  
  /*
  Summary:   Creates a new internal animation for the sprite. This one does not take the speed in, instead, uses default 15
  Parameters:
    name:       Name of the animation
    start:      Start frame(remember, frame count starts from 0 on the sheet!)
    end:        End frame(remember, frame count starts from 0 on the sheet!)
  */
  void addAnimation(String name, int start, int end)
  {
    
    int count = end - start; //+1 because if we get count of 0, we would not be able to get that the one frame we need
    
    //In case we got start and end the wrong way or there are no frames to use
    if(count < 0)
    {
      return;
    }
    
    if(count == 0)
    {
      count = 1;
    }
    
    PImage[] set = new PImage[count]; //Create an empty set of frames. Add 1 extra to be the starting value
       
    for(int i = 0; i < count; i++)
    { //<>//
      set[i] = frames[start + i];
    }
    
    Animation a = new Animation(name, set);
    increaseAnimationArray();
    animations[animations.length - 1] = a;
  }
  
  /*
  Summary:   Creates a new internal animation for the sprite
  Parameters:
    name:       Name of the animation
    start:      Start frame(remember, frame count starts from 0 on the sheet!)
    end:        End frame(remember, frame count starts from 0 on the sheet!)
    speed:      How fast the animation plays. Lower values mean faster animation
  */
  void addAnimation(String name, int start, int end, int speed)
  {
    
    int count = end - start;
    
    //In case we got start and end the wrong way...
    if(count < 0)
    {
      return;
    }
    
    if(count == 0)
    {
      count = 1;
    }
    
    PImage[] set = new PImage[count]; //Create an empty set of frames. Add 1 extra to be the starting value
    
    //Get the frames and put them into the set
    for(int i = 0; i < count; i++)
    {
      set[i] = frames[start + i];
    }
      
    //Now that is done, create the animation and store it
    Animation a = new Animation(name, set, speed);
    //Make sure the animation array has room for it through evil size magic
    increaseAnimationArray();
    animations[animations.length - 1] = a;
  }

   /*
  Summary:     Begins playing an animation of given name. Does nothing if the animation does not exist. Loops animation by default
  Parameters:
    name:       Name of the animation
  */
  void playAnimation(String name)
  {
    for(Animation a : animations)
    {
      if(a.getName() == name)
      {
        currentAnimation = a;
        currentAnimation.reset(true);
        return;
      }
    }
  }
  
  /*
  Summary:     Begins playing an animation of given name. Does nothing if the animation does not exist
  Parameters:
    name:      Name of the animation
    loop:      Whenever or not the animation loops
  */
  void playAnimation(String name, boolean loop)
  {
    for(Animation a : animations)
    {
      if(a.getName() == name)
      {
        currentAnimation = a;
        currentAnimation.reset(loop);
        return;
      }
    }
  }
  
  /*
  Summary:     Checks if the animation has finished playing and returns true if it has done so. If the animation is set to loop, this always returns false
  Returns:     Whenever or not the animation has finished playing
  */
  boolean animationFinished()
  {
    return currentAnimation.isFinished();
  }
  
  /*************************************************************
  *                                                            *
  *                       PRIVATE                              *
  *                                                            *
  **************************************************************/
  
  //Private section
  private PImage sheet_;
  private Animation currentAnimation;
  private PImage frames[];
  private Animation[] animations;
  private int width_;
  private int height_;
  
  
  private void setUpFrames()
  {
    int fileWidth = sheet_.width;
    int fileHeight = sheet_.height;
    //Calculate how many entires we have per row, then get how many rows we have
    int framesPerLine = (fileWidth / width_);
    int frameLines = (fileHeight / height_);
    
    //Total number of frames
    int frameNumber =  framesPerLine*frameLines;
    
    frames = new PImage[frameNumber];
    int currentFrame = 0;
    //Start collectting all the frames, even the "empty" ones
    for(int frameY = 0; frameY < frameLines; frameY++)
    {
      for(int frameX = 0; frameX < framesPerLine; frameX++)
      {
        //Create a current frame and add it to the frame list
        frames[currentFrame] = sheet_.get(frameX*width_, frameY*height_, width_, height_);
        currentFrame++;
        
      }
    }
  }
  
  void increaseAnimationArray()
  {
    //Evil size messing, basically make a temporal copy of array. Then create a new array with size increased by 1. Then copy values from the old array
    Animation[] temp = animations;
    animations = new Animation[animations.length + 1];
    
    for(int i = 0; i < temp.length; i++)
    {
      animations[i] = temp[i];
    }
    
  }
  
}




/*
  Class:
    Animation
  
  Declaration:
    Animation(String name,  PImage [] set, int speed)
    Animation(String name,  PImage [] set)
  
  Summary:
    Used to store animations and play them. Supports looping.
*/
class Animation {
  
  /*
  Summary:    Contructor for animation class. This one takes speed as a parameter
  Parameters:
    name:     Name of the animation
    set:      Set of frames
    speed:    How many cycles before next frame. Lower values mean faster animation
  */
  Animation(String name,  PImage [] set, int speed)
  {
    name_ = name;
    frames = set;
    frame_ = 0;
    speed_ = speed;
    loop_ = true;
    finished_ = false;
  }
  
  /*
  Summary:    Same as above, except speed is set to 17, which is roughly 17 milliseconds.
  Parameters:
    name:     Name of the animation
    set:      Set of frames
  */
  Animation(String name,  PImage [] set)
  {
    name_ = name;
    frames = set;
    frame_ = 0;
    speed_ = 17;
    loop_ = true;
    finished_ = false;
  }
  
  String getName()
  {
    return name_;
  }
  
  void reset()
  {
    frame_ = 0;
    finished_ = false;
    //Do not change the looping value, only set the frame to 0
  }
  
  void reset(boolean loop)
  {
    frame_ = 0;
    finished_ = false;
    loop_ = loop;
  }
  
  
  void play(float x, float y)
  {
    
    image(frames[frame_], x, y);
    //If the counter has not reached zero, remove one and return
    if(counter_ > 0)
    {
      counter_--;
      return;
    }
    
    //Else, change the frame and start the counter again
    counter_ = speed_;
    //Increment frame by one, loop if we reach the end and looping is set to true
    
    
    if(loop_)
    {  //If we are looping, we do dark sorcery with math
      frame_ = (frame_ + 1) % frames.length;
    }
    else if (!finished_)
    {
      //We are not looping AND we have not finished the animation. Check if we have reached the end of the animation, if not, switch to next frame
      if(frame_ + 1 < frames.length)
      {
        frame_++;
      }
      else
      {
        finished_ = true;
      }
    }
  }

  boolean isFinished()
  {
    return finished_;
  }
  
  
  //Private section
  private String name_;
  private PImage[] frames;
  private int frame_;
  private int counter_;
  private int speed_;
  private boolean loop_;
  private boolean finished_;
}