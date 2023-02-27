import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycle_app/models/myuser.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  Future initialUserData(String name,int level,int experiences,List friends,List friendRequests)async{
    return await userCollection.doc(uid).set({
        'name':name,
        'level':level,
        'experiences': experiences,
        'friends':friends,
        'friendRequests':friendRequests,
      }
    );
  }
  Future updateUserDataInfo(String name,int level,int experiences) async{
    //print("test");
    return await userCollection.doc(uid).update({
        'name':name,
        'level':level,
        'experiences': experiences,
      }
    );
  }
  Future updateUserDataFriend(List friend) async{
    //print("test");
    return await userCollection.doc(uid).update({
        'friends':friend
      }
    );
  }
  Future updateUserDataFriendRequest(List friendRequests) async{
    //print("test");
    return await userCollection.doc(uid).update({
        'friendRequests':friendRequests
      }
    );
  }
  
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid ?? "",
      name: snapshot['name']?? "",
      level: snapshot['level']?? "",
      experiences: snapshot['experiences']?? "",
      friends: snapshot["friends"]?? List.empty(),
      friendRequests: snapshot["friendRequests"]?? List.empty(),
      
    );
  }

  Stream<UserData> get userData{
    return userCollection.doc(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
  /*
  UserData? getSpecificUserData(String uid){
    final data = userCollection.doc(uid);
    data.get().then(
      (DocumentSnapshot doc) {
        return UserData(
          uid: uid ?? "",
          name: doc['name']?? "",
          level: doc['level']?? "",
          experiences: doc['experiences']?? "",
          friends: doc["friends"]?? List.empty(),
          friendRequests: doc["friendRequests"]?? List.empty(),
        );
      },
      onError: (e){
        print("Error getting document: $e");
        return null;
      } 
    );
  }
  */
}