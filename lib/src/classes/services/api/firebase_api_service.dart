import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user_model.dart';
import '../protocols/firebase_service_protocol.dart';

class FirebaseAPIService implements FirebaseServiceProtocol {
  @override
  Future<void> userIsLogged(String username) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Future<UserModel> checkUser() async {
    final result = FirebaseAuth.instance.currentUser;

    return UserModel(
      id: result?.uid,
      email: result?.email,
      name: result?.displayName,
      phoneNumber: result?.phoneNumber,
    );
  }

  @override
  Future<bool> signIn(String username, String password) async {
    try {
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      if (result.user == null) {
        return false;
      }
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }

  @override
  Future<bool> signUp(String username, String password) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      if (result.user == null) {
        return false;
      }
      return true;
    } catch (error) {
      print(error);
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> changePassword(String password) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

  @override
  Future<void> passwordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendVerificationEmail() async {
    await FirebaseAuth.instance.setLanguageCode("es");
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> updateUserName(String name) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    }
  }

  @override
  Future<void> updateUserPhoto(String photo) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(photo);
    }
  }
}
