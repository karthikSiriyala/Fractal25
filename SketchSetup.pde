void initialSketch(){
  stroke(sketchOutlineColor);
  strokeWeight(sketchOutlineThickness);
  fill(sketchBackground);
  rect(sketchBorder,sketchBorder,width-(10*sketchBorder),height-(2*sketchBorder));
}

void legends(){
  stroke(legendOutlineColor);
  strokeWeight(legendOutlineThickness);
  fill(legendFill);
  rect(width-((margin-1)*sketchBorder)+margin,sketchBorder-3,(margin*(margin+1)),height-(2*sketchBorder)+7);
  textSize(legendTextSize);
  fill(legendTextColor);
  text("Ideal Dist:\n"+calcIdealDist(),width-((margin-1)*sketchBorder)+margin+5,sketchBorder*2);
  text("Total Dist:\n"+calcTotalDist(),width-((margin-1)*sketchBorder)+margin+5,sketchBorder*6);
  if(sw.running)
    text("Total Elapsed:\n"+sw.getElapsedTime(),width-((margin-1)*sketchBorder)+margin+5,sketchBorder*12);

  
  resetButton();
  exitButton();
      
  //one.draw();
  //two.draw();
  //one.isHovered();
  //two.isHovered();
  
}

float distanceBubble(Bubble b1,Bubble b2){
  float dist=0.0;
  dist=sqrt(sq(b1.xCoordinate-b2.xCoordinate)+sq(b1.yCoordinate-b2.yCoordinate));
  return dist;
}

float calcTotalDist(){
  float distance=0;
  for(int i=1;i<xCoordinate.size();i++){
    distance+=sqrt(sq(xCoordinate.get(i-1)-xCoordinate.get(i))+sq(yCoordinate.get(i-1)-yCoordinate.get(i)));
  }
  
  return distance;
}

float calcIdealDist(){
  float dist=0.0;
  int index=2;
  Bubble temp=bubbles.get(0);
  do{
  for(Bubble b:bubbles){
    if(b.label==index){
      dist+=distanceBubble(b,temp);
      temp=b;
      index++;
      break;
    }
    }
  }while(index<26);
  
  return dist;
}
void exitButton(){
  stroke(0);
  strokeWeight(1);
  fill(200);
  rect(width-((margin-1)*sketchBorder)+margin*3,height-(margin*10),75,50,2,2,2,2);
  fill(0);textSize(legendTextSize+5);
  text("Exit",width-((margin-1)*sketchBorder)+margin*4+5,height-(margin*7));
  
  if(mousePressed && mouseX>width-((margin-1)*sketchBorder)+margin*3 && mouseX<width-((margin-1)*sketchBorder)+margin*3+80
                  && mouseY>height-(margin*10) && mouseY<height-(margin*10)+50){
    exit();
  }
}

void resetButton(){ 

  stroke(0);
  strokeWeight(1);
  fill(200);
  rect(width-((margin-1)*sketchBorder)+margin*3,height-(margin*18),75,50,2,2,2,2);
  fill(0);textSize(legendTextSize+5);
  text("Restart",width-((margin-1)*sketchBorder)+margin*3.2,height-(margin*15));
    
  if(mousePressed && mouseX>width-((margin-1)*sketchBorder)+margin*3 && mouseX<width-((margin-1)*sketchBorder)+margin*3+80
                  && mouseY>height-(margin*18) && mouseY<height-(margin*18)+50){
    setup();
  }
}

void submitButton(float x,float y){
  
  stroke(0);
  strokeWeight(1);
  fill(200);
  rect(x-15,y+5,90,40,2,2,2,2);
  fill(0);
  textSize(legendTextSize+10);
  text("Submit",x-12,y+33);
    
  if(mousePressed && mouseX>x-12 && mouseX<x+43
                  && mouseY>y+15 && mouseY<y+42 ){
            if(input.chars1 != "" && input.chars2 != "" && input.age != "" && input.gender != ""  /*&& input.stressLevel != ""*/){
              input.active=false;  
              input.drawBG();
              FIRST_NAME = input.chars1; 
              LAST_NAME = input.chars2;
              AGE = input.age;
              GENDER = input.gender;
          //    STRESSLEVEL = input.stressLevel;
              inputDone=true;
            }
            else{
                 fill(#9B6262);
                 text("Please enter all the details!",input.x-100,input.y+300);
            }
              
  }
}

void getBubbles(){
  for(int i=0;i<26;i++){
    int r=i%4;
    float x,y;
    //rect(sketchBorder,sketchBorder,width-(10*sketchBorder),height-(2*sketchBorder));
    switch(r){
      case 0:
        x=random(4*margin+sketchBorder,(width-margin-(8*sketchBorder))/2);
        y=random(4*margin+sketchBorder,(height-(2*sketchBorder))/2);
        //line(4*margin+sketchBorder,4*margin+sketchBorder,(width-margin-(8*sketchBorder))/2,(height-(5*sketchBorder))/2);
        break;
      case 1:
        x=random(sketchBorder+margin+(width-(10*sketchBorder))/2,width-(14*sketchBorder));
        y=random(margin+sketchBorder,height-(5*sketchBorder)/2);
       // line((width-margin-(8*sketchBorder))/2,4*margin+sketchBorder,width-(12*sketchBorder),(height-(5*sketchBorder))/2);
        break;
      case 2:
        x=random(margin+sketchBorder,(width-(11*sketchBorder))/2);
        y=random((height-(9*sketchBorder))/2,height-9*margin);
       // line(4*margin+sketchBorder,(height-sketchBorder)/2,(width-margin-(8*sketchBorder))/2,height-4*sketchBorder);
        break;
      case 3:
        x=random(sketchBorder+margin+(width-(10*sketchBorder))/2,width-(14*sketchBorder));
        y=random((height-(9*sketchBorder))/2,height-9*margin);
       // line((width-margin-(8*sketchBorder))/2,(height-sketchBorder)/2,width-(12*sketchBorder),height-4*sketchBorder);
        break;
      default:
        x=width/2;y=height/2;
    }
    Bubble b=new Bubble(i,x,y);
    bubbles.add(b);
  }
}