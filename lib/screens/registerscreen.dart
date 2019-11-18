import 'package:flutter/material.dart';
import 'package:medium/screens/wrapper.dart';
import 'package:medium/service/registerservice.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;

  final _formKey=GlobalKey<FormState>();
  bool _isPasswordShown=true;
  void showPassword(){
    setState(() {
      _isPasswordShown=!_isPasswordShown;
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: Center(
        child: Container(
          color: Color.fromRGBO(215, 239, 239, 1),
          child: Padding(
            padding: EdgeInsets.all(36),
            child: Form(
                key: _formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                    child: Text("Sign Up With Email",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),

                  ),
                  SizedBox(height: 55,),
                  TextFormField(
                    validator: (value){
                      if (value.isEmpty) {
                        return "Email shouldn't be blank";
                      }
                      else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) 
                      {
                          return 'Please enter valid email';

                      }
                      return null;

                    },
                    onChanged: (email){
                      this._email=email;

                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Email",

                    ),
                  ),
                  SizedBox(height: 30,),

                  TextFormField(
                    
                    obscureText: _isPasswordShown,
                    validator: (value){
                      if (value.isEmpty) 
                      {
                        return "Password shouldn't be empty";

                      }
                      else if(value.trim().length<5)
                      {
                        return "password should be more than 5 characters";


                      }
                      return null;

                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        child: Icon(Icons.remove_red_eye,color: !_isPasswordShown?Theme.of(context).accentColor:Colors.grey,),
                        onTap: (){
                          print("Password Shown");
                          showPassword();

                        },
                        ),


                    ),
                    onChanged: (password){
                      _password=password;

                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    obscureText: _isPasswordShown,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                    ),
                    validator: (confirmPassword)
                    {
                      if (confirmPassword!=_password) 
                      {
                        return "Password fields doesn't match";

                      }
                      return null;

                    },
                    
                  ),
                  SizedBox(height: 30,),
                  MaterialButton(
                    onPressed: ()async{
                      if (_formKey.currentState.validate()) 
                      {
                        var registerService=new RegisterService();
                        var result=await registerService.registerUser(email: _email,password: _password);
                        if (result==201) 
                        {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wrapper()));
                          
                        }
                        else if (result==400) 
                        {
                            showDialog(
                              context: context,
                              builder: (BuildContext context)
                              {
                                return new AlertDialog(title:Text("username should be unique"),content: Text("Please change your email to another one"));

                              }
                            );
                        }
                        

                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    color: Colors.green[500],
                    child: Text("Create Account",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),

                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: (){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Wrapper()));
                      
                    },
                    child: Text("I have account",style: TextStyle(color: Colors.green[600]),),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}