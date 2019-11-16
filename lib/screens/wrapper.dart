import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medium/screens/homescreen.dart';
import 'package:medium/screens/loginscreen.dart';
import 'package:medium/service/authservice.dart';
import 'package:medium/state/authentication_state.dart';
class Wrapper extends StatelessWidget {
  final StreamController<AutheticationState> _streamController=new StreamController<AutheticationState>();

  Widget buildUi(BuildContext context,AutheticationState autheticationState)
  {
    AuthService authService=new AuthService();
    authService.isAuthenticated(_streamController);
    
    if (autheticationState.authenticated) 
    {
      return HomePage(_streamController);

    }
    else{
      return LoginScreen(_streamController);

    }


  }  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AutheticationState>(
      stream: _streamController.stream,
      initialData: AutheticationState.initail(),
      builder: (BuildContext context,AsyncSnapshot<AutheticationState> snapshot){
        final state=snapshot.data;
        return buildUi(context,state);
      },
    );
  }

}