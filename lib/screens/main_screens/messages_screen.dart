import "package:flutter/material.dart";
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/utils/message_box.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMessageBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(
              color: Colors.black, fontFamily: "Comfortaa", fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 180, 10),
            color: Colors.white,
            child: Container(
              child: TextField(
                autocorrect: false,
                onChanged:
                    null, //look up the user that closly represents the name in the search bar
                decoration: InputDecoration(
                  isCollapsed: true,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 40, maxWidth: 20),
                  labelText: 'Search',
                  labelStyle: TextStyle(fontFamily: 'Comfortaa'),
                  disabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                MessageBox(
                  profilePicture:
                      '', //prifile pictures will be stored on the DB and grab as network image
                  recivedText: 'Hey Dave, this is just a test message',
                  userName: 'dylan_lopez',
                  timeRecieved: '5:02 PM',
                  isNew: true,
                ),
                MessageBox(
                  profilePicture: '',
                  recivedText:
                      'The shark-infested South Pine channel was the only way in or out.',
                  userName: '',
                  timeRecieved: '10:02 PM',
                  isNew: false,
                ),
                MessageBox(
                  profilePicture: '',
                  recivedText: 'The mysterious diary records the voice.',
                  userName: '',
                  timeRecieved: '10:02 PM',
                  isNew: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
