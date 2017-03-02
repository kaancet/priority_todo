public void createTable()
{
  savingTable.addColumn("itemNo");
  savingTable.addColumn("Label");
  savingTable.addColumn("inZone");
  savingTable.addColumn("Remaining");
}


public void saveItems()
{
  todoItem temp_item;
  for(int i=0; i<todos.size(); i++)
  {
    temp_item = (todoItem)todos.get(i);
    TableRow newRow = savingTable.addRow();
    newRow.setInt("itemNo",temp_item.itemno);
    newRow.setString("Label",temp_item.label);
    newRow.setInt("inZone",temp_item.inZone);
    newRow.setInt("Remaining",getRemain(temp_item.remain));       
  }
  String saveLoc="SaveLogs/"+getTime()+"Save.csv";
  saveTable(savingTable,saveLoc);
}

public void loadItems(File selection)
{
  
  String loadLabel;
  int loadCount, loadZone,loadItemNo;
  
  loadingTable=loadTable(selection.getAbsolutePath(),"header");
  
  for(TableRow row : loadingTable.rows())
  {
    loadLabel = row.getString("Label");
    loadCount = row.getInt("Remaining");
    loadZone = row.getInt("inZone");
    loadItemNo = row.getInt("itemNo");
    
    todos.add(new todoItem(loadLabel,loadCount,itemno+loadItemNo,loadZone));
    itemno++;
  }
  
}