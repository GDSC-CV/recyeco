import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/authenticate/authenticate_page.dart';
import 'package:recycle_app/screen/home_page/home_page_wrapper.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    
    if(user == null){
      return const Authenticate();
    }else{
      //print(user.uid);
      return const Home_page_wrapper();
    }
    
  }
}