import 'dart:collection';

import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Map> list=[
    {
      'title':'first title',
      'image':'image1',

    },
    {
      'title':'second title',
      'image':'image2',
      

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Your Daily Read",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
          SizedBox(height: 15,),
          Divider(height: 1,color: Colors.grey,),
          SizedBox(height: 20,),
          
          Expanded(
              child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext con,id){
                return Text("Hello there");
                
              },
            ),
          )
        ],

      ),
    );


  }
}