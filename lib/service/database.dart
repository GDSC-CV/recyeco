import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycle_app/models/myuser.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name,int level,int experiences) async{
    //print("test");
    return await userCollection.doc(uid).set({
        'name':name,
        'level':level,
        'experiences': experiences,
      }
    );
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid ?? "",
      name: snapshot['name']?? "",
      level: snapshot['level']?? "",
      experiences: snapshot['experiences']?? "",
    );
  }

  Stream<UserData> get userData{
    return userCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}