import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/models/myuser.dart';
import 'package:recycle_app/service/database.dart';
import 'package:recycle_app/tools/constants.dart';

class ChangeName_page extends StatefulWidget {
  const ChangeName_page({super.key});

  @override
  State<ChangeName_page> createState() => _ChangeName_pageState();
}

class _ChangeName_pageState extends State<ChangeName_page> {

  final _formKey = GlobalKey<FormState>();
  String _currentName = "";

  @override
  Widget build(BuildContext context) {
    
    //User user = Provider.of<User>(context);
    UserData userData = Provider.of<UserData>(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ()async{
            
            Navigator.pop(context,true);
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Update your Info.',
              
              style: TextStyle(
                fontSize: 18.0,
                
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Name',
              
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
              child: TextFormField(
                initialValue: userData.name,
                decoration: inputTextDecoration,
                validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.grey[50],
              ),
              child: const Text(
                'confirm'
              ),
              onPressed: () async {
                if(_formKey.currentState!.validate()){
                  if(_currentName.isNotEmpty){
                    await DatabaseService(uid: userData.uid).updateUserDataInfo(
                      _currentName,
                      userData.level,
                      userData.experiences,
                    );
                  }
                  
                  Navigator.pop(context,true);
                }
              }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.grey[50],
              ),
              onPressed: (){
                Navigator.pop(context,true);
              },
              child: const Text(
                'cancel'
              ),
            )
          ],
        ),
      ),
    );
  }
}