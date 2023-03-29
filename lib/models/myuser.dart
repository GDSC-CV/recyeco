class MyUser{

  final String? uid;
  final bool? is_anonymous;
  MyUser({this.uid,this.is_anonymous});

}


class UserData{
  final String uid;
  final String name;
  final int level;
  final int experiences;
  final List friendIDs;
  final List friendIDRequests;
  final List friendNames;
  final List friendNameRequests;
  final List friendExps;
  final List friendExpRequests;
  
  
  UserData({required this.uid,required this.name,required this.level,
            required this.experiences,required this.friendIDs,required this.friendIDRequests,
            required this.friendNames,required this.friendNameRequests,
            required this.friendExps,required this.friendExpRequests});
}