char numnum;
char lastnum;
boolean charcycl = false;
boolean bp = false;
boolean once = false;
int pdTime;
void leftP() {  
  if (bp==true) {
    if (numnum == '>') wordOut = scanword;
    else if (numnum >= '0' && numnum <= '8') wordOut = wordOut + cc;
    bp = false;
  }
  if (!hor) yp++;
  else if (hor) {
    xp++;
  }
}

void rightP() {
  if (hor) {
    if (xp == 3) {
      resetScan();
    } else if (xp==2&&yp==3) {
      if (!once) {
        pdTime=millis();
        whatButt();
        //print(pdTime);
        once=true;
      }
      newcharAction();
    } else {
      whatButt();
      newcharAction();
    }
  } else {
    if (yp == 4) {
      whatButt();
      newcharAction();
    } else hor = !hor;
  }
}

void xpypCor() {
  if (xp >= 4) xp=0;
  else if (xp < 0) xp=2;
  if (yp >= 5) yp=0;
  else if (yp < 0) yp=3;
}

void resetScan() {
  yp = 0;
  xp = 0;
  hor = false;
}

void newcharAction() {
  if (numnum == '>') bp = true;
  if (numnum >= '0' && numnum <= '8') { //om är en bokstavsknapp
    bp = true;
    lp = numnum;
    if (lp!='8') roof=2;
    else if (lp=='8') roof=1;
    if (lp == pp) {
      if (cycle < roof) cycle++;
      else cycle = 0;
    }
    if (lp != pp) cycle = 0;
    if (hor) {
    }
  } else if (numnum == '<') {
    if (wordOut.length() != 0) wordOut = wordOut.substring(0, wordOut.length() - 1);
  } else if (numnum == 'v') {
    lineOut = lineOut + wordOut + " ";
    tmpfreq.append(scanword); // Adda till lista med alla ord som valts
    wordOut = "";
    scanpos=0;
  } else if (numnum == '>' && selection.size() != 0) {//scanna ett steg i listan
    if (scanpos < templength) {
      scanpos++;
    } else {
      scanpos = 1;
      scanword ="";
    }
  } else if (numnum == ' ')
  {
    //println(lineOut);
    wordOut = "";
    addFreqs();
    resetScan();
  }
  pp = lp;
}

void whatButt() {
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