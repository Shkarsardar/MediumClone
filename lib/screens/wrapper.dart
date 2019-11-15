import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medium/screens/homescreen.dart';
import 'package:medium/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatelessWidget {
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPrefs(),
      builder: (context,snapshot){
        if (snapshot.hasData) 
        {
          return HomePage();

        }
        else{
          return LoginScreen();

        }
      },
    );

  }
  Future<void> _getPrefs()async{
    sharedPreferences=await SharedPreferences.getInstance();

  }
}