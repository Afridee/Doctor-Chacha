import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

@immutable
class User {
  const User({@required this.uid});
  final String uid;
}

@immutable
class PhoneUser {
  const PhoneUser({@required this.uid, @required this.smsSent,@required this.verificationID, });
  final String uid;
  final String verificationID;
  final bool smsSent;
}

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<User> fbLogin() async {
    FacebookLogin facebookSignIn  = new FacebookLogin();
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

        final FacebookAccessToken accessToken = result.accessToken;

        final authResult = await  FirebaseAuth.instance.signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: accessToken.token),
        );

        return _userFromFirebase(authResult.user);
  }

  Future<User> googleLogin() async {

        GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
          ],
        );

        final GoogleSignInAccount googleUser = await _googleSignIn.signIn().catchError((onError) {});
        final GoogleSignInAccount currentUser = _googleSignIn.currentUser;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

        final FirebaseUser user = (await _firebaseAuth.signInWithCredential(credential)).user;

        return _userFromFirebase(user);
  }


  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}