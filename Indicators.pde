class Indicator{
  
  float diameter=30;
  color outline=0;
  float outlineWidth=1;
  String label;
  String description;
  color fillColor=color(84,247,70); 
  float x;
  float y;
  Indicator(){
  }
  
  Indicator(String label,float x,float y,String desc){
    this.label=label;
    this.x=x;
    this.y=y;
    this.description=desc;
  }
  void setXY(float x,float y){
    this.x=x;
    this.y=y;
  }
 
  void isHovered(){
    
    if(mouseX>=x-(diameter/2) && mouseX<=x+(diameter/2) && mouseY>=y+50-(diameter/2) && mouseY<=y+50+(diameter/2)){
      fill(255);
      noStroke();
      rect(mouseX,mouseY,200,110);
      fill(0);
      textSize(10);
      text(description,mouseX+5,mouseY+20);
    }
        
  }
  void setColor(int r,int g,int b){
    this.fillColor=color(r,g,b);
  }
  
  void draw(){
    
    stroke(outline);
    strokeWeight(outlineWidth);
    fill(fillColor);
    ellipse(x,y+50,diameter,diameter);
    fill(0);
   textSize(15);
   text(label,x-(diameter/2),y);
   
  }
  
}