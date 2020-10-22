import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    final credentials = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credentials.user;
  }

  User getCurrentUser() {
    return _auth.currentUser;
  }

  Future<User> signIn(String email, String password) async {
    final UserCredential credentials = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credentials.user;
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  void sendEmailConfirmation() async {
    await getCurrentUser().sendEmailVerification();
  }

  Future<User> updateUser({String displayName, String photoURL}) async {
    User user = getCurrentUser();
    await user.updateProfile(displayName: displayName, photoURL: photoURL);
    await user.reload();
    User updatedUser = _auth.currentUser;
    return updatedUser;
  }
}
