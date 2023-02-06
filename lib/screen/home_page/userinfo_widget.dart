import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';

class userInfo_widget extends StatefulWidget {
  const userInfo_widget({super.key});

  @override
  State<userInfo_widget> createState() => _userInfo_widgetState();
}

class _userInfo_widgetState extends State<userInfo_widget> {
  @override
  final _auth = FirebaseAuth.instance;
  String? userEmail;
  
  void getCurrentUserInfo() async {
    //user = await _auth.currentUser();
    userEmail = _auth.currentUser?.email; 
  }

  Widget build(BuildContext context) {

    final user = Provider.of<UserData>(context);
    getCurrentUserInfo();
    return UserAccountsDrawerHeader(
      //todo
      accountName: Text(user.name),
      accountEmail: Text(userEmail??" "),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
  }
}