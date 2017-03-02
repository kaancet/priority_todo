
interface Draggable
{
  boolean isMouseHover();
  boolean over(float ix,float iy);
  void draw();
  void mousePressed();
  void mouseDragged();
  void mouseReleased();
}

class NullDraggableObject implements Draggable 
{
  
  boolean isMouseHover(){ return false;}
  boolean over(float ix, float iy){return false;}
  void draw(){}
  void mousePressed(){}
  void mouseDragged(){}
  void mouseReleased(){}
}

class todoItem implements Draggable
{
  String label;
  int remain;
  float x,y,w,h;
  boolean drag;
  float dragX, dragY;
  int itemno;
  float centerx;
  float centery;
  int inZone;
  coordinates place=new coordinates();
  
  todoItem(String inlabel, int inremain, int itemnoin, int zone)
  {
    itemno=itemnoin;
    label=inlabel;
    inZone=zone;
    remain=inremain;
    w=200;
    h=60;
    if(inZone==0)
    {
      x=20;
      y=80+(noInZone(0))*(h+10); //<>//
    }
    else
    {
      place=put2Zone(inZone,zoneArr,w,h,itemno);
      x=place.coorx;
      y=place.coory;
    }

    drag=false;
    dragX=0;
    dragY=0;
    centerx=x+w/2;
    centery=y+h/2;

  }
  
  boolean isMouseHover()
  {
    return over(mouseX,mouseY);
  }

  boolean over(float inx, float iny)
  {
    if (inx >= x && inx <= x+w && iny >= y && iny <= y+h) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
  
  void draw()
  {
    stroke(0);
    fill(255);
    rect(x,y,w,h,7);
    fill(25);
    textSize(20);
    textAlign(CORNER);
    text(label,x+10,y+5,w,h/2);
    //strikethrough if in done
    if (inZone==10)
    {
      line(x+8,y+18,x+textWidth(label)+5,y+18);
    }
   
    fill(201, 32, 32);
    
    String r_text=String.valueOf(remain)+" hours remain";
    text(r_text,x+10,y+h/2+15);
    
  }
  
  void mousePressed()
  {
    drag=over(mouseX,mouseY);
    if (drag)
    {
      dragX=mouseX-x;
      dragY=mouseY-y;
    }
  }
  
   void mouseDragged() {
   if (drag) {
     x = mouseX - dragX;
     y = mouseY - dragY;
     centerx=x+w/2;
     centery=y+h/2;
     inZone=getZone(zoneArr,centerx,centery);
   }
 }
 
  void mouseReleased() {
   drag = false;
   println(inZone);
 }
}