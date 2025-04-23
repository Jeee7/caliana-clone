class Utility {
  static String truncateText(String text) {
    if (text.length > 8) {
      return '${text.substring(0, 8)}...';
    }
    return text;
  }
}
