import '../../models/user_model.dart';

abstract class FirebaseServiceProtocol {
  Future<void> userIsLogged(String username);
  Future<UserModel> checkUser();
  Future<bool> signIn(String username, String password);
  Future<bool> signUp(String username, String password);
  Future<void> signOut();
  Future<void> signInAnonymously();
  //TODO: separate authentication methods from others in other classes
  Future<void> changePassword(String password);
  Future<void> passwordResetEmail(String email);
  Future<void> sendVerificationEmail();
  Future<void> updateUserName(String name);
  Future<void> updateUserPhoto(String photo);
}
