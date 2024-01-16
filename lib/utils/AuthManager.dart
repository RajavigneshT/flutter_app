class AuthManager {
  static String? _token;

  static void saveToken(String token) {
    _token = token;
    // You may want to store the token securely, like using shared preferences
    // For simplicity, we're storing it in-memory in this example
  }

  static String? getToken() {
    return _token;
  }

  static void clearToken() {
    _token = null;
    // You may want to clear the stored token, e.g., remove it from shared preferences
  }

  static bool isAuthenticated() {
    return _token != null;
  }
}
