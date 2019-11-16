import 'package:flutter/material.dart';
import 'package:medium/screens/homescreen.dart';
import 'package:medium/screens/wrapper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>Wrapper()
        ));

    });




  }
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: SafeArea(
           child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,      
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Medium",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 50,)),
              SizedBox(height: 30,),
              Image(image: AssetImage('lib/images/splash.png'),)

            ],
            ),
        ),
      ),
    );

  }
}