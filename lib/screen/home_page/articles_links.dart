import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:recycle_app/tools/experience_system.dart';
import 'package:recycle_app/models/myuser.dart';

class Articals_links extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context); // Accessing userData through Provider

    return Scaffold(
      appBar: AppBar(
        title: Text('Articles Links'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('links').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final title = data['title'] as String;
              final url = data['url'] as String;

              return ListTile(
                title: Text(title),
                onTap: () async {
                  await Experience.userGainExp(userData, 10); // Using userData from Provider
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WebView(
                        initialUrl: url,
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
