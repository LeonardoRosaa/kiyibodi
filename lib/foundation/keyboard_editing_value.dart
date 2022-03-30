class KiyibodiEditingValue {
  const KiyibodiEditingValue({
    required this.text,
    required this.disabled,
  });

  const KiyibodiEditingValue.empty()
      : this(
          text: '',
          disabled: false,
        );

  /// The field is a text does typed by user
  final String text;

  /// The field to store if Keyboard was disabled.
  final bool disabled;

  KiyibodiEditingValue copyWith({
    String? text,
    bool? disabled,
  }) {
    return KiyibodiEditingValue(
      text: text ?? this.text,
      disabled: disabled ?? this.disabled,
    );
  }
}
