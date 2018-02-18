class InputName{
    float x;
    float y;
    String chars1,chars2,age,gender;
    int numChars1,numChars2,numChars3,numChars4,currentProp;
    float fontSize;
    Boolean active;
    
    InputName(float x, float y){
        this.x = x-50;
        this.y = y;
        this.fontSize = legendTextSize+5;
        this.active=true;
        chars1 = "";chars2 = "";age="";gender="";
        numChars1 = 0;numChars2 =0;numChars3=0;numChars4=0;currentProp=1;
    }
    
    void display(){  
        drawBG();
        fill(0);
        textSize(fontSize+10);
        if(chars1 == "") text("--",x+100,y+30); else text(chars1,x+100,y+30);
        if(chars2 == "") text("--",x+100,y+60); else text(chars2,x+100,y+60);
        if(age == "") text("--",x+100,y+90);else text(age,x+100,y+90);
        if(gender == "") text("--",x+100,y+120); else text(gender,x+100,y+120);
        //if(stressLevel == "") text("--",x+100,y+150); else text(stressLevel,x+100,y+150);
        text("    Enter the patient details",x-200,y);
        text("First Name             :",x-200,y+30);
        text("Last Name              :",x-200,y+60);
        text("Age                        :",x-200,y+90);
        text("Gender (M/F/O)      :",x-200,y+120);
       // text("Stress level (1-10)  :",x-200,y+150);
        submitButton(x,y+180);
       
    }
    
    void addChar(char c){
      switch(input.currentProp){
            case 1: chars1 += c;numChars1++; break;
            case 2: chars2 += c;numChars2++; break;
            case 3: age += c;numChars3++ ;break;
            case 4: gender+= c;numChars4++;break;
       //     case 5: stressLevel += c;numChars5++;break;
          }
    }
    
    void drawBG(){
      stroke(sketchBackground);strokeWeight(0);
      fill(sketchBackground);
      rect(x-300,y-120,700,500);   
    }
    
    void reset(){
      switch(input.currentProp){
            case 1: chars1=""; break;
            case 2: chars2="";break;
            case 3: age="";break;
            case 4: gender="";break;
      //      case 5: stressLevel="";break;
          }
      drawBG();
    } 
    void deleteChar(){
      
            switch(input.currentProp){
            case 1: if(numChars1 > 0){
                      chars1 = chars1.substring(0,chars1.length()-1); numChars1 -= 1;
                    }
                   break;
            case 2:if(numChars2 > 0){
                      chars2 = chars2.substring(0,chars2.length()-1); numChars2 -= 1;
                    }
                   break;
            case 3: if(numChars3 > 0){
                      age = age.substring(0,age.length()-1); numChars3 -= 1;
                    }
                   break;
            case 4: if(numChars4 > 0){
                      gender = gender.substring(0,gender.length()-1); numChars4 -= 1;
                    }
                   break;
        //    case 5: if(numChars5 > 0){
       //               stressLevel = stressLevel.substring(0,stressLevel.length()-1); numChars5 -= 1;
        //            }
       //            break;
          }
            drawBG();display();
    }
}


void keyPressed(){
        if (input.currentProp ==1 && ((key >= 'a' && key <= 'z' )||( key >= 'A' && key <= 'Z') || key == ' ') && input.active)
            input.addChar(key);
        if (input.currentProp == 2 && ((key >= 'a' && key <= 'z' )||( key >= 'A' && key <= 'Z') || key == ' ') && input.active)
            input.addChar(key);
        if(input.currentProp == 3 && (key=='1' || key == '2'|| key == '3' || key == '4' || key == '5' || key =='6' || key == '7' || key =='8' || key == '9' || key=='0') && input.age.length() < 2)
            input.addChar(key);
        if(input.currentProp == 4 && (key == 'M' || key == 'F' || key == 'O' || key == 'm' || key == 'f' || key == 'o') && input.gender.length()<1)
            input.addChar(key);
  //      if(input.currentProp == 5 && (key=='1' || key == '2'|| key == '3' || key == '4' || key == '5' || key =='6' || key == '7' || key =='8' || key == '9') && input.stressLevel.length() <1 )         
    //        input.addChar(key);
        if (keyCode == BACKSPACE){
            input.deleteChar();
        }
        if (keyCode == ENTER){
                
            if(input.chars1 != "" && input.chars2 != "" && input.age != "" && input.gender != "" /*&& input.stressLevel != ""*/){
              input.active=false;  
              input.drawBG();
              FIRST_NAME = input.chars1;
              LAST_NAME = input.chars2;
              AGE = input.age;
              GENDER = input.gender;
       //       STRESSLEVEL = input.stressLevel;
              inputDone=true;
            }
            else{
                 fill(#9B6262);
                 text("Please enter all the details!",input.x-100,input.y+330);
            }
                
        }
        if (keyCode == DELETE)
          input.reset();
        if(keyCode == TAB){
          input.currentProp++;
          if(input.currentProp==6) input.currentProp=1;
        }
}
void mouseClicked(){
  if(mouseX>=input.x-100 && mouseX<=input.x+200 && mouseY<=input.y+32 && mouseY>=input.y+20 && !inputDone)
    input.currentProp=1;
  if(mouseX>=input.x-100 && mouseX<=input.x+200 && mouseY<=input.y+62 && mouseY>=input.y+50 && !inputDone)
    input.currentProp=2;
  if(mouseX>=input.x-100 && mouseX<=input.x+200 && mouseY<=input.y+92 && mouseY>=input.y+80 && !inputDone)
    input.currentProp=3;
  if(mouseX>=input.x-100 && mouseX<=input.x+200 && mouseY<=input.y+122 && mouseY>=input.y+110 && !inputDone)
    input.currentProp=4;
 // if(mouseX>=input.x-100 && mouseX<=input.x+200 && mouseY<=input.y+152 && mouseY>=input.y+140 && !inputDone)
 //   input.currentProp=5;
}