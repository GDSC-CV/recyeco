import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/models/user_property.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name,int level) async{
    //print("test");
    return await userCollection.doc(uid).set({
        'name':name,
        'level':level,
      }
    );
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid ?? "",
      name: snapshot['name']?? "",
      level: snapshot['level']?? "",
    );
  }


  List<UserProperty> _userPropertylistfromSnapshots(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return UserProperty(
        name: doc.get('name') ?? "",
        level: doc.get('level') ?? "",
      );
    }).toList();
  }

  Stream<List<UserProperty>?> get users{
    return userCollection.snapshots().map(
      _userPropertylistfromSnapshots
    );
  }

  Stream<UserData> get userData{
    return userCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}