// Emily D'Costa | Sept 15 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float l, r, result;
char op;
boolean left, newEntry;
String displayVal;
String digit;

void setup() {
  size(130, 220);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  displayVal = "0.0";
  digit = digit;

  numButtons[0] = new Button(20, 170, 20, 20, '0');
  numButtons[1] = new Button(20, 140, 20, 20, '1');
  numButtons[2] = new Button(50, 140, 20, 20, '2');
  numButtons[3] = new Button(80, 140, 20, 20, '3');
  numButtons[4] = new Button(20, 110, 20, 20, '4');
  numButtons[5] = new Button(50, 110, 20, 20, '5');
  numButtons[6] = new Button(80, 110, 20, 20, '6');
  numButtons[7] = new Button(20, 80, 20, 20, '7');
  numButtons[8] = new Button(50, 80, 20, 20, '8');
  numButtons[9] = new Button(80, 80, 20, 20, '9');
  opButtons[0] = new Button(110, 80, 20, 20, '+'); // add
  opButtons[1] = new Button(110, 110, 20, 20, '-'); // subtract
  opButtons[2] = new Button(110, 140, 20, 20, '×'); // multiply
  opButtons[3] = new Button(110, 170, 20, 20, '÷'); // divide
  opButtons[4] = new Button(50, 170, 20, 20, '.'); // dec
  opButtons[5] = new Button(80, 170, 20, 20, '±'); // n-p
  opButtons[6] = new Button(20, 50, 20, 20, '√'); // sqrt
  opButtons[7] = new Button(50, 50, 20, 20, 's'); // caret
  opButtons[8] = new Button(80, 50, 20, 20, 'c'); // parenthesis left
  opButtons[9] = new Button(110, 50, 20, 20, 't'); // parenthesis right
  opButtons[10] = new Button(35, 200, 50, 20, '='); // equals
  opButtons[11] = new Button(95, 200, 50, 20, 'C'); // clear
}

void draw() {
  background(#abcade);
  drawDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawDisplay() {
  rectMode(CENTER);
  fill(#677985);
  rect(width/2, 20, 110, 20);
  fill(#c2cbd1);
  textAlign(RIGHT);
  text(displayVal, width-15, 25);
}

void mouseReleased() {
  // Update display with button clicked by user

  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
      // display variables
      println("L:" + l);
      println("R:" + r);
      println("Result:" + result);
      println("Left:" + left);
      println("Op:" + op);
    }
    // end
  }
  // end of hover if condition
}
// end of mouseReleased

// calculation function
void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '×') {
    result = l * r;
  }
  displayVal = str(result);
  left = !left;
  l = result;
  r = 0.0;
}

void keyPressed() {
  println("keyCode: " + keyCode);
  if (key == 48 || keyCode == 96) {
    handleEvent('0', true);
  } else if (key == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (key == 50 || keyCode == 98) {
    handleEvent('2', true);
  } else if (key == 51 || keyCode == 99) {
    handleEvent('3', true);
  } else if (key == 52 || keyCode == 100) {
    handleEvent('4', true);
  } else if (key == 53 || keyCode == 101) {
    handleEvent('5', true);
  } else if (key == 54 || keyCode == 102) {
    handleEvent('6', true);
  } else if (key == 55 || keyCode == 103) {
    handleEvent('7', true);
  } else if (key == 56 || keyCode == 104) {
    handleEvent('8', true);
  } else if (key == 57 || keyCode == 105) {
    handleEvent('9', true);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent('-', false);
  } else if (keyCode == 107) {
    handleEvent('+', false);
  } else if (keyCode == 106) {
    handleEvent('×', false);
  } else if (keyCode == 111) {
    handleEvent('÷', false);
  } else if (keyCode == 110) {
    handleEvent('.', false);
  } else if (keyCode == 61) {
    performCalc();
  } else if (keyCode == 10) {
    performCalc();
  } else if (keyCode == 67 || keyCode == 12) {
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
    left = true;
    displayVal = "0.0";
    newEntry = true;
  }
}
void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    // do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }
    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // do operator stuff
    char clicked = val;

    if (clicked == '=') {
      performCalc();
    } else if (clicked =='+' || clicked == '-' ||
      clicked == '×' || clicked == '÷') {
      op = clicked;
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      }
    } else if (clicked == 'C') {
      // reset all variables
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
      displayVal = "0.0";
      newEntry = true;
      // sqrt
    } else if (clicked == '√') {
      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == 't') {
      if (left == true) {
        l = tan(radians(l));
        displayVal = str(l);
      } else {
        r = tan(radians(r));
        displayVal = str(r);
      }
      // decimal
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += ".";
      }
    } else if (clicked == 'c') {
      if (left == true) {
        l = cos(radians(l));
        displayVal = str(l);
      } else {
        r = cos(radians(r));
        displayVal = str(r);
      }
    } else if (clicked == 's') {
      if (left == true) {
        l = sin(radians(l));
        displayVal = str(l);
      } else {
        r = sin(radians(r));
        displayVal = str(r);
      }
    }
  }
}
