import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:recycle_app/tools/experience_system.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:recycle_app/screen/home_page/setting_page.dart';
import 'package:recycle_app/screen/home_page/friend_page.dart';
import 'package:recycle_app/tools/friend_system.dart';

class Articals_links extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    UserData userData =
        Provider.of<UserData>(context); // Accessing userData through Provider

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
            //onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 93.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                              width: 328.1,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              alignment: AlignmentDirectional(0, -1),
                              child: GradientText(
                                'Articles',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Playfair Display',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                ),
                                colors: [Color(0xFF3CDAC7), Color(0xFF5533C1)],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              )),
                        ),
                        Divider(
                          thickness: 2,
                          indent: 60,
                          endIndent: 60,
                          color: Color(0xFF090347),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
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
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final doc = docs[index];
                      final data = doc.data() as Map<String, dynamic>;
                      final title = data['title'] as String;
                      final url = data['url'] as String;

                      return // Generated code for this Container Widget...
                          Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                        child: InkWell(
                          onTap: () async {
                            await Experience.userGainExp(
                                userData, 10); // Using userData from Provider
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WebView(
                                  initialUrl: url,
                                  javascriptMode: JavascriptMode.unrestricted,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 83.1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0x783CDAC7), Color(0x724A38F2)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(1, -0.64),
                                end: AlignmentDirectional(-1, 0.64),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            title,
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Playfair Display',
                                              color: Color(0xFF12087C),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0x00EEEEEE),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color(0x1A57636C),
                                offset: Offset(0, -10),
                                spreadRadius: 0.1,
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IconButton(
                        // borderColor: Color(0x00F1F4F8),
                        // borderRadius: 30,
                        // borderWidth: 1,
                        // buttonSize: 60,
                        icon: Icon(
                          Icons.home_outlined,
                          color: Color(0xFF090347),
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                      ),
                      IconButton(
                        // borderColor: Colors.transparent,
                        // borderRadius: 30,
                        // borderWidth: 1,
                        // buttonSize: 60,
                        icon: Icon(
                          Icons.people_outline,
                          color: Color(0xFF090347),
                          size: 35,
                        ),
                        onPressed: () async {
                          await FriendSystem.updateFriend(userData);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Provider(
                                create: (context) => userData,
                                builder: (context, child) =>
                                    const FriendWidget(),
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        // borderColor: Colors.transparent,
                        // borderRadius: 30,
                        // borderWidth: 1,
                        // buttonSize: 60,
                        icon: Icon(
                          Icons.format_list_bulleted,
                          color: Color(0xFF090347),
                          size: 35,
                        ),
                        onPressed: () async {
                          // context.pushNamed('Article');
                        },
                      ),
                      IconButton(
                        // borderColor: Colors.transparent,
                        // borderRadius: 30,
                        // borderWidth: 1,
                        // buttonSize: 60,
                        icon: Icon(
                          Icons.settings_outlined,
                          color: Color(0xFF090347),
                          size: 35,
                        ),
                        onPressed: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => Provider(
                                create: (context) => userData,
                                builder: (context, child) =>
                                    const SettingWidget(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
