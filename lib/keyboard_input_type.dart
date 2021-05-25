class KeyboardInputType {
  final int index;

  const KeyboardInputType({required this.index});

  int get value => index;

  static final zero = KeyboardInputType(index: 0);
  static const one = const KeyboardInputType(index: 1);
  static const two = const KeyboardInputType(index: 2);
  static const three = const KeyboardInputType(index: 3);
  static const four = const KeyboardInputType(index: 4);
  static const five = const KeyboardInputType(index: 5);
  static const six = const KeyboardInputType(index: 6);
  static const seven = const KeyboardInputType(index: 7);
  static const eight = const KeyboardInputType(index: 8);
  static const nine = const KeyboardInputType(index: 9);
  static const delete = const KeyboardInputType(index: 10);
  static const longDelete = const KeyboardInputType(index: 11);
}
