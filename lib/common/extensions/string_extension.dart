extension StringExtension on String {
  String stringTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }
}