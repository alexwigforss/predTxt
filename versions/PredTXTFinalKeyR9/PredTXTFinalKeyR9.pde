int totTime;
int downTime;
boolean longPressed;
int thrs=2000;


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
}

void draw() {
  totTime = millis();
  scanList();
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
}
