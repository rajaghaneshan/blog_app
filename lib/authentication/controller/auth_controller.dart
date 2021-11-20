import 'package:blog_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  Future signInWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    UserCredential userCredential =
        await firebaseAuth.signInWithCredential(authCredential);
    if (userCredential != null) {
      await usersRef.doc(userCredential.user!.uid).set({
        'name': userCredential.user!.displayName,
        'user_id': userCredential.user!.uid,
        'email': userCredential.user!.email,
        'timestamp': DateTime.now(),
        'photoUrl': userCredential.user!.photoURL,
      });
    }
  }

  Future signOut() async {
    googleSignIn.signOut();
  }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future signUpWithEmail(String email, String password, String name) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await usersRef.doc(userCredential.user!.uid).set({
        'name': name,
        'user_id': userCredential.user!.uid,
        'email': email,
        'timestamp': DateTime.now(),
        'photoUrl': userCredential.user!.photoURL,
      });
    } catch (e) {
      print(e);
    }
    // firebaseAuth.signOut();
  }
}
