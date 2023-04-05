import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyeco/models/myuser.dart';
import 'package:recyeco/screen/authenticate/authenticate_page.dart';
import 'package:recyeco/screen/home_page/home_page_wrapper.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return const Home_page_wrapper();
    }
  }
}
