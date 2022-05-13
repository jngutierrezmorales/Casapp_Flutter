import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../models/user_model.dart';
import '../protocols/auth_service_protocol.dart';

class AuthService extends AuthServiceProtocol {
  @override
  Future<void> firebaseAuthState(String username) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Future<UserModel> firebaseCheckUser() async {
    final result = FirebaseAuth.instance.currentUser;

    return UserModel(
      id: result?.uid,
      email: result?.email,
      name: result?.displayName,
      phoneNumber: result?.phoneNumber,
    );
  }

  @override
  Future<bool> firebaseSignIn(String username, String password) async {
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
  Future<bool> firebaseCreateAccount(String username, String password) async {
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
  Future<void> firebaseUpdateUserName(String name) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
    }
  }

  @override
  Future<void> firebaseUpdateUserPhoto(String photo) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser?.updatePhotoURL(photo);
    }
  }

  @override
  Future<void> firebaseSendVerificationEmail() async {
    await FirebaseAuth.instance.setLanguageCode("es");
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> firebaseSetPassword(String password) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(password);
  }

  @override
  Future<void> firebasePasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> firebaseSignInAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<void> firebaseSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
