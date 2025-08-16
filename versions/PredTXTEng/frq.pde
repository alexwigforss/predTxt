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

