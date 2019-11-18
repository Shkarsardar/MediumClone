import 'dart:convert';

import 'package:http/http.dart' as http;

class RegisterService
{
  Future<int> registerUser({String email,String password})async
  {
    http.Response response =await http.post("http://192.168.1.2:8000/api/register",headers: {"Content-Type":"application/json"},body: jsonEncode({"email":email,"password":password}));
    return response.statusCode;
  }

} 