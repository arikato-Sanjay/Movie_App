extension DoubleExtension on double {
  String conversionToPercentage() {
    return ((this ?? 0) * 10).toStringAsFixed(0) + ' %';
  }
}