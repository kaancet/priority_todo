import java.lang.*;

int getZone(int[][] zonearr,float px, float py)
{ 
  
  int zoneNo=0; //0=todo, 10=done, 1-6=priority zones
  double distx;
  double disty;
  MinReturn closest;
  int rows=zonearr.length;
  int cols=zonearr[1].length;
  int rows2=rows-1;
  double[] distanceArr=new double[rows2];
  
  if (px<=zonearr[0][0] && py<=zonearr[0][1])
  {
    return zoneNo=0;
  }
  else if(py>zonearr[0][1])
  {
    return zoneNo=10;
  }
  else
  { 
  //find the point that is closest to 
  //[i][0]->x [i][1]->y
  for(int i=1; i<=rows2; i++)
  {
    distx=Math.pow((px-zonearr[i][0]),2);
    disty=Math.pow((py-zonearr[i][1]),2);
    distanceArr[i-1]=Math.sqrt(distx+disty);
  }
  
  closest=getMinVal(distanceArr);  
  zoneNo=closest.index;
  return zoneNo;
  }
}

MinReturn getMinVal(double[] arr)
{
  MinReturn returnval;
  returnval = new MinReturn();
  double arrmin=500;
  for(int i=0; i<arr.length; i++)
  {
    if(arr[i]<arrmin)
    {
      arrmin=arr[i];
      returnval.index=i+1;
    }
  }
  
  returnval.MinVal=arrmin;
  return returnval;
}

class MinReturn
{
  int index;
  double MinVal;  
  
  MinReturn()
  {
    index=0;
    MinVal=0;
  }
}


int noInZone(int zoneNo)
{
  int itemAmount=0;
  todoItem temp;
  for(int i=0; i<todos.size(); i++)
  {
    temp = (todoItem)todos.get(i);
    if(temp.inZone==0)
    {
      itemAmount++;
    }
  }
  return itemAmount;
}


coordinates put2Zone(int zoneno, int[][] zonearr, float wid, float hid, int item)
{
  float zonex = zonearr[zoneno][0];
  float zoney = zonearr[zoneno][1];
   coordinates coords = new coordinates();
  
  zonex=zonex-wid/2;
  zoney=zoney-100+item*(hid+8);
  
  coords.setCoords(zonex,zoney);
  return coords;
}

class coordinates
{
  float coorx;
  float coory;
  
  coordinates()
  {
    coorx=0;
    coory=0;
  }
  
  void setCoords(float incoorx, float incoory)
  {
    coorx=incoorx;
    coory=incoory;
  }
  
}