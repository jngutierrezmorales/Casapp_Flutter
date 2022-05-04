abstract class AuthServiceProtocol {
  Future<void> firebaseAuthState(String username);
  Future<bool> firebaseSignIn(String username, String password);
  Future<bool> firebaseCreateAccount(String username, String password);
  Future<void> firebaseUpdateUserProfile(String name, String photo);
  Future<void> firebaseSendVerificationEmail();
  Future<void> firebaseSetPassword(String password);
  Future<void> firebasePasswordResetEmail(String email);
  Future<void> firebaseSignInAnonymously();
  Future<void> firebaseSignOut();
}
