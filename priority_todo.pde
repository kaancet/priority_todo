
color currentcolor;
RectButton addButton, clearButton, exitButton,taskButton;
boolean locked = false;
int x=250;
boolean add_dialog=false;
int itemno=0;
int rows=7;
int cols=2;
int[][] zoneArr = new int[rows][cols];

import controlP5.*;

Draggable todo;
NullDraggableObject nulltodo;
ArrayList todos;

ControlP5 cp5;

String taskLabel = "";

void ItemDialog()
{
  int x=500;
  int y=250;
  int box_l=width/2-x/2;
  int box_r=box_l+x;
  int box_t=height/2-y/2;
  int box_b=box_t+y;
  fill(0,0,0,100);
  rect(0,0,width, height);
  stroke(186, 44, 22);
  strokeWeight(2);
  fill(45);
  rect(box_l,box_t,x,y);
  fill(255);
  textSize(32);
  text("Task:",box_l+60,box_t+50);
  //input box
  exitButton = new RectButton("",box_r-50,box_t+20,30,30, color(216, 42, 15), color(211, 123, 110), color(0));
  exitButton.display();
  
  taskButton = new RectButton("Done",box_r-120,box_b-100,100,50,color(100),color(220),color(221, 110, 6));
  taskButton.display();
  stroke(0);
  line(box_r-43,box_t+27,box_r-27,box_t+43);
  line(box_r-43,box_t+43,box_r-27,box_t+27);
  
}

//get the text value to taskLabel when "enter" press occurs
void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    taskLabel=theEvent.getStringValue();
    println(taskLabel);
  }
}

void template()
{  
  
  int bottomy=100;
  int margin=60;
  int textbox_margin=130;
  int textbox_size=250;
  int prio_x1=x+(width-x)/3;
  int prio_x2=x+2*(width-x)/3;
  int prio_midy=(height-bottomy)/2;
  background(71, 178, 39);
  
  //todo window
  fill(175, 26, 15);
  rect(0,0,x,height-bottomy);
  //prority list
  fill(201, 226, 232);
  rect(x,0,width-x,height-bottomy);
  
  //priority divide lines
  stroke(0);
  strokeWeight(3);
  //vertical line1
  line(prio_x1,margin,prio_x1,height-bottomy-margin);
  //vertical line2
  line(prio_x2,margin,prio_x2,height-bottomy-margin);
  //horizontal line
  line(x+margin,prio_midy,width-margin,prio_midy);
  
  //center points for each priority zone
  zoneArr[0][0]=x;
  zoneArr[0][1]=height-bottomy;
  zoneArr[1][0]=x+(prio_x1-x)/2;
  zoneArr[1][1]=(prio_midy)/2;
  zoneArr[2][0]=prio_x1+(prio_x2-prio_x1)/2;
  zoneArr[2][1]=(prio_midy)/2;
  zoneArr[3][0]=prio_x2+(width-prio_x2)/2;
  zoneArr[3][1]=(prio_midy)/2;
  zoneArr[4][0]=x+(prio_x1-x)/2;
  zoneArr[4][1]=prio_midy+((height-bottomy)-prio_midy)/2;
  zoneArr[5][0]=prio_x1+(prio_x2-prio_x1)/2;
  zoneArr[5][1]=prio_midy+((height-bottomy)-prio_midy)/2;
  zoneArr[6][0]=prio_x2+(width-prio_x2)/2;
  zoneArr[6][1]=prio_midy+((height-bottomy)-prio_midy)/2;
  
  //debug to show where the zone points are
  //fill(255,0,0);
  //for (int j=0; j<rows; j++)
  //{
  //  ellipse(zoneArr[j][0],zoneArr[j][1],10,10);
  //}
  
  //todo line
  strokeWeight(1.2);
  line(20,70,x-20,70);
  strokeWeight(3);
  
  line(0,height-bottomy,width,height-bottomy);
  line(x,0,x,height-bottomy);
  fill(255,255,255);
  textSize(32);
  String t="todo";
  text(t,20+textWidth(t)/2,47);
  
  String d="done";
  text(d,20+textWidth(d)/2,height-bottomy/2+10);
  
  String p="priority";
  fill(0,0,0);
  text(p,x+(width-x)/2,40);
  
  String p1="Red Hot\n+";
  String p2="Medium\n+";
  String p3="Chilly\n+";
  String c1="\nHard Work";
  String c2="\nChillington";
  textSize(40);
  textAlign(CENTER);
  fill(221, 110, 6,150);
  //important+hardwork
  text(p1+c1,x+((prio_x1-x)/2)-textbox_size/2,textbox_margin,textbox_size,textbox_size);
  //medium+hardwork
  text(p2+c1,prio_x1+((prio_x2-prio_x1)/2)-textbox_size/2,textbox_margin,textbox_size,textbox_size);
  //chilly+hardwork
  text(p3+c1,prio_x2+((width-prio_x2)/2)-textbox_size/2,textbox_margin,textbox_size,textbox_size);
  
  //important+chill
  text(p1+c2,x+((prio_x1-x)/2)-textbox_size/2,prio_midy+textbox_margin*2/3,textbox_size,textbox_size);
  //medium+chill
  text(p2+c2,prio_x1+((prio_x2-prio_x1)/2)-textbox_size/2,prio_midy+textbox_margin*2/3,textbox_size,textbox_size);
  //chilly chillington
  text(p3+c2,prio_x2+((width-prio_x2)/2)-textbox_size/2,prio_midy+textbox_margin*2/3,textbox_size,textbox_size);
  
}


