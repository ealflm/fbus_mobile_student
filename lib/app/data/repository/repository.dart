abstract class Repository {
  /// Google login.
  ///
  /// Return token string.
  Future<String> login(String idToken);
}
