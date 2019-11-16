import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medium/screens/newscreen.dart';
import 'package:medium/service/articleservice.dart';
import 'package:medium/state/authentication_state.dart';

class HomePage extends StatefulWidget {
  final StreamController _streamController;
  HomePage(this._streamController);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new HomeDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Home",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        titleSpacing: 5,
        leading: Row(
          children: <Widget>[
            // SizedBox(width: 10),
            IconButton(
              splashColor: Colors.transparent,
              icon: Icon(Icons.reorder),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            )
          ],
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                splashColor: Colors.transparent,
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.grey,
                ),
                onPressed: () => print("Notification"),
              ),
              IconButton(
                splashColor: Colors.transparent,
                icon: Icon(Icons.search, color: Colors.grey),
                onPressed: ()async{
                  ArticleService articleService=new ArticleService();
                  await articleService.fetchArticleList();

                  widget._streamController.add(AutheticationState.signOut());
                  
                },
              ),
            ],
          ),
        ],
      ),
      body: NewsScreen(),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleAvatar(child:Image(image: NetworkImage('https://pickaface.net/gallery/avatar/dionesku52605d205e6d3.png'),fit: BoxFit.cover,) ,),
                SizedBox(height: 15),
                Text("Shkar Sardar"),
                SizedBox(height: 15),

                InkWell(
                  child: Text("See profile",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87)),
                  onTap: () => print("Profile widget"),
                )
              ],
            ),
            decoration: BoxDecoration(color: Colors.white),
          ),
          new DrawerList()
        ],
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  double fontSize=12;

  DrawerList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 0.5,

      children: <Widget>[
        ListTile(
          title: Text("Home",style: TextStyle(fontSize: fontSize,fontWeight:FontWeight.w400),),
          onTap: (){

          },
        ),
        ListTile(
          title: Text("Audio",style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w400),),
          onTap: (){
          },  
        ),
        ListTile(
          title: Text("Reading List",style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w400),),
          onTap: (){},
        ),
        ListTile(
          title: Text("Interests",style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w400),),
          onTap: (){},

        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child:Divider(color: Colors.grey,) ,

        ),

        ListTile(
          title: Text("Become a member",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.green[800]),),
          onTap: (){},
          
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child:Divider(color: Colors.grey,) ,
        ),
        ListTile(
          title: Text("New Story",style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w400)),
          onTap: (){},
          
        ),
        ListTile(
          title: Text("Stats",style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w600,color: Colors.black),),
          onTap: (){},
          
        ),
        ListTile(
          title: Text("Stories",style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w400)),
          onTap: (){},
          
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Image(
              image: AssetImage('lib/images/mediumicon.png'),
              width: 30,
              height: 30,

              ),
              InkWell(
                onTap: ()=>print("Hello there"),
                child: Text("Settings"),
              ),
              InkWell(
                splashColor: Colors.transparent,

                onTap: ()=>print("Hello there"),
                child: Text("Help"),
              )
              
              
              ],
          )
      ],
    );
  }
}
