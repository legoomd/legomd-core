class StringUtil {
  /// Returns true if the string is null or 0-length.
  static bool isEmpty(str) {
    return str == null || str.trim().isEmpty || str.trim() == "";
  }

  static overflow(String str, int length) {
    if (!isEmpty(str))
      return str.length > length ? str.substring(0, length) + "..." : str;
  }
}
