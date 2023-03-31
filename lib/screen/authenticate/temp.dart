import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';
import 'package:recycle_app/tools/constants.dart';
import 'package:recycle_app/tools/friend_system.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({super.key});

  @override
  State<FriendPage> createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  
  final _formKey = GlobalKey<FormState>();
  String _friendId = "";
  bool refresh = false;
  
  @override
  Widget build(BuildContext context) {
    
    UserData userData = Provider.of<UserData>(context);
    var currentUserFriendIDList = userData.friendIDs ;
    var currentUserFriendNameList = userData.friendNames;
    var currentUserFriendLevelList = userData.friendLevels;
    // void init(UserData userData)async{
    //   friendsData = await FriendSystem.getRankedFriend(userData);
    // }
    // init(userData);
    
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed:()async{
                await FriendSystem.updateFriend(userData);
                bool message = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Provider(
                      create: (context) => userData,
                      builder: (context, child) => const AddFriendPage(),
                    ),
                  ),
                );
                
                if(message==true){
                  
                  setState((){
                    //await FriendSystem.updateFriend(userData);
                  });
                }
              }, 
              child: Text("Add friend")
            ),
            Expanded(
              
              
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: currentUserFriendIDList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.blueGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          currentUserFriendNameList[index]+" Level "+currentUserFriendLevelList[index].toString()
                        )
                      ],
                    )
                  );
                  
                }
              ),
            ),
            
          ]
        )
      );
    
  }
}

//add Friend Page
class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final _formKey = GlobalKey<FormState>();
  String _friendId = "";
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    //This is Request
    var currentUserFriendIDList = userData.friendIDRequests ;
    var currentUserFriendNameList = userData.friendNameRequests;
    var currentUserFriendLevelList = userData.friendLevelRequests;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ()async{
            await FriendSystem.updateFriend(userData);
            Navigator.pop(context,true);
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            const SizedBox(height: 30,),
            const Text(
              "Your ID",
              style: TextStyle(
                fontSize: 40
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: (){
                    Clipboard.setData(ClipboardData(text: userData.uid));
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.black,
                  ),
                  label: Text(
                    userData.uid,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Text(
              "Enter Your Friend's ID!",
              style: TextStyle(
                fontSize: 20
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
              child: TextFormField(
                decoration: inputTextDecoration.copyWith(hintText: 'Your Friend\'s ID'),
                validator: (val) => val!.isEmpty ? 'Please enter a id' : null,
                onChanged: (val) => setState(() => _friendId = val),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.grey[50],
              ),
              child: const Text(
                'confirm'
              ),
              onPressed: () async {
                if(userData.friendIDs.contains(_friendId)){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        content: Text("ID Error or You already are friends!"),
                      );
                  });
                }else{
                  await FriendSystem.addFriend(userData, _friendId);
                }
              }
               
              
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: currentUserFriendIDList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 50,
                    color: Colors.blueGrey,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(
                          currentUserFriendNameList[index]
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "Level "+currentUserFriendLevelList[index].toString()
                        ),
                        SizedBox(width: 20,),
                        IconButton(onPressed: (){
                          FriendSystem.acceptFriend(userData,currentUserFriendIDList[index],currentUserFriendNameList[index],currentUserFriendLevelList[index]);
                          FriendSystem.DeleteFriendRequest(userData,currentUserFriendIDList[index],currentUserFriendNameList[index],currentUserFriendLevelList[index]);
                          setState(() {
                            
                          });
                        }, icon: Icon(Icons.check)),
                        IconButton(onPressed: (){
                          FriendSystem.DeleteFriendRequest(userData,currentUserFriendIDList[index],currentUserFriendNameList[index],currentUserFriendLevelList[index]);
                          setState(() {
                            
                          });
                        }, icon: Icon(Icons.cancel_outlined))
                      ],
                    ),
                  );
                }
              ),
            )
            
          ],
        )
      ),
    );
  }
}


/*
children: [
                    
                    
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                      child: Container(
                        width: 100,
                        height: 67.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, -0.64),
                            end: AlignmentDirectional(-1, 0.64),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Icon(
                                Icons.face,
                                color: Colors.white,
                                size: 46,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    'Level 13',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: IconButton(
                                // borderColor: Color(0x00FFFFFF),
                                // borderRadius: 30,
                                // borderWidth: 1,
                                // buttonSize: 55,
                                // fillColor: Colors.white,
                                icon: Icon(
                                  Icons.send_rounded,
                                  color: Color(0xFF4A38F2),
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
*/