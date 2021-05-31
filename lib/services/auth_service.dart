import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
  );

  //Get uid
  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  //Get current user
  Future getCurrentUser () async {
    return await _firebaseAuth.currentUser();
  }

  //Email & Password Sign Up
  Future<String> createUserWithEmailAndPassword(String email, String password, String name, String confirmPassword) async {
    if(password == confirmPassword){
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      //Update the username
      await updateUserName(name, authResult.user);
      return authResult.user.uid;
    }

  }

  Future<String> updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
    return currentUser.uid;
  }

  //Email & Password Sign In
  Future<String>signInWithEmailAndPassword(String email, String password)async{
    return(await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user.uid;

  }

  //Sign out
  signOut(){
    _firebaseAuth.signOut();
  }

  //Reset Password
  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //Create Anonymous user
  Future signInAnonymously(){
    return _firebaseAuth.signInAnonymously();
  }
}

class NameValidator{
  static String validate(String value){
    if(value.isEmpty){
      return 'Please enter a name';
    }
    if(value.length < 2){
      return 'Name must be at least 2 characters';
    }
    if(value.length > 50){
      return 'Name must be less than 50 characters';
    }
    return null;
  }
}

class EmailValidator{
  static String validate(String value){
    if(value.isEmpty){
      return 'Please enter an email';
    }
    return null;
  }
}

class PasswordValidator{
  static String validate(String value){
    if(value.isEmpty){
      return 'Please enter a password';
    }
    return null;
  }
}