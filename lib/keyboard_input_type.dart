extension KeyboardInpuTypeExtension on KeyboardInputType {
  String? getText() {
    switch (this) {
      case KeyboardInputType.zero:
        return "0";
      case KeyboardInputType.one:
        return "1";
      case KeyboardInputType.two:
        return "2";
      case KeyboardInputType.three:
        return "3";
      case KeyboardInputType.four:
        return "4";        
      case KeyboardInputType.five:
        return "5";
      case KeyboardInputType.six:
        return "6";
      case KeyboardInputType.seven:
        return "7";
      case KeyboardInputType.eight:
        return "8";
      case KeyboardInputType.nine:
        return "9";          
      default:
        return null;
    }
  }
}

enum KeyboardInputType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  delete,
  longDelete,
}

typedef KeyboardInputTypeCallback = Function(KeyboardInputType);