void setup()
{
  nulltodo = new NullDraggableObject();
  todos = new ArrayList();
  
  size(1300,900);
  
  smooth();
  strokeWeight(1.5);

  color buttoncolor = color(100);
  color highlight = color(220);
  color fontfill = color(221, 110, 6);
  
  addButton = new RectButton("Add Item",x-120, 15, 100, 44, buttoncolor, highlight,fontfill);
  clearButton = new RectButton("Clear List",width-120, height-70, 100,44, buttoncolor, highlight,fontfill);
}

void draw()
{
  template();
  update(mouseX, mouseY);
  addButton.display();
  clearButton.display();
  todo = nulltodo;
  for(int i=0; i<todos.size(); i++)
  {
    todoItem d = (todoItem)todos.get(i);
    d.draw();
    if (d.isMouseHover())
    {
      todo = d;
    }
  }
  if (add_dialog==true)
  {
    ItemDialog();
  }
}

void mousePressed()
{
  todo.mousePressed();
}

void mouseDragged()
{
  todo.mouseDragged();
}

void mouseReleased()
{
  todo.mouseReleased();
}

void update(int x, int y)
{
  if(locked == false) {
    addButton.update();
    clearButton.update();
    if(add_dialog == true){
      exitButton.update();
      taskButton.update();
    }
  } 
  else {
    locked = false;
  }
 
  if(mousePressed) {
    delay(100);//prevents bug
    if(add_dialog == true){
      if(exitButton.pressed()){
        print("EXIT!");
        add_dialog=false;
        cp5.remove("");
      }
      else if(taskButton.pressed()){
        print("DONE!");
        add_dialog=false;
        todos.add(new todoItem(taskLabel,itemno));
        itemno++;
        cp5.remove("");
      }
    }
    
    if(addButton.pressed()) {
      print("ADDED ITEM");
      add_dialog=true;
      
       PFont font = createFont("arial",20);
       cp5 = new ControlP5(this);
       cp5.addTextfield("")
         .setPosition(width/2-x/2-150,height/2-y/2)
         .setSize(300,40)
         .setFont(font)
         .setFocus(true)
         .setColor(color(255));
      textFont(font);
    } 
    else if(clearButton.pressed()) {
      print("CLEAR");
    }
  }
  
}