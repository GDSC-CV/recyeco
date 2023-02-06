import 'package:firebase_auth/firebase_auth.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  MyUser? _myuserFromFirebaseUser(User? user){
    return user!=null ? MyUser(uid: user.uid,is_anonymous: user.isAnonymous):null;
  }
  Stream<MyUser?> get user{
    return _auth.authStateChanges()
      .map((User? user) => _myuserFromFirebaseUser(user));
  }
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      //print(user);
      return _myuserFromFirebaseUser(user);
    }catch(e){
      //print(e.toString());
      return null;
    }
  }

  Future registerwithEmailandPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      User? user = result.user;
      //print(user!.uid);
      await DatabaseService(uid: user!.uid).updateUserData('Bob',1);
      return _myuserFromFirebaseUser(user);
    }catch(e){
      //print(e.toString());
      return null;
    }
  }

  Future signInwithEmailandPassword(String email,String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      User? user = result.user;
      //print(user);
      return _myuserFromFirebaseUser(user);
    }catch(e){
      //print(e.toString());
      return null;
    }
  }


  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      //print(e);
      return null;
    }
  }





}

