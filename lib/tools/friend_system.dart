import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';

class FriendSystem{

  static Future addFriend(UserData currentUserData,String uid)async{
    var currentUserFriendIDList = currentUserData.friendIDs ;
    var currentUserFriendNameList = currentUserData.friendNames;
    var currentUserFriendLevelList = currentUserData.friendLevels;
    
    var otherUserDataStream = DatabaseService(uid: uid).userData;
    
    UserData otherUserData=UserData(uid: '1', name: "Something went wrong", level: 1, experiences: 1, friendIDs: List.empty(), friendIDRequests: List.empty(), friendNames: List.empty(), friendNameRequests: List.empty(), friendLevels: List.empty(), friendLevelRequests: List.empty());
    String otherUserId = "";
    String otherUserName = "";
    int otherUserLevel=0;
    List friendRequestsID = List.empty(growable: true);
    List friendRequestsName = List.empty(growable: true);
    List friendRequestsLevel = List.empty(growable: true);
    await otherUserDataStream.firstWhere((element){
      otherUserData =  element;
      friendRequestsID = otherUserData.friendIDRequests;
      friendRequestsName = otherUserData.friendNameRequests;
      friendRequestsLevel = otherUserData.friendLevelRequests;
      otherUserId = otherUserData.uid;
      otherUserName=otherUserData.name;
      otherUserLevel=otherUserLevel;
      currentUserFriendIDList.add(otherUserId);
      currentUserFriendNameList.add(otherUserName);
      currentUserFriendLevelList.add(otherUserLevel);
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
    
    
    
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendLevelList);
    
    friendRequestsID.add(currentUserData.uid);
    friendRequestsName.add(currentUserData.name);
    friendRequestsLevel.add(currentUserData.level);
    return await DatabaseService(uid: uid).updateUserDataFriendRequest(friendRequestsID,friendRequestsName,friendRequestsLevel);
  }
  static Future acceptFriend(UserData currentUserData,String uid,String name,int Level)async{
    var currentUserFriendIDList = currentUserData.friendIDs ;
    var currentUserFriendNameList = currentUserData.friendNames;
    var currentUserFriendLevelList = currentUserData.friendLevels;
    
    currentUserFriendIDList.add(uid);
    currentUserFriendNameList.add(name);
    currentUserFriendLevelList.add(Level);

    return await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendLevelList);
    
  }
  static Future DeleteFriendRequest(UserData currentUserData,String uid,String name,int Level)async{
    var currentUserFriendIDList = currentUserData.friendIDRequests ;
    var currentUserFriendNameList = currentUserData.friendNameRequests;
    var currentUserFriendLevelList = currentUserData.friendLevelRequests;
    
    currentUserFriendIDList.remove(uid);
    currentUserFriendNameList.remove(name);
    currentUserFriendLevelList.remove(Level);
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriendRequest(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendLevelList);
    
  }
  static Future updateFriend(UserData currentUserData)async{
    var currentUserFriendIDList = currentUserData.friendIDs ;
    var currentUserFriendNameList = currentUserData.friendNames;
    var currentUserFriendLevelList = currentUserData.friendLevels;
    for(int i=0;i<currentUserFriendIDList.length;i++){
      String uid = currentUserFriendIDList[i];
      var otherUserDataStream = DatabaseService(uid: uid).userData;
    
      UserData otherUserData=UserData(uid: '1', name: "Something went wrong", level: 1, experiences: 1, friendIDs: List.empty(), friendIDRequests: List.empty(), friendNames: List.empty(), friendNameRequests: List.empty(), friendLevels: List.empty(), friendLevelRequests: List.empty());
      String otherUserId = "";
      String otherUserName = "";
      int otherUserLevel=0;
      await otherUserDataStream.firstWhere((element){
        otherUserData =  element;
        otherUserId = otherUserData.uid;
        otherUserName=otherUserData.name;
        otherUserLevel=otherUserData.level;
        //print(otherUserName);
        return true;
      });
      currentUserFriendIDList[i]=otherUserId;
      currentUserFriendNameList[i]=otherUserName;
      currentUserFriendLevelList[i]=otherUserLevel;
    }
    for(int i=0;i<currentUserFriendIDList.length-1;i++){
      for(int j=i+1;j<currentUserFriendIDList.length;j++){
        if(currentUserFriendLevelList[j]>currentUserFriendLevelList[i]){
          String tId = "";
          String tName = "";
          int tLevel=0;
          tId=currentUserFriendIDList[j];
          tName=currentUserFriendNameList[j];
          tLevel=currentUserFriendLevelList[j];
          currentUserFriendIDList[j] = currentUserFriendIDList[i];
          currentUserFriendNameList[j] = currentUserFriendNameList[i];
          currentUserFriendLevelList[j] = currentUserFriendLevelList[i];
          currentUserFriendIDList[i] = tId;
          currentUserFriendNameList[i] = tName;
          currentUserFriendLevelList[i] = tLevel;
          
        }
      }
    }
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendIDList,currentUserFriendNameList,currentUserFriendLevelList);
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