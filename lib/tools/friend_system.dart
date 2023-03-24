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
}