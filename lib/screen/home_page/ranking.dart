
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recyeco/models/myuser.dart';
import 'package:tuple/tuple.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_animate/flutter_animate.dart';


class RankingWidget extends StatefulWidget {
  const RankingWidget({Key? key}) : super(key: key);

  @override
  _RankingWidgetState createState() => _RankingWidgetState();
}

class _RankingWidgetState extends State<RankingWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    
    UserData userData = Provider.of<UserData>(context);
    var currentUserLevel = userData.level;
    
    //var currentUserFriendRequestNameList = userData.friendNameRequests;
    //var currentUserFriendRequestLevelList = userData.friendLevelRequests;
    var currentUserFriendIDList = userData.friendIDs;
    var currentUserFriendNameList = userData.friendNames;
    var currentUserFriendLevelList = userData.friendLevels;
    
    // create a list of tuples with friend's name and level
    List<Tuple2<String, int>> friendsLevelList = [];
    for (int i = 0; i < currentUserFriendNameList.length; i++) {
      friendsLevelList.add(Tuple2(currentUserFriendNameList[i], currentUserFriendLevelList[i]));
    }
    friendsLevelList.add(Tuple2("You", userData.level));
    
    // sort the list based on level
    friendsLevelList.sort((a, b) => b.item2.compareTo(a.item2));
    
    // extract top three ranking friends
    List<Tuple2<String, int>> topThreeFriends = [];
    if (friendsLevelList.length >= 1) {
      topThreeFriends.add(friendsLevelList[0]);
    }
    if (friendsLevelList.length >= 2) {
      topThreeFriends.add(friendsLevelList[1]);
    }
    if (friendsLevelList.length >= 3) {
      topThreeFriends.add(friendsLevelList[2]);
    }

    
    return Scaffold(

      backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
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
                                  'Ranking',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Playfair Display',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 60,
                                  ),
                                  colors: [
                                    Color(0xFF4A38F2),
                                    Color(0xFF3CDAC7)
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ).animate(effects: [
                                  MoveEffect(
                                    curve: Curves.easeInOut,
                                    delay: 0.ms,
                                    duration: 600.ms,
                                    begin: Offset(-100, 0),
                                    end: Offset(0, 0),
                                  ),
                                ]),
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
              ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                topThreeFriends.length < 2 ? "       " : "${topThreeFriends[1].item1}:",
                                style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Color(0xFF090347),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, -40),
                                      end: Offset(0, 0),
                                    ),
                              ]),
                              Text(
                                topThreeFriends.length < 2 ? "       " :"Level ${topThreeFriends[1].item2}\n",
                                style: TextStyle(
                                   fontSize: 15.0,
                                    color: Colors.black,
                                   ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, -40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                              Container(
                                width: 98.5,
                                height: 273.3,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 67, 192, 177),
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 180, 0, 0),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, 40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                topThreeFriends[0].item1+":",
                                style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Color(0xFF090347),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, -40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                              Text(
                                "Level ${topThreeFriends[0].item2}\n",
                                style: TextStyle(
                                   fontSize: 15.0,
                                    color: Colors.black,
                                   ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, -40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                              Container(
                                width: 100,
                                height: 334.7,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3CDAC7),
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 240, 0, 0),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, 40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                     topThreeFriends.length < 3 ? "       " :topThreeFriends[2].item1+":",
                                    style: GoogleFonts.getFont(
                                      'Playfair Display',
                                      color: Color(0xFF090347),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, -40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                              Text(
                                topThreeFriends.length < 3 ? "       " :"Level ${topThreeFriends[2].item2}\n",
                                style: TextStyle(
                                   fontSize: 15.0,
                                    color: Colors.black,
                                   ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, -40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                              Container(
                                width: 100,
                                height: 210.6,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 82, 172, 162),
                                ),
                                child: const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 115, 0, 0),
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      fontSize: 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ).animate(effects: [
                                    MoveEffect(
                                      curve: Curves.easeIn,
                                      delay: 0.ms,
                                      duration: 600.ms,
                                      begin: Offset(0, 40),
                                      end: Offset(0, 0),
                                    ),
                                  ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                        IconButton(
                          // borderColor: Colors.transparent,
                          // borderRadius: 30,
                          // borderWidth: 1,
                          // buttonSize: 60,
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            //context.safePop();
                          },
                        ),
                    ],
                  ).animate(effects: [
            FadeEffect(
              curve: Curves.easeInOut,
              delay: 0.ms,
              duration: 600.ms,
              begin: 0,
              end: 1,
            ),
          ]),
                 
              ],
            ),
            
          ),
          
        ),
      );
    
  }
}
