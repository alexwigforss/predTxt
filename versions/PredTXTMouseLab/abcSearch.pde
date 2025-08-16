Table wrdlist;
String lines[];
String arAlines[];
StringList Alines;
StringList selection;
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
  tmpfreq = new StringList();
}

void cutselect() {
    Alines = new StringList();
    for (int i = 0; i < lines.length; i++) {
      String str = (lines[i]);
        String[] tmp = split(str, ',');
        Alines.append(tmp[1]);
    }
}

void selecta() {
    arAlines = Alines.array(); 
    if (preLength != wordOut) {//om wordout har fått en till bokstav
    selection = new StringList();
    for (int i = 0; i < arAlines.length; i++) {
      String str = arAlines[i];
      if (str.startsWith(wordOut) == true) {
        selection.append(str);
        templength = selection.size();
      }
    }
  }
}