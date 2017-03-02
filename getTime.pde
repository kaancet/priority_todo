String getTime()
{
    textSize(16);
    int dayy=day();
    String d=String.valueOf(dayy);
    int monthh=month();
    String m=String.valueOf(monthh);
    int yearr=year();
    String yy=String.valueOf(yearr);
    String slash=".";
    String current_date=d+slash+m+slash+yy;
    return current_date;
}

int getRemain(int cntdown)
{
  int remain=abs(24*((cntdown+1)-(day()+1))+(24-hour()));
  return remain;
}