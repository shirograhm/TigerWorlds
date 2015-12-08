class Credit {
  int x;
  float y;
  String txt;
  int size;
  
  Credit(String text, int x, float y, int size) {
    this.x = x;
    this.y = y;
    this.txt = text;
    this.size = size;
  }
  
  void drawCredit() {
    textSize(size);
    text(txt, x, y);
  }
}