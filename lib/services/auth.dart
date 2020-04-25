import 'package:firebase_auth/firebase_auth.dart';
import 'package:covid19_production_app/models/user.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on firebase user 
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map((FirebaseUser user) => _userFromFirebaseUser(user));
    //.map(_userFromFirebaseUser) will work too
  }


  // sing in anon
  Future SignInAnon() async {
    try{

      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign in email & pass
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // register wiwth email 
  Future signUpWithEmailAndPassword(String email,String password) async{

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      try {
          await user.sendEmailVerification();
          return user.uid;     
        } catch (e) {
        print("An error occured while trying to send email        verification");
        print(e.message);
     }


      //create a new document for the user with uid
      //await DatabaseService(uid:user.uid).updateUserData('normal', 'default name' , 1);
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future SignOut() async {
    try{
    return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}