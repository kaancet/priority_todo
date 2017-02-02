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
    if(arr[i]<arrmin) //<>//
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