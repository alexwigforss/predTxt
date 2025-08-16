void debugshit() { //<>//
  //println(" " + ," " + ," " + );
  println(" " + totTime," " + downTime," " + longPressed," " + thrs);
}


int totTime;
int downTime;
boolean longPressed;
int thrs=2000;

StringList letters;
StringList tmpfreq;
char lp; // last pressed
char pp; // previous pressed
char cc = '\0';
int cycle = 0;
int roof = 0;
boolean floop = false;
boolean anypressed = false;

String wordOut = new String();
String lineOut = new String();
String preLength = new String();

void setup() {
  size(800, 400);
  guisetup();
  abcScanSet();//load lines array
  cutselect();//crop out words only to Alines
  lettInit();
  //noLoop();
}

void draw() {
  totTime = millis();
  //if (((keyPressed == true) || (mousePressed == true))&&((xp==2 && yp==3))) {
  if (((keyPressed == true) || (mousePressed == true))&&((xp==2 && yp==3))&&(numnum=='>')) {
    downTime=millis()-pdTime;
    //println(downTime, thrs, scanpos);
    if (downTime > thrs) {
      thrs+=1000;
      if (scanpos > 1) {
        scanpos--;
      } else {
        scanpos = templength;
        scanword ="";
      }
    }
  } else {
    downTime=0;
    thrs=2000;
  }
  if (floop) {
    if (numnum >= '0' && numnum <= '8') {
      int numlp = int(str(lp));
      String ltz = letters.get(numlp);
      cc = ltz.charAt(cycle);
    }
  }
  selecta();
  guidraw();
  preLength = wordOut;
  if (!floop) floop = true;
  //noLoop();
  debugshit();
}

void lettInit() {
  letters = new StringList();
  letters.append("abc");  
  letters.append("def");
  letters.append("ghi");  
  letters.append("jkl");
  letters.append("mno");  
  letters.append("pqr");
  letters.append("stu");  
  letters.append("vwx");
  letters.append("yz");
}
