StringList letters;
StringList tmpfreq;
Table wrdlist;
String lines[];
String arAlines[];
String numAlines[];
StringList Alines;
StringList selection;
StringList numlection;
String currentInput = new String();
int templength;
int scanpos=0;
String scanword;

void abcScanSet() {
  lines = loadStrings("outout.csv");
  wrdlist = loadTable("outout.csv", "header");
  wrdlist.setColumnType("freq", Table.INT);
  wrdlist.sortReverse(2);
  saveTable(wrdlist, "data/outout.csv");
  tmpfreq = new StringList(); //alla ord som väljs
}

void cutselect() {
  Alines = new StringList();
  for (int i = 0; i < lines.length; i++) {
    String str = (lines[i]);

    //println(str);
    String[] tmp = split(str, ',');
    Alines.append(tmp[1]);
  }
}
void numlecta() {
  numAlines = Alines.array(); 
  if (numstring.length() != 0) {//om numstring är längre än 0
    numlection = new StringList();
    for (int i = 0; i < numAlines.length; i++) {
      String str = (lines[i]);
      //String str = numAlines[i];
      if (str.startsWith(numstring) == true) {
        println(str);
        numlection.append(str);
        templength = numlection.size();
      }
    }
  }
  println(numstring);
}
void selecta() {
  arAlines = Alines.array(); 
  if (preLength != wordOut) {//om wordout har fått en ny bokstav
    selection = new StringList();
    numlection = new StringList();
    for (int i = 0; i < arAlines.length; i++) {
      String str = arAlines[i];
      if (str.startsWith(wordOut) == true) {
        selection.append(str);
        numlection.append(str);
        templength = selection.size();
      }
    }
  }
}
void addFreqs() {
  for (int i = 0; i < lines.length; i++) {
    if (i == 0) {
      lines[i]="num,word,freq";
    } else {
      String str = (lines[i]);
      String[] tmp = split(str, ',');
      for (int j = 0; j < tmpfreq.size (); j++) {
        String replstr = tmpfreq.get(j);
        if (tmp[1].equals(replstr) == true) {
          int tmpfrq = int(tmp[2]) + 1;
          lines[i] = tmp[0]+"," + tmp[1] + "," + tmpfrq;
          str = (lines[i]);
          tmp = split(str, ',');
        }
      }
    }
  }
  tmpfreq.clear();
  saveStrings("data/outprel.csv", lines);
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
void scanList() {
  if (((keyPressed == true) || (mousePressed == true))&&((xp==2 && yp==3))&&(numnum=='>')) {
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
    thrs=2000;
  }
}
