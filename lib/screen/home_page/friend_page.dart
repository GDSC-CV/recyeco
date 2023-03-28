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
    List userFriends = userData.friends;
    
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed:()async{
                
                bool message = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Provider(
                      create: (context) => userData,
                      builder: (context, child) => const AddFriendPage(),
                    ),
                  ),
                );
                
                if(message==true){
                  
                  setState(() {
                    
                  });
                }
              }, 
              child: Text("Add friend")
            ),
            Expanded(
              
              
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: userFriends.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.blueGrey,
                    child: Center(child: Text(userFriends[index])),
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
    List userFriendRequests = userData.friendRequests;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            
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
                if(userData.friends.contains(_friendId)){
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
                itemCount: userFriendRequests.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 50,
                    color: Colors.blueGrey,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(
                          userFriendRequests[index]
                        ),
                        SizedBox(width: 20,),
                        IconButton(onPressed: (){
                          FriendSystem.acceptFriend(userData, userFriendRequests[index]);
                          FriendSystem.DeleteFriendRequest(userData, userFriendRequests[index]);
                          setState(() {
                            
                          });
                        }, icon: Icon(Icons.check)),
                        IconButton(onPressed: (){
                          FriendSystem.DeleteFriendRequest(userData, userFriendRequests[index]);
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