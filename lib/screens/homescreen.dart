import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey=new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            ListTile(
              title: Text("Your Account"),
            )
          ],
        ),

      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Home",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
        titleSpacing: 5,
        leading: Row(
          children: <Widget>[
            // SizedBox(width: 10),
            IconButton(
              splashColor: Colors.transparent,

              icon: Icon(Icons.reorder),
              onPressed: (){
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
                icon: Icon(Icons.notifications_none,color: Colors.grey,),
                onPressed: ()=>print("Notification"),

              ),
              
              IconButton(
                splashColor: Colors.transparent,
                icon: Icon(Icons.search,color: Colors.grey),
                onPressed: ()=>print("Search"),

              ),
              
              

              
            ],
          ),
        ],
      ),
      body: Text("Home Screen"),

    );
  }
}