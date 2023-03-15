import 'package:flutter/material.dart';
import 'package:recycle_app/tools/constants.dart';

class LoginWidget extends StatefulWidget {
  final Function toggle;
  LoginWidget({required this.toggle});
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LoginWidget - FRAME

    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Stack(children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(129, 240, 134, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Text(
                        'Start using recycle_app',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(18, 16, 115, 1),
                            fontFamily: 'Assistant',
                            fontSize: 26,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 60),
                    child: TextFormField(
                      decoration: inputTextDecoration.copyWith(hintText: 'Email/ID'),
                      validator: (value) => value!.isEmpty ? 'Enter an email':null,
                      onChanged: ((value) {
                        
                      }),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 60),
                    child: TextFormField(
                      decoration: inputTextDecoration.copyWith(hintText: 'Password'),
                      validator: (value) => value!.isEmpty ? 'Enter an email':null,
                      onChanged: ((value) {
                        
                      }),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                    
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(2, 23, 1, 0.63),
                      minimumSize: const Size(250,60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const  Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        letterSpacing:
                            1 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'Forget Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(115, 58, 16, 1),
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    'No account? Sign up! ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(115, 58, 16, 1),
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )
                ],
              ),
            ),
            Positioned(
                top: 570,
                left: 49,
                child: Text(
                  'Forget password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(115, 58, 16, 1),
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ]),
        ));
  }
}
