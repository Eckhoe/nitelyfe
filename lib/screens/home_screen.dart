import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Image.asset('images/nite_lyfe_3.png',
            height: 50, width: 100, fit: BoxFit.scaleDown),
        centerTitle: true,
        actions: <Widget>[
          Container(
            child: FlatButton(
              splashColor: Colors.transparent,
              child: Icon(Icons.chat), // or Send Icon
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                //TODO 1: bring the messages screen
              },
            ),
            width: 60,
          ),
        ],
      ),
      //TODO 2: Work on drawer and sub parts
      drawer:
          MakeDrawer(), //take user name, username, balance, profile pic, and following counts
      body: Center(
        child: Text('hello world'),
      ),
    );
  }
}

class MakeDrawer extends StatefulWidget {
  String name;
  String username;
  Image profilePic;
  double balance;
  int followers, following;

  MakeDrawer(
      {this.name,
      this.username,
      this.balance,
      this.profilePic,
      this.followers,
      this.following});

  @override
  _MakeDrawerState createState() => _MakeDrawerState();
}

class _MakeDrawerState extends State<MakeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: kNiteLyfeRed),
            child: Stack(
              children: <Widget>[
                //Profile Picture Zone
                Align(
                  alignment: Alignment(1.1, -1.75),
                  child: CircleAvatar(
                    backgroundColor: Colors
                        .white, //change to background image once firebase is set up
                    radius: 35,
                  ),
                ),
                // Full Name of User
                Align(
                  alignment: Alignment(-1.25, -1.125),
                  child: SizedBox(
                    height: 36,
                    width: 210,
                    child: FittedBox(
                      child: Text('David Bailey',
                          style: kDrawerAccountNameTextStyle),
                    ),
                  ),
                ),
                // Username of the User
                Align(
                  alignment: Alignment(-1.1, -.5),
                  child: Text('@davebaileyjr', style: kUsernameDrawerTextStyle),
                ),
                //Balance
                Align(
                  alignment: Alignment(-1.05, -.125),
                  child:
                      Text('Balance: 500 CAD', style: kBalacneDrawerTextStyle),
                ),
                // Follower Counts
                Padding(
                  padding: EdgeInsets.fromLTRB(150, 50, 4, 25),
                  child: SizedBox(
                    height: 28,
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Following 32',
                          style: kFollowCounterTextStyle,
                        ),
                        Text(
                          'Followers 1234',
                          style: kFollowCounterTextStyle,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          CreateListTile(
            tileName: 'Edit Profile',
            textStyle: kDrawerItemTextStyle,
            //goto edit profile screeen
          ),
          CreateListTile(
            tileName: 'Withdraw',
            textStyle: kDrawerItemTextStyle,
            //got to widthdraw sceen
          ),
          CreateListTile(
            tileName: 'Settings',
            textStyle: kDrawerItemTextStyle,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CreateListTile(
                tileName: 'nitelyfe +', //offer in app purchase pop up
                textStyle: kNiteLyfePlusTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateListTile extends StatelessWidget {
  final String tileName;
  final TextStyle textStyle;
  final screen;
  CreateListTile({
    @required this.tileName,
    this.textStyle,
    this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FlatButton(
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(tileName, style: textStyle),
        onPressed: () {
          //push to the new screen that gets linked
        },
      ),
    );
  }
}
