import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  onPressed: ()=>print("Login"),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  color: Colors.green[500],
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),

                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: ()=>print("Create Account"),
                  child: Text("Create Account"),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}