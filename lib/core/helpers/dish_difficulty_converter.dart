extension DoubleExtension on double {
  String toFractionString() {
    final parts = toString().split('.');
    if (parts.length == 1) {
      return parts[0];
    } else {
      return '${parts[0]}/${parts[1]}';
    }
  }
}
