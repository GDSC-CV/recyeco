import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';

class FriendSystem{

  static Future addFriend(UserData currentUserData,String uid)async{
    var currentUserFriendList = currentUserData.friends;
    currentUserFriendList.add(uid);
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendList);
    var otherUserDataStream = DatabaseService(uid: uid).userData;
    
    UserData otherUserData;
    List friendRequests = List.empty(growable: true);
    otherUserDataStream.listen(
      (event) {
        otherUserData =  event;
        friendRequests = otherUserData.friendRequests;
      },
      onError: (err){
        print(err);
        return null;
      }
    );
    friendRequests.add(currentUserData.uid);
    return await DatabaseService(uid: uid).updateUserDataFriendRequest(friendRequests);
  }
  static Future acceptFriend(UserData currentUserData,String uid)async{
    var currentUserFriendList = currentUserData.friends;
    currentUserFriendList.add(uid);
    return await DatabaseService(uid:currentUserData.uid).updateUserDataFriend(currentUserFriendList);
    
  }
  static Future DeleteFriendRequest(UserData currentUserData,String uid)async{
    var currentUserFriendRequestList = currentUserData.friendRequests;
    currentUserFriendRequestList.remove(uid);
    await DatabaseService(uid:currentUserData.uid).updateUserDataFriendRequest(currentUserFriendRequestList);
    
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
  //   twoDList.sort((x,y)=>(x[1] as dynamic).compareTo((y[1] as dynamic)));
  //   return twoDList;
    
  // }
}