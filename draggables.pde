
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
  float x,y,w,h;
  boolean drag;
  float dragX, dragY;
  int itemno;
  float centerx;
  float centery;
  int inZone;
  
  todoItem(String inlabel, int itemnoin)
  {
    itemno=itemnoin;
    label=inlabel;
    x=20;
    w=200;
    h=60;
    y=80+(itemno)*(h+10); //<>//
    drag=false;
    dragX=0;
    dragY=0;
    centerx=x+w/2;
    centery=y+h/2;
    inZone=0;
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
    int dayy=day();
    String d=String.valueOf(dayy);
    int monthh=month();
    String m=String.valueOf(monthh);
    int yearr=year();
    String yy=String.valueOf(yearr);
    String slash="/";
    String date=d+slash+m+slash+yy;
    textSize(16);
    fill(201, 32, 32);
    text(date,x+10,y+h/2+15);
    
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