int scanlab;
int rectWidth;
int rectHeight;
int yp=0;
int xp=0;
int hwidth;
int hheight;
StringList butts;
boolean[] pressed= new boolean[12];
boolean hor = false;
boolean phor = false;
int horC = 0;

int hNr = 4; 
int wNr = 3;

void guisetup() {
  hwidth=width/2;
  hheight=height/2;
  rectWidth = hwidth/3-10;
  rectHeight = hheight/2-25;
  textFont(createFont("Georgia",36 ));
  textAlign(CENTER, CENTER);
  buttInit();
}

void guidraw() {
  scanlab=-(scanpos-2)*10*4;
  translate(width/2, scanlab);
  background(255, 255, 255);
  fill(200);
  if (scanpos != 0) {
    for (int i = scanpos-1; i < selection.size (); i++) {
      if (i < 6 +scanpos) {
        if (i == scanpos)fill(0, 0, 255);
        String item = selection.get(i);
        int h = i * 10 * 2;
        text(item, width/4, h*2);
        if (i+1 == scanpos)fill(255, 0, 0);
        if (i+1 == scanpos) scanword = item;
      }
    }
  } else if (scanpos == 0) {
    for (int i = scanpos; i < selection.size (); i++) {
      if (i < 6 +scanpos) {
        if (i == scanpos)fill(0, 0, 255);
        String item = selection.get(i);
        int h = i * 10 * 2;
        text(item, width/4, h*2);
        if (i+1 == scanpos)fill(255, 0, 0);
        if (i+1 == scanpos) scanword = item;
      }
    }
  }

  translate(-width/2, -scanlab);

  if (xp==3) {
    fill(0, 0, 255);
    rect(0, 0, hwidth, height);
  }

  fill(255);
  int iy = 0;
  int ix = 0;
  int iAll = 0;
  for (int y= 5; y<height; y += height/5) {
    for (int x= 5; x<hwidth; x += hwidth/3) {
      if (iy < 4) {
        fill(255);
        rect(x, y, rectWidth, rectHeight);
        if ((iy==my)&&(ix==mx)) {
          fill(0, 0, 200, 200);
          if (bp) 
            rect(x, y, rectWidth, rectHeight, 25);
          else if (!bp)
            rect(x, y, rectWidth, rectHeight);
        }
      }
      ix++;
      fill(0);
      if (iAll < 12) {
        String it = butts.get(iAll);
        text(it, x+rectWidth/2, y+rectHeight/2);
      }
      iAll++;
    }
    iy++; 
    ix=0;
  }
  if (yp == 4) fill(0, 0, 240, 100);
  else fill(255);
  rect(5, (height-rectHeight)-5, width-10, rectHeight);
  fill(0);
  text(cc, width*0.75, 10);
  text(wordOut + " \n " + lineOut, width/2, height-rectHeight/2);
}
void buttInit() {
  butts = new StringList();
  butts.append("ABC");  
  butts.append("DEF");
  butts.append("GHI");  
  butts.append("JKL");
  butts.append("MNO");  
  butts.append("PQR");
  butts.append("STU");  
  butts.append("VWX\nYZ");
  butts.append("ÅÄÖ");  
  butts.append("<<<");
  butts.append("vvv");  
  butts.append(">>>");
}
