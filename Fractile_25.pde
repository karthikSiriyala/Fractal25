ArrayList<Bubble> bubbles;
Indicator one;
Indicator two;
ArrayList<Float> xCoordinate;
ArrayList<Float> yCoordinate;
Table table,points;
static String FIRST_NAME,LAST_NAME,AGE,GENDER;
InputName input;
boolean done=false,inputDone=false;
StopWatch sw;


void setup(){

  fullScreen();
  background(background);
  one=new Indicator("Deviation\nTracker",width-100,150,descOne);
  two=new Indicator("Direction\nTracker",width-100,250,descTwo);
  bubbles= new ArrayList<Bubble>();
  xCoordinate=new ArrayList<Float>();
  yCoordinate=new ArrayList<Float>();
  sw=new StopWatch();
  done=false;
  initialSketch();
  table=new Table();
  table.addColumn("First Column");
  table.addColumn("Subject Id");
  table.addColumn("Date Time");
  table.addColumn("X coordinate");
  table.addColumn("Y coordinate");
  table.addColumn("Z coordinate");
  
  points=new Table();
  points.addColumn("X");
  points.addColumn("Y");
  
  if(!inputDone){
    input = new InputName(float(width/2)-70,float(height/2)-150);
    input.drawBG(); }
  getBubbles();
  for(int i=0;i<bubbles.size()-1;i++){
        TableRow row=points.addRow();
        row.setFloat("X",bubbles.get(i).xCoordinate);
        row.setFloat("Y",bubbles.get(i).yCoordinate);
        
      }

}


void draw(){
  
  exitButton();
  resetButton();

  if(input.active)
        input.display();   
  if(inputDone && !done){

      for(int i=0;i>0?bubbles.get(i-1).reached:true && i<26;i++){
        initialSketch();
        if(i>25) break;
        bubbles.get(i).draw();
        if(i==0 && bubbles.get(0).reached && !sw.running){
          sw.start();
          }
        }
    legends();
  }   
  if(mouseX!=pmouseX && mouseY!=pmouseY && bubbles.get(0).reached && !bubbles.get(25).reached){
    
    Float x=float(mouseX);
    Float y=float(mouseY);
    xCoordinate.add(x);
    yCoordinate.add(y);
    TableRow newRow = table.addRow();
    newRow.setString("First Column","-");
    newRow.setString("Subject Id","11");
    newRow.setString("Date Time",str(day())+"/"+str(month())+"/"+str(year())+" "+str(hour())+":"+str(minute())+":"+str(second())+":"+str(int(millis()/100))); 
    newRow.setFloat("X coordinate",x);
    newRow.setFloat("Y coordinate",y);
    newRow.setFloat("Z coordinate",0);  
            
  }
    if(bubbles.get(25).reached){
      if(sw.running) sw.stop(); 
      done=true;
      if(inputDone){}

      initialSketch();
      for(int i=0;i<=25;i++){  
        if(i>25) break;
        bubbles.get(i).draw();
      }
      for(int i=1;i<xCoordinate.size();i++){
        stroke(0);
        strokeWeight(pathWidth);       
        line(xCoordinate.get(i-1),yCoordinate.get(i-1),xCoordinate.get(i),yCoordinate.get(i));
      } 
      String details[]={"First name:"+FIRST_NAME+"  ","Last name:"+LAST_NAME,"Age:"+AGE,"Gender:"+GENDER};
      saveStrings(FIRST_NAME+"  "+LAST_NAME+"/"+str(day())+"-"+str(month())+"-"+str(year())+"/"+"details.txt",details);
      saveTable(table,FIRST_NAME+"  "+LAST_NAME+"/"+str(day())+"-"+str(month())+"-"+str(year())+"/"+str(hour())+"-"+str(minute())+".csv");
      saveTable(points,FIRST_NAME+"  "+LAST_NAME+"/"+str(day())+"-"+str(month())+"-"+str(year())+"/"+str(hour())+"-"+str(minute())+"points.csv");
      saveFrame(FIRST_NAME+"  "+LAST_NAME+"/"+str(day())+"-"+str(month())+"-"+str(year())+"/"+str(hour())+"-"+str(minute())+".jpg");
    }
}