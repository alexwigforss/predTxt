boolean keyDown = false;
String numstring = "";
void mousePressed() {
  //loop();
  if (mouseButton == RIGHT) {
    rightP();
  } else if (mouseButton == LEFT) {
    leftP();
  }
  xpypCor();
}
void mouseReleased() {
  once=false;
}
void keyPressed() {
  //loop();
  if (!keyDown) {
    if (key == CODED) {
      if (keyCode == DOWN) {    
        rightP();
      } else if (keyCode == LEFT) {    
        leftP();
      }
    }    
    xpypCor();
  }
  keyDown=true;

  switch(key) {
  case '1':
    numstring = numstring + '7';
    break;
  case '2':
    numstring = numstring + '8';
    break;
  case '3':
    numstring = numstring + '9';
    break;
  case '4':
    numstring = numstring + '4';
    break;
  case '5':
    numstring = numstring + '5';
    break;
  case '6':
    numstring = numstring + '6';
    break;
  case '7':
    numstring = numstring + '1';
    break;
  case '8':
    numstring = numstring + '2';
    break;
  case '9':
    numstring = numstring + '3';
    break;
  case '0':
    numstring=numstring.substring(0, numstring.length()-1);
    print(numstring);
    break;
  default:
    print(numstring);
    break;
  }
  numlecta();
  //for (String val : lines) {
  //  println(val);
  //}
}
void keyReleased() {
  keyDown=false;
  once=false;
}
