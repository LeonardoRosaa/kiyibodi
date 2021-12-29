class KiyibodiEditingValue {
  final String text;
  final bool disabled;

  const KiyibodiEditingValue({
    this.text = '',
    this.disabled = false,
  });

  static const empty = KiyibodiEditingValue();

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
