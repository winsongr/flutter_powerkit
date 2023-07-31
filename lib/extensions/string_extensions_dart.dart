extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  bool isValidEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
    return emailRegex.hasMatch(this);
  }

  String removeAllWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }
}
