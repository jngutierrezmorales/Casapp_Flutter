abstract class AuthServiceProtocol {
  Future<void> firebaseAuthState(String username);
  Future<bool> firebaseSignIn(String username, String password);
  Future<bool> firebaseCreateAccount(String username, String password);
  Future<void> updateUserProfile(String name, String photo);
  Future<void> sendVerificationEmail();
  Future<void> setPassword(String password);
  Future<void> passwordResetEmail(String email);
  Future<void> signInAnonymously();
  Future<void> signOut();
}
