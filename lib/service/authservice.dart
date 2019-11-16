import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:medium/state/authentication_state.dart';
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
        var token=jsonDecode(response.body);
        SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        sharedPreferences.setString("token",token['token'] );
        return true;

      }
      return false;

    
    }catch (e) {
      print(e.toString());

    }

  }
  Future<bool> isAuthenticated(StreamController streamController)async
  {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("token")==true) 
    {
      streamController.add(AutheticationState.authenticated());
      return true;

    }

    return false;
  }
}
//see  https://codingwithjoe.com/flutter-authentication/

