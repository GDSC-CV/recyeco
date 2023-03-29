import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recycle_app/models/myuser.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  Future initialUserData(String name,int level,int experiences,List friendIDs,List friendIDRequests,List friendsName,List friendsNameRequest,List friendsLevel, List friendsLevelRequest)async{
    return await userCollection.doc(uid).set({
        'name':name,
        'level':level,
        'experiences': experiences,
        'friendIDs':friendIDs,
        'friendIDRequests':friendIDRequests,
        'friendNames':friendsName,
        'friendNameRequests':friendsNameRequest,
        'friendLevels':friendsLevel,
        'friendLevelRequests':friendsLevelRequest
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
  Future updateUserDataFriend(List friendIDs,List friendsName,List friendsLevel) async{
    //print("test");
    return await userCollection.doc(uid).update({
        'friendIDs':friendIDs,
        'friendNames':friendsName,
        'friendLevels':friendsLevel,
        
      }
    );
  }
  Future updateUserDataFriendRequest(List friendIDRequests,List friendsNameRequest, List friendsLevelRequest) async{
    //print("test");
    return await userCollection.doc(uid).update({
        'friendIDRequests':friendIDRequests,
        'friendNameRequests':friendsNameRequest,
        'friendLevelRequests':friendsLevelRequest
      }
    );
  }
  
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid ?? "",
      name: snapshot['name']?? "",
      level: snapshot['level']?? "",
      experiences: snapshot['experiences']?? "",
      friendIDs: snapshot["friendIDs"]?? List.empty(),
      friendIDRequests: snapshot["friendIDRequests"]?? List.empty(),
      friendNames: snapshot["friendNames"]?? List.empty(),
      friendNameRequests: snapshot["friendNameRequests"]?? List.empty(),
      friendLevels: snapshot["friendLevels"]?? List.empty(),
      friendLevelRequests: snapshot["friendLevelRequests"]?? List.empty(),
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