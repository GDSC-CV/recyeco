import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';

class Experience{

  static Future userGainExp(UserData userData,int amount)async{
    UserData currentUserData = userData;
    final userLevel = Experience.calculate_Currentlevel(currentUserData.experiences+amount);
    await DatabaseService(uid: currentUserData.uid).updateUserDataInfo(currentUserData.name, userLevel, currentUserData.experiences+amount);
  }
  static int calculate_Currentlevel(experience){
    return (experience/10).floor();
  }
  static int calculate_LastExperience(experience){
    return experience%10;
  }
  
}