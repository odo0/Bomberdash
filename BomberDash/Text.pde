/*
  Class:
    Text
  
  Declaration:
    Text(float x, float y, String text)
    Text(float x, float y, String text, int size)
  
  Summary:
    This is used to draw text on the screen when it is added to the Scene. Has two constructors, one with size and other without.
    Normal font size is 14.
*/
class Text extends GraphicObject
{
  /*
  Summary:  Constructor that only takes location and text
  Parameters:
    x:      X-coordinates
    y:      Y-coordinates
    text:   String to be shown
  */
  Text(float x, float y, String text)
  {
    super(x,y);
    text_ = text;
    size_ = 14;
  }
  
  /*
  Summary:  Constructor that only takes location and text
  Parameters:
    x:      X-coordinates
    y:      Y-coordinates
    text:   String to be shown
    size:   Size of the text
  */
  Text(float x, float y, String text, int size)
  {
    super(x,y);
    text_ = text;
    size_ = size;
  }
  
  /*
  Summary:  Updates and draws this class
  */
  void update()
  {
    textSize(size_);
    text( text_, getX(), getY() );
  }  
  
  /*
  Summary:  Sets String of text
  Parameters:
    text:   String to be shown
  */
  void setString(String text)
  {
    text_ = text;
  }
  
  /*
  Summary:  Returns the String used for the text
  Return:   String of the text
  */
  String getString()
  {
    return text_;
  }
  
  /*
  Summary:  Sets size of the text
  Parameters:
    size:   Size of the text
  */
  void setSize(int size)
  {
    size_ = size;
  }
  
  /*
  Summary:  Returns the size used for the text
  Return:  Size of the text
  */
  int getSize()
  {
    return size_;
  }
  
  /*************************************************************
  *                                                            *
  *                       PRIVATE                              *
  *                                                            *
  **************************************************************/
  
  private String text_;
  private int size_;
  
}