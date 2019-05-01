/*
-Timothy Lenahan
-menu/navbar for pickup soft dev project
-6APR2019
*/

// imports for flutter and all the pages necessary for the routes
import 'package:flutter/material.dart';
// these paths  probably need to be changed
import 'package:pickup3308/pages/home.dart';
import 'package:pickup3308/pages/map.dart';
import 'package:pickup3308/pages/profile.dart';
import 'package:pickup3308/pages/fields.dart';
import 'package:pickup3308/pages/login.dart';

class AppMenuBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MenuBar();
    
  }
}

class MenuBar extends State<AppMenuBar> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        //SaferArea to auto pad content into phone screen
        body: new SafeArea(
            // the list view is the actual scrollable portion of navbar
            child: new ListView(
            //scroll attribute of navbar
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Column(
                //column aligns left
                children: <Widget>[
                  //row allows horizontal display
                  Row(
                    // these children widgets are the actual buttons (ButtonTheme widgets)
                    children: <Widget>[
                      ButtonTheme(
                        //sizing of buttons
                        minWidth: 138,
                        height: 60,
                        // actual button 
                        child: RaisedButton(
                                // attributes of button
                                color: Colors.orange,
                                child: const Text('Home'),
                                // action onPressed for button using routes created by Luke McConnell 
                                onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),
                              );},
                        ),
                      ),
                      // documentation for each of the follow the documentation 
                      ButtonTheme(
                        minWidth: 138,
                        height: 60,
                        child: RaisedButton(
                                child: const Text('Map'),
                                onPressed: () { Navigator.push( context,MaterialPageRoute(builder: (context) => Map()),
                              );},
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 138,
                        height: 60,
                        child: RaisedButton(
                                  child: const Text('Profile'),
                                  onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()),
                                );},
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 138,
                        height: 60,
                        child: RaisedButton(
                                color: Colors.orange,
                                child: const Text('Fields'),
                                onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => Field1()),
                              );},
                        ),
                      ),
                      // the following is a logout button which doesn't do anything other than route you to the login page right now (6APR2019)
                      ButtonTheme(
                        minWidth: 138,
                        height: 60,
                        child: RaisedButton(
                                child: const Text('Logout'),
                                onPressed: () { Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
                              );},
                        ),
                      ),
                    ],
                  ),
                ],
              ), 
            ],
          ),
      ),
    );
  }
}