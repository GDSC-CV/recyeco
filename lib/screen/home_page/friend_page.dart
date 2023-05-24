import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyeco/models/myuser.dart';
import 'package:recyeco/screen/home_page/friend_add_page.dart';
import 'package:recyeco/screen/home_page/setting_page.dart';
import 'package:recyeco/tools/friend_system.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:recyeco/screen/home_page/articles_links.dart';
import 'package:flutter/animation.dart';

class FriendWidget extends StatefulWidget {
  const FriendWidget({Key? key}) : super(key: key);

  @override
  _FriendWidgetState createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget> {
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context);
    var currentUserFriendIDList = userData.friendIDs;
    var currentUserFriendNameList = userData.friendNames;
    var currentUserFriendLevelList = userData.friendLevels;

    var currentUserFriendRequestIDList = userData.friendIDRequests;
    var currentUserFriendRequestNameList = userData.friendNameRequests;
    var currentUserFriendRequestLevelList = userData.friendLevelRequests;
    if (currentUserFriendIDList.length == 0 &&
        currentUserFriendRequestIDList.length == 0) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(),
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
                                decoration: BoxDecoration(color: Colors.white),
                                alignment: AlignmentDirectional(0, -1),
                                child: GradientText(
                                  'Friends',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Playfair Display',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60,
                                  ),
                                  colors: [
                                    Color(0xFF6420AB),
                                    Color(0xFF3CDAC7)
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ).animate(
                                effects: [
                                  MoveEffect(
                                    curve: Curves.easeInOut,
                                    delay: 0.ms,
                                    duration: 600.ms,
                                    begin: Offset(-100, 0),
                                    end: Offset(0, 0),
                                  ),
                                ],
                              ),
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 10, 12),
                        child: Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x783CDAC7), Color(0x724A38F2)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(1, -0.64),
                              end: AlignmentDirectional(-1, 0.64),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: InkWell(
                            onTap: () async {
                              await FriendSystem.updateFriend(userData);
                              bool message = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Provider(
                                    create: (context) => userData,
                                    builder: (context, child) =>
                                        const FriendAddWidget(),
                                  ),
                                ),
                              );

                              if (message == true) {
                                setState(() {
                                  //await FriendSystem.updateFriend(userData);
                                });
                              }
                            },
                            child: Text(
                              'Add Friends Now!',
                              style: GoogleFonts.getFont(
                                'Playfair Display',
                                color: Color(0xFF090347),
                                fontWeight: FontWeight.w600,
                                fontSize: 40,
                                fontStyle: FontStyle.normal,
                              ),
                            ).animate(
                              effects: [
                                MoveEffect(
                                  curve: Curves.easeInOut,
                                  delay: 0.ms,
                                  duration: 600.ms,
                                  begin: Offset(-100, 0),
                                  end: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'You have no friends. :(',
                  style: GoogleFonts.getFont(
                    'Playfair Display',
                    color: Color(0xFF090347),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
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
                            onPressed: () async {},
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Provider(
                                    create: (context) => userData,
                                    builder: (context, child) =>
                                        Articals_links(),
                                  ),
                                ),
                              ); // context.pushNamed('Article');
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
            ).animate(
              effects: [
                FadeEffect(
                  curve: Curves.easeInOut,
                  delay: 0.ms,
                  duration: 600.ms,
                  begin: 0,
                  end: 1,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(),
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
                                decoration: BoxDecoration(color: Colors.white),
                                alignment: AlignmentDirectional(0, -1),
                                child: GradientText(
                                  'Friends',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Playfair Display',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60,
                                  ),
                                  colors: [
                                    Color(0xFF6420AB),
                                    Color(0xFF3CDAC7)
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ).animate(
                                  effects: [
                                    MoveEffect(
                                      curve: Curves.easeInOut,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(-100, 0),
                                      end: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              ),
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 36.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: InkWell(
                          onTap: () async {
                            await FriendSystem.updateFriend(userData);
                            bool message = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Provider(
                                  create: (context) => userData,
                                  builder: (context, child) =>
                                      const FriendAddWidget(),
                                ),
                              ),
                            );

                            if (message == true) {
                              setState(() {
                                //await FriendSystem.updateFriend(userData);
                              });
                            }
                          },
                          child: Text(
                            'Add Friends',
                            style: GoogleFonts.getFont(
                              'Playfair Display',
                              color: Color(0xFF090347),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: currentUserFriendRequestIDList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                          child: Container(
                            width: 100,
                            height: 67.8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF6420AB),
                                  Color.fromARGB(255, 152, 127, 235)
                                ],
                                stops: [0, 1],
                                begin: AlignmentDirectional(-1, 0),
                                end: AlignmentDirectional(1, 0),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: Icon(
                                    Icons.face_retouching_natural,
                                    color: Colors.white,
                                    size: 46,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentUserFriendRequestNameList[index],
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Playfair Display',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        'invite',
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Playfair Display',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 10, 10),
                                  child: InkWell(
                                    onTap: () {
                                      FriendSystem.acceptFriend(
                                          userData,
                                          currentUserFriendRequestIDList[index],
                                          currentUserFriendRequestNameList[
                                              index],
                                          currentUserFriendRequestLevelList[
                                              index]);
                                      FriendSystem.DeleteFriendRequest(
                                          userData,
                                          currentUserFriendRequestIDList[index],
                                          currentUserFriendRequestNameList[
                                              index],
                                          currentUserFriendRequestLevelList[
                                              index]);
                                      setState(() {});
                                    },
                                    child: Container(
                                      //alignment: AlignmentDirectional(0, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(60),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Icon(
                                        Icons.check_circle,
                                        color:
                                            Color.fromARGB(255, 134, 109, 219),
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: InkWell(
                                    onTap: () {
                                      FriendSystem.DeleteFriendRequest(
                                          userData,
                                          currentUserFriendRequestIDList[index],
                                          currentUserFriendRequestNameList[
                                              index],
                                          currentUserFriendRequestLevelList[
                                              index]);
                                      setState(() {});
                                    },
                                    child: Container(
                                      //alignment: AlignmentDirectional(0, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(60),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Icon(
                                        Icons.cancel_rounded,
                                        color:
                                            Color.fromARGB(255, 134, 109, 219),
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).animate(
                    effects: [
                      MoveEffect(
                        curve: Curves.easeInOut,
                        delay: 0.ms,
                        duration: 600.ms,
                        begin: Offset(0, 100),
                        end: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  indent: 60,
                  endIndent: 60,
                  color: Color(0xFF090347),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: currentUserFriendIDList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                          child: Container(
                            width: 100,
                            height: 67.8,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(1, -0.64),
                                end: AlignmentDirectional(-1, 0.64),
                              ),
                              borderRadius: BorderRadius.circular(60),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 15, 0),
                                  child: Icon(
                                    Icons.face,
                                    color: Colors.white,
                                    size: 46,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentUserFriendNameList[index],
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Playfair Display',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        'Level ' +
                                            currentUserFriendLevelList[index]
                                                .toString(),
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Playfair Display',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: IconButton(
                                    // borderColor: Color(0x00FFFFFF),
                                    // borderRadius: 30,
                                    // borderWidth: 1,
                                    // buttonSize: 55,
                                    // fillColor: Colors.white,
                                    icon: Icon(
                                      Icons.send_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).animate(
                    effects: [
                      MoveEffect(
                        curve: Curves.easeInOut,
                        delay: 0.ms,
                        duration: 600.ms,
                        begin: Offset(0, 100),
                        end: Offset(0, 0),
                      ),
                    ],
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
                            onPressed: () async {},
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => Provider(
                                    create: (context) => userData,
                                    builder: (context, child) =>
                                        Articals_links(),
                                  ),
                                ),
                              ); // context.pushNamed('Article');
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
            ).animate(
              effects: [
                FadeEffect(
                  curve: Curves.easeInOut,
                  delay: 0.ms,
                  duration: 600.ms,
                  begin: 0,
                  end: 1,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}