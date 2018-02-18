class Bubble{
  int id;
  int label;
  float xCoordinate;
  float yCoordinate;
  float diameter;
  boolean reached=false;
  color fillColor=bubbleDefaultColor;
  
  Bubble(){
    
  }
  
  
  Bubble(int id,int label,float x,float y){
    this.id=id;
    this.label=label;
    this.xCoordinate=x;
    this.yCoordinate=y;
    this.diameter=bubbleDiameter;

  }
  
  Bubble(int id,float x,float y){
    this.id=id;
    this.label=id;
    this.xCoordinate=x;
    this.yCoordinate=y;
    this.diameter=bubbleDiameter;
  }
  
  void isSelected(){
    
    if(mousePressed  && mouseX>=this.xCoordinate-(this.diameter/2) && mouseX<=this.xCoordinate+(this.diameter/2) 
                    && mouseY>=this.yCoordinate-(this.diameter/2) && mouseY<=this.yCoordinate+(this.diameter/2)){               
      this.reached=true;
      this.fillColor=bubbleSelectedColor;
    }
  }
 
 void isHovered(){
   if(this.id>0 && this.id<26 && mouseX>=this.xCoordinate-(diameter/2) && mouseX<=this.xCoordinate+(diameter/2) 
                             && mouseY>=yCoordinate-(diameter/2) && mouseY<=yCoordinate+(diameter/2)){
      noFill();
      noStroke();
      rect(mouseX,mouseY,90,30);
      fill(0);
      textSize(10);
      text("click to go for\nnext bubble",mouseX+3,mouseY+10);
    }
    else if(this.id==0){
      fill(230);
      noStroke();
      rect(xCoordinate-(diameter/2)-80,yCoordinate+diameter,200,20);
      fill(0);
      textSize(15);
      text("Click on the bubble to start",xCoordinate-(diameter/2)-80,yCoordinate+diameter+15);
    }
    else if(this.id==25){
      fill(230);
      noStroke();
      rect(xCoordinate-(diameter/2)-70,yCoordinate+diameter,200,20);
      fill(0);
      textSize(15);
      text("Click on the bubble to end",xCoordinate-(diameter/2)-70,yCoordinate+diameter+15);
    }
 }
  
  void draw(){
        
    stroke(bubbleOutline);
    strokeWeight(bubbleOutlineThickness);
    fill(this.fillColor);
    ellipse(this.xCoordinate,this.yCoordinate,this.diameter,this.diameter);
    
    fill(bubbleDefaultText);
    textSize(bubbleTextSize);
    text(this.label,this.xCoordinate-4,this.yCoordinate+5);

    isHovered();
    isSelected();
    
  } 
}