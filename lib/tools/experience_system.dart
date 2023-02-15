
class Experience{
  static int calculate_Currentlevel(experience){
    print(experience);
    return (experience/10).round();
  }
  static int calculate_LastExperience(experience){
    
    return experience%10;
  }
  
}