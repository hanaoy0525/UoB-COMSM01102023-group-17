import java.util.ArrayList;
import java.util.Collections;



class RankTable {
  Table table;
  Boolean add;
  String inputText;
  ArrayList<Entity> rank;
  
   RankTable () {
     table = loadTable("data/rank.csv", "header");
     rank = new ArrayList<Entity>();
     
     for (int i = 0; i < table.getRowCount(); i++) {
        TableRow row = table.getRow(i);
        String name = row.getString("name");
        int score = row.getInt("score");
        rank.add(new Entity(name, score));
      }
   }
   
   
   void display() {
      // load the table
      text("Rank", width / 2 - 30, 50);
      
      Collections.sort(rank);
  
      for (int i = 0; i < 10 && i < rank.size(); i++){
        text(rank.get(i).name, 100, 100 + i * 50);
        text(rank.get(i).score, 320, 100 + i * 50);   
      }
      
      text("Space to Return", 220, 770);
   }
   
   void addEntity(String name, int score) {
     if (name.length() == 0) {
         Integer num = (int) random(1000, 10000);
         name = "Unknown" + Integer.toString(num);
     }
     TableRow newRow = table.addRow();
     newRow.setInt("score", score);
     newRow.setString("name", name);
     rank.add(new Entity(name, score));
     saveTable(table, "data/rank.csv", "csv");
   }
   
   
}


/*
void draw() {
  background(255);
  fill(127, 0, 0);
  
  text("Enter your name: ", width / 4, height / 2);
  fill(0);
  text(inputText, width / 2 + 50, height / 2);
  
  rank = new ArrayList<Entity>();
  
  // Display the table
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);

    String name = row.getString("name");
    int score = row.getInt("score");
    rank.add(new Entity(name, score));
  }
  
  textSize(20);
  int i = 0;
  for (Entity entity: rank){
    text(entity.name, 50, 50 + i * 20);
    text(entity.score, 200, 50 + i++ * 20);
  }
  i = 0;
  
  Collections.sort(rank);
  
  for (i = 0; i < 5; i++){
    text(rank.get(i).name, 50, height / 2 + 20 + i * 20);
    text(rank.get(i).score, 200, height / 2 + 20 + i * 20);   
  }
  
  
}

void keyPressed() {
  if (key == '\n') {
    int randomNum = (int) random(0, 100);
    rank.add(new Entity(inputText, randomNum));
    TableRow newRow = table.addRow();
    newRow.setInt("score", randomNum);
    newRow.setString("name", inputText);
    saveTable(table, "data/rank.csv", "csv");
    inputText = "";
  } else {
    inputText += key; 
  }
}

*/
