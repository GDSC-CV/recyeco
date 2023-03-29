import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';

class FriendSystem{

  static Future addFriend(UserData currentUserData,String uid)async{
    var currentUserFriendIDList = currentUserData.friendIDs ;
    var currentUserFriendNameList = currentUserData.friendNames;
    var currentUserFriendExpList = currentUserData.friendExps;
    
    var otherUserDataStream = DatabaseService(uid: uid).userData;
    
    UserData otherUserData=UserData(uid: '1', name: "Something went wrong", level: 1, experiences: 1, friendIDs: List.empty(), friendIDRequests: List.empty(), friendNames: List.empty(), friendNameRequests: List.empty(), friendExps: List.empty(), friendExpRequests: List.empty());
    String otherUserId = "";
    String otherUserName = "";
    int otherUserExp=0;
    List friendRequestsID = List.empty(growable: true);
    List friendRequestsName = List.empty(growable: true);
    List friendRequestsExp = List.empty(growable: true);
    otherUserDataStream.firstWhere((element){
      otherUserData =  element;
      friendRequestsID = otherUserData.friendIDRequests;
      friendRequestsName = otherUserData.friendNameRequests;
      friendRequestsExp = otherUserData.friendExpRequests;
      otherUserId = otherUserData.uid;
      otherUserName=otherUserData.name;
      otherUserExp=otherUserExp;
      print(otherUserId);
      currentUserFriendIDList.add(otherUserId);
      currentUserFriendNameList.add(otherUserName);
      currentUserFriendExpList.add(otherUserExp);
      return true;
    });
    // otherUserDataStream.listen(
    //   (event) {
        
        
    //     //print(otherUserData.name);
    //   },
    //   onDone: () {
        
    //   },
    //   onError: (err){
    //     print(err);
    //     return null;
    //   }
    // );
    
    
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendExpList);
    
    friendRequestsID.add(currentUserData.uid);
    friendRequestsName.add(currentUserData.name);
    friendRequestsExp.add(currentUserData.experiences);
    return await DatabaseService(uid: uid).updateUserDataFriendRequest(friendRequestsID,friendRequestsName,friendRequestsExp);
  }
  static Future acceptFriend(UserData currentUserData,String uid,String name,int exp)async{
    var currentUserFriendIDList = currentUserData.friendIDs ;
    var currentUserFriendNameList = currentUserData.friendNames;
    var currentUserFriendExpList = currentUserData.friendExps;
    
    currentUserFriendIDList.add(uid);
    currentUserFriendNameList.add(name);
    currentUserFriendExpList.add(exp);

    return await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendExpList);
    
  }
  static Future DeleteFriendRequest(UserData currentUserData,String uid,String name,int exp)async{
    var currentUserFriendIDList = currentUserData.friendIDRequests ;
    var currentUserFriendNameList = currentUserData.friendNameRequests;
    var currentUserFriendExpList = currentUserData.friendExpRequests;
    
    currentUserFriendIDList.remove(uid);
    currentUserFriendNameList.remove(name);
    currentUserFriendExpList.remove(exp);
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriendRequest(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendExpList);
    
  }
  // static Future getRankedFriend(UserData currentUserData)async{
  //   var currentUserFriendList = currentUserData.friends;
  //   int row = currentUserFriendList.length;

  //   var twoDList = List.generate(row, (i) => List.of(["name",0]), growable: false);
  //   for (var i = 0; i < twoDList.length; i++) {
  //     var otherUserDataStream = DatabaseService(uid: currentUserFriendList[i]).userData;
  //     UserData otherUserData=UserData(uid: "1", name: "1", level: 1, experiences: 1, friends: List.empty(), friendRequests: List.empty());
  //     otherUserDataStream.listen(
  //       (event) {
  //         otherUserData =  event;
  //       },
  //       onError: (err){
  //         print(err);
  //         return null;
  //       }
  //     );
  //     twoDList[i][0] = otherUserData.name;
  //     twoDList[i][1] = otherUserData.experiences;

  //   }
  //   //twoDList.sort((x,y)=>(x[1] as dynamic).compareTo((y[1] as dynamic)));
  //   return twoDList;
    
  // }
}