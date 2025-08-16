import ddf.minim.*;
Minim minim;
String alfabeta;
int charnum;
AudioSample[] sounds = new AudioSample[29];
void audiosetup() {
  minim = new Minim(this);
  alfabeta = "abcdefghijklmnopqrstuvwxyzåäö";
  int i = 0;
  for (char letter : alfabeta.toCharArray()) {
    sounds[i] = minim.loadSample( "sounds/"+letter+".wav", 512);
    i++;
  }
}

void CharNrGet() {
  switch(cc) {
  case 'a':    
    charnum = 0;    
    break;
  case 'b':    
    charnum = 1;    
    break;
  case 'c':    
    charnum = 2;    
    break;
  case 'd':    
    charnum = 3;    
    break;
  case 'e':    
    charnum = 4;    
    break;
  case 'f':    
    charnum = 5;    
    break;
  case 'g':    
    charnum = 6;    
    break;
  case 'h':    
    charnum = 7;    
    break;
  case 'i':    
    charnum = 8;    
    break;
  case 'j':    
    charnum = 9;    
    break;
  case 'k':    
    charnum = 10;    
    break;
  case 'l':    
    charnum = 11;    
    break;
  case 'm':    
    charnum = 12;    
    break;
  case 'n':    
    charnum = 13;    
    break;
  case 'o':    
    charnum = 14;    
    break;
  case 'p':    
    charnum = 15;    
    break;
  case 'q':    
    charnum = 16;    
    break;
  case 'r':    
    charnum = 17;    
    break;
  case 's':    
    charnum = 18;    
    break;
  case 't':    
    charnum = 19;    
    break;
  case 'u':    
    charnum = 20;    
    break;
  case 'v':    
    charnum = 21;    
    break;
  case 'w':    
    charnum = 22;    
    break;
  case 'x':    
    charnum = 23;    
    break;
  case 'y':    
    charnum = 24;    
    break;
  case 'z':    
    charnum = 25;    
    break;
  case 'å':    
    charnum = 26;    
    break;
  case 'ä':    
    charnum = 27;    
    break;
  case 'ö':    
    charnum = 28;    
    break;
  }
}