class Utility {
  static String truncateText(String text) {
    if (text.length > 8) {
      return '${text.substring(0, 8)}...';
    }
    return text;
  }

  static bool isValidEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }
}
