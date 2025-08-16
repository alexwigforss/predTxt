char numnum;
char lastnum;
boolean bp = false;
boolean once = false;
boolean linedout = false;
boolean popup = false;
int pdTime;
boolean keyDown = false;

void mousePressed() {
  bp = true;

  //loop();
    mouseOver();
    whatButt();

  if (mouseButton == LEFT) {
    newcharAction();
  } else if (mouseButton == RIGHT) {
      if (oNum == '>') {
        println("Blam detta händer.");
        wordOut = scanword;
        cc = '\0';
      } else if (oNum >= '0' && oNum <= '8') { 
        wordOut = wordOut + cc;
        CharNrGet();
        sounds[charnum].trigger();
    }
  }
}
void mouseReleased() {
  bp=false;
}

void keyPressed() {
  loop();
  if (!keyDown) {
    if (key == CODED) {
      if (keyCode == DOWN) {    
        rightP();
      } else if (keyCode == LEFT) {    
        leftP();
      }
    }
  }
  keyDown=true;
}
void keyReleased() {
  keyDown=false;
  once=false;
}
void leftP() {
  if (bp==true) {
    if (numnum == '>') {
      wordOut = scanword;
      cc = '\0';
      numnum ='0';
    } else if (numnum >= '0' && numnum <= '8') { 
      wordOut = wordOut + cc;
      CharNrGet();
      sounds[charnum].trigger();
    }
    //bp = false;
  }
  //if (!hor) yp++;
  //else if (hor) {
  //  xp++;
  //}
}

void rightP() {
  //if (hor) {
  if (xp == 3) {
    //resetScan();
    //} else if (xp==2&&yp==3) {
  } else if (oNum=='>') {
    if (!once) {
      pdTime=millis();
      whatButt();
      once=true;
    }
    newcharAction();
  } else {
    whatButt();
    newcharAction();
  }
}

void whatButt() {
  lastnum = oNum;
  lastnum = numnum;
  if (yp==0 && xp ==0) numnum='0';
  if (yp==0 && xp ==1) numnum='1';
  if (yp==0 && xp ==2) numnum='2';

  if (yp==1 && xp ==0) numnum='3';
  if (yp==1 && xp ==1) numnum='4';
  if (yp==1 && xp ==2) numnum='5';

  if (yp==2 && xp ==0) numnum='6';
  if (yp==2 && xp ==1) numnum='7';
  if (yp==2 && xp ==2) numnum='8';

  if (yp==3 && xp ==0) numnum='<';
  if (yp==3 && xp ==1) numnum='v';
  if (yp==3 && xp ==2) numnum='>';

  if (yp==4) numnum=' ';
}
