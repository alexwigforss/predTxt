boolean keyDown = false;

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
}
void keyReleased() {
  keyDown=false;
  once=false;
}
