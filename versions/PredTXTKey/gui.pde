int scanlab;
int rectWidth;//GUI Variables
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

void guisetup() {
  hwidth=width/2;
  hheight=height/2;
  rectWidth = hwidth/3-10;
  rectHeight = hheight/2-10;
  textAlign(CENTER, CENTER);
  buttInit();
}

void guidraw() {
  scanlab=-(scanpos-2)*10*2;
  translate(width/2, scanlab);
  background(255, 255, 255);
  fill(200);
  textFont(createFont("Georgia", 20));
  drawList();

  translate(-width/2, -scanlab);
  if (xp==3) rect(0, 0, hwidth, height);
  textFont(createFont("Georgia", 40));
  fill(255);
  int iy = 0;
  int ix = 0;
  int iAll = 0;
  scale(1, 0.8);
  for (int y= 5; y<height; y += height/4) {
    for (int x= 5; x<hwidth; x += hwidth/3) {
      fill(255);
      if (!hor && ix == 0) fill(200);
      if (hor && iy == yp) fill(200);
      rect(x, y, rectWidth, rectHeight);
      if ((iy==yp)&&(ix==xp)) {
        fill(0, 0, 200, 200);
        rect(x, y, rectWidth, rectHeight);
      }
      ix++;
      fill(0);
      String it = butts.get(iAll);
      text(it, x+rectWidth/2, y+rectHeight/2);
      iAll++;
    }
    iy++; 
    ix=0;
  }
  if (yp == 4) fill(0, 0, 240, 100);
  else fill(255);
  rect(5, height+5, width-10, rectHeight);
  fill(0);
  text(cc, width*0.52, 10);
  text(wordOut + " \n " + lineOut, width/2, height+rectHeight/2);
}

void drawList() {
  if (scanpos != 0) {
    for (int i = scanpos-1; i < numlection.size (); i++) {
      if (i < 12 +scanpos) {
        if (i == scanpos)fill(0, 0, 255);
        String item = numlection.get(i);
        int h = i * 10;
        text(item, width/6, h*2);
        if (i+1 == scanpos)fill(255, 0, 0);
        if (i+1 == scanpos) scanword = item;
      }
    }
  } else if (scanpos == 0) {
    for (int i = scanpos; i < numlection.size (); i++) {
      if (i < 12 +scanpos) {
        if (i == scanpos)fill(0, 0, 255);
        String item = numlection.get(i);
        int h = i * 10;
        text(item, width/6, h*2);
        if (i+1 == scanpos)fill(255, 0, 0);
        if (i+1 == scanpos) scanword = item;
      }
    }
  }  
  if (scanpos != 0) {
    for (int i = scanpos-1; i < selection.size (); i++) {
      if (i < 12 +scanpos) {
        if (i == scanpos)fill(0, 0, 255);
        String item = selection.get(i);
        int h = i * 10;
        text(item, width/2, h*2);
        if (i+1 == scanpos)fill(255, 0, 0);
        if (i+1 == scanpos) scanword = item;
      }
    }
  } else if (scanpos == 0) {
    for (int i = scanpos; i < selection.size (); i++) {
      if (i < 12 +scanpos) {
        if (i == scanpos)fill(0, 0, 255);
        String item = selection.get(i);
        int h = i * 10;
        text(item, width/2, h*2);
        if (i+1 == scanpos)fill(255, 0, 0);
        if (i+1 == scanpos) scanword = item;
      }
    }
  }
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
