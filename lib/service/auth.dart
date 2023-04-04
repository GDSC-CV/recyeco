import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      await DatabaseService(uid: user!.uid).initialUserData("Bob", 1,10, List.empty(), List.empty(), List.empty(), List.empty(), List.empty(), List.empty());
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
      await DatabaseService(uid: user!.uid).initialUserData("Bob", 1,10, List.empty(), List.empty(), List.empty(), List.empty(), List.empty(), List.empty());
      return _myuserFromFirebaseUser(user);
    }catch(e){
      //print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle()async{
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]
      ).signIn();
      
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;
      //print(user);
      await DatabaseService(uid: user!.uid).updateUserDataInfo(user.displayName!,1,10);
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
  Future resetPassword(String email)async{
    await _auth.sendPasswordResetEmail(email: email);
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

