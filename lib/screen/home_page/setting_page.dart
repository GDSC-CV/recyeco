import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/screen/authenticate/forget_password.dart';
import 'package:recycle_app/screen/home_page/change_name.dart';
import 'package:recycle_app/screen/home_page/friend_page.dart';
import 'package:recycle_app/service/auth.dart';
import 'package:recycle_app/tools/friend_system.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class SettingWidget extends StatefulWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget>{
  
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    UserData userData = Provider.of<UserData>(context,listen: true);
    String userName = userData.name;
    String userLevel = userData.level.toString();
    //print(userName);
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
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              alignment: AlignmentDirectional(0, -1),
                              child: GradientText(
                                'Settings',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Playfair Display',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 60,
                                ),
                                colors: [Color(0xFF663BEE), Color(0xFF5533C1)],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                      child: Container(
                        width: 100,
                        height: 67.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 46,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: IconButton(
                                // borderColor: Color(0x00FFFFFF),
                                // borderRadius: 30,
                                // borderWidth: 1,
                                // buttonSize: 55,
                                // fillColor: Colors.white,
                                icon: Icon(
                                  Icons.double_arrow_rounded,
                                  color: Color(0xFF6420AB),
                                  size: 40,
                                ),
                                onPressed: () async {
                                  print("press UserName");
                                  bool message = await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => Provider(
                                        create: (context) => userData,
                                        builder: (context, child) => const ChangeName_page(),
                                      ),
                                    ),
                                    
                                  );
                                  await Future.delayed(const Duration(seconds: 10));
                                      
                                  if(message==true){
                  
                                    setState((){
                                      print("rebuild");
                                      //await FriendSystem.updateFriend(userData);
                                    });
                                  }
                                  // await Future.delayed(
                                  //     const Duration(milliseconds: 1000));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                      child: Container(
                        width: 100,
                        height: 67.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Icon(
                                Icons.stars_rounded,
                                color: Colors.white,
                                size: 46,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Level '+userLevel,
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: IconButton(
                                // borderColor: Color(0x00FFFFFF),
                                // borderRadius: 30,
                                // borderWidth: 1,
                                // buttonSize: 55,
                                // fillColor: Colors.white,
                                icon: Icon(
                                  Icons.double_arrow_rounded,
                                  color: Color(0xFF6420AB),
                                  size: 40,
                                ),
                                onPressed: () async {
                                  print("press Level");
                                }
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                      child: Container(
                        width: 100,
                        height: 67.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Icon(
                                Icons.build_circle,
                                color: Colors.white,
                                size: 46,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reset Password',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: IconButton(
                                // borderColor: Color(0x00FFFFFF),
                                // borderRadius: 30,
                                // borderWidth: 1,
                                // buttonSize: 55,
                                // fillColor: Colors.white,
                                icon: Icon(
                                  Icons.double_arrow_rounded,
                                  color: Color(0xFF6420AB),
                                  size: 40,
                                ),
                                onPressed: () async {
                                  if (!(FirebaseAuth.instance.currentUser!.isAnonymous)) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const ForgetPassword()));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text("Your are currently Anonymous!"),
                                          );
                                        });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                      child: Container(
                        width: 100,
                        height: 67.8,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF3CDAC7), Color(0xFF4A38F2)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(1, 0),
                            end: AlignmentDirectional(-1, 0),
                          ),
                          borderRadius: BorderRadius.circular(60),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Icon(
                                Icons.radio_button_checked_rounded,
                                color: Colors.white,
                                size: 46,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'log out',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: IconButton(
                                // borderColor: Color(0x00FFFFFF),
                                // borderRadius: 30,
                                // borderWidth: 1,
                                // buttonSize: 55,
                                // fillColor: Colors.white,
                                icon: Icon(
                                  Icons.double_arrow_rounded,
                                  color: Color(0xFF6420AB),
                                  size: 40,
                                ),
                                onPressed: () async {
                                  await _auth.signOut();
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
                            // print('IconButton pressed ...');
                            Navigator.of(context).popUntil((route) => route.isFirst);
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
                                  builder: (context, child) => const FriendWidget(),
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
                            
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
