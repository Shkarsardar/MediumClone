import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medium/screens/registerscreen.dart';
import 'package:medium/service/authservice.dart';
import 'package:medium/state/authentication_state.dart';

class LoginScreen extends StatefulWidget {
  final StreamController<AutheticationState> _streamController;
  LoginScreen(this._streamController);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email;
  String _password;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromRGBO(215, 239, 239, 1),
          child: Padding(
            padding: EdgeInsets.all(36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 80,
                  child: Text("Sign in with email",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),

                ),
                SizedBox(height: 55,),
                TextField(
                  obscureText: false,
                  onChanged: (email){
                    this._email=email;

                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: "Enter Your Email",

                  ),
                ),
                SizedBox(height: 55,),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: "Enter Your Password",

                  ),
                  onChanged: (password){
                    _password=password;

                  },
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  onPressed: ()async{
                    AuthService authService=new AuthService();
                    dynamic result= await authService.login(email: _email,password: _password);
                    if (result==true) 
                    {
                      widget._streamController.add(AutheticationState.authenticated());
                    }
                    



                    
                  },
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  color: Colors.green[500],
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),

                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: ()async{

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));

                  },
                  child: Text("Create Account",style:TextStyle(color: Colors.green[600]),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}