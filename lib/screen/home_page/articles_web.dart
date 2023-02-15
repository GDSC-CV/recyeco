import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';
import 'package:recycle_app/tools/constants.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Articals_web extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Website'),
      ),
      body: WebView(
        initialUrl: 'https://www.rubicon.com/blog/what-can-be-recycled/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
