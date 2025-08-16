void debugshit() { //<>// //<>//
  //println(" " + ," " + ," " + );
  println(" " + totTime," " + downTime," " + longPressed," " + thrs," " + pdTime);
}

int totTime;
int downTime;
boolean longPressed;
int thrs=2000;

StringList letters;
StringList tmpfreq;
char lp; // last pressed
char pp; // previous pressed
char cc;
int cycle = 0;
int roof = 0;
boolean floop = false;
boolean anypressed = false;

String wordOut = new String();
String lineOut = new String();
String preLength = new String();

String[] params = { "espeak", "-v", "mb/mb-sw1", ""};

void setup() {
  size(800, 400);
  frameRate(60);
  audiosetup();
  guisetup();
  cc = '\0';
  abcScanSet();//load lines array
  cutselect();//crop out words only to Alines
  lettInit();
}

void draw() {
  mouseOver();
  totTime = millis();
  //if (((keyPressed == true) || (mousePressed == true))&&((xp==2 && yp==3))&&(numnum=='>')) {
  if ((mousePressed == true)&&(oNum=='>')) {
    downTime=millis()-pdTime;
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
    thrs=1000;
  }
  if (floop) {
    if (oNum >= '0' && oNum <= '8') {
      int numlp = int(str(lp));
      String ltz = letters.get(numlp);
      cc = ltz.charAt(cycle);
    }
  }
  selecta();
  guidraw();
  preLength = wordOut;
  if (!floop) floop = true;
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
  letters.append("vwxyz");
  letters.append("åäö");
}
