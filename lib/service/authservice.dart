import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
  Future login({String email,String password}) async 
  {
    String url="http://192.168.1.2:8000/api/login";
    Map<String,String> user={
      "email":email,
      "password":password

    };

    try {
      Response response=await post(url,body:jsonEncode(user),headers: {"Content-Type":"application/json"});
      if(response.statusCode==200)
      {

        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        sharedPreferences?.setBool("loggedin", true);


      }
    




    }catch (e) {
      print(e.toString());

    }

  }
}
//see  https://codingwithjoe.com/flutter-authentication/
