import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/home_page/my_home_page.dart';
import 'package:recycle_app/service/database.dart';

class Home_page_wrapper extends StatelessWidget {
  const Home_page_wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
  
    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: user!.uid).userData,
      initialData: UserData(level: 1,name: "Bob",uid: "PP",experiences: 10),
      builder: (context, child){
        return const MyHomePage(title: "Recycle");
      }
      
    );
  }
}