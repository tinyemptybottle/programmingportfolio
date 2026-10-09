class Button {

  float x, y, w, h;
  char val;
  boolean hover;
  color c1, c2;
  boolean isNum;

  //Constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    hover=false;
    c1 = color(#71a7c9);
    c2 = color(#6591ad);
  }

  // Member Variables
  void display() {
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 8);
    fill(#000000);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
