import 'package:flutter/material.dart';
import 'package:recycle_app/screen/authenticate/register.dart';
import 'package:recycle_app/screen/authenticate/sign_in.dart';
import 'package:recycle_app/screen/authenticate/sign_in_UI.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleShow(){
    setState(() {
      showSignIn = !showSignIn;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggle: toggleShow);
    }else{
      return Register(toggle: toggleShow);
    }
    
  }
}