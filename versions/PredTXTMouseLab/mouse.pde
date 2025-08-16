int my, mx;
int oField;
char oNum;

void newcharAction() {
  if (oNum == '>') bp = true;
  if (oNum >= '0' && oNum <= '8') {
    bp = true;
    lp = oNum;
    if (lp!='7') roof=2;
    else if (lp=='7') roof=4;
    if (lp == pp) {
      // går ett steg i cycle
      if (cycle < roof) cycle++;
      else cycle = 0;
    }
    if (lp != pp) {
      //bp = false;
      cycle = 0;
    }
  } else if (oNum == '<') {
    if (wordOut.length() != 0) wordOut = wordOut.substring(0, wordOut.length() - 1);
  } else if (oNum == 'v') {
    lineOut = lineOut + wordOut + " ";
    tmpfreq.append(scanword); // Adda till lista med alla ord som valts
    wordOut = "";
    scanpos=0;
  } else if (oNum == '>' && selection.size() > 0) {//scanna ett steg i listan
    if (scanpos < templength) {
      scanpos++;
    } else {
      scanpos = 1;
      scanword ="";
    }
  } else if (oNum == ' ') {
    params[3] = "\""+ lineOut +"\"";
    launch(params);
  }
  pp = lp;
}

void mouseOver() {
  if (mouseY > height * 0.8)
    oField = 2;
  else
    if (mouseX < width / 2)
      oField = 0;
    else
      oField = 1;
  if (oField == 0) {
    my = int(map(mouseY, 0, height * 0.8, 0, 4));
    mx = int(map(mouseX, 0, width/2, 0, 3));
  } else my=mx=-1;
  overChar();

  //println(oField, my, mx, oNum, once, bp, lp);
}

void overChar() {
  if (my==0 && mx ==0) oNum='0';
  if (my==0 && mx ==1) oNum='1';
  if (my==0 && mx ==2) oNum='2';

  if (my==1 && mx ==0) oNum='3';
  if (my==1 && mx ==1) oNum='4';
  if (my==1 && mx ==2) oNum='5';

  if (my==2 && mx ==0) oNum='6';
  if (my==2 && mx ==1) oNum='7';
  if (my==2 && mx ==2) oNum='8';

  if (my==3 && mx ==0) oNum='<';
  if (my==3 && mx ==1) oNum='v';
  if (my==3 && mx ==2) oNum='>';

  if (yp==4) oNum=' ';
}
