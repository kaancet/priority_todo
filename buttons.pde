class Button
{
  String label;
  int x, y;
  int bwidth, bheight;
  color basecolor, highlightcolor,fontfill;
  color currentcolor;
  color fillcolor=color(255);
  boolean over = false;
  boolean pressed = false;   

  void update() 
  {
    if(over()) {
      currentcolor = highlightcolor;
      fillcolor=fontfill;
    } 
    else {
      currentcolor = basecolor;
      fillcolor = color(255);
    }
  }

  boolean pressed() 
  {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }    
  }

  boolean over() 
  { 
    return true; 
  }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } 
    else {
      return false;
    }
  }

}

class RectButton extends Button
{

  RectButton(String inlabel, int ix, int iy, int inwidth, int inheight, color icolor, color ihighlight,color ifontfill) 
  {
    label=inlabel;
    x = ix;
    y = iy;
    bwidth = inwidth;
    bheight = inheight;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
    fontfill=ifontfill;
  }
  
  boolean over() 
  {
    if(overRect(x, y, bwidth, bheight) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }
  
  void display() 
  {
    stroke(fillcolor);
    fill(currentcolor);
    rect(x, y, bwidth, bheight);
    textSize(18);
    textAlign(CENTER);
    fill(fillcolor);
    text(label, x+(bwidth/2),y+5+(bheight/2));
  }
}