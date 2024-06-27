import 'package:easy_coffee/modules/users.dart';
import 'package:easy_coffee/shared/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //  it is a firebase object used to access the methods in firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

//now we are going to create a sign anonumous function
//going to create a user object based on firebase

  users? _userFromFirebase(User? user) {
    return user != null ? users(uid: user!.uid) : null;
  }

// stream is used to get the details of wheather the user is sign in or not
  //it will give a list of map
  Stream<users?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
    // these passes the user we get back down the stream to the users class we created
  }

  Future<users?> signInAno() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // these
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print(result.user);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// thes functionis for registor email and password formate check using a firebase function
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      // print(result.user);
      //creating a new documnet for the user with the uid
      await DatabaseServices(uid: user?.uid ?? '')
          .UpdateUserData('0', 'new crew member', 100);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// get signout function
  Future Signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
