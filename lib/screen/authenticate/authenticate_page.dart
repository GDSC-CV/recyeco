import 'package:flutter/material.dart';
import 'package:recyeco/screen/authenticate/sign_up.dart';
import 'package:recyeco/screen/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleShow() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggle: toggleShow);
    } else {
      return SignupWidget(toggle: toggleShow);
    }
  }
}
