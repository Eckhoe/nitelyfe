import "package:flutter/material.dart";
import 'package:nitelyfe/utils/message_box.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Messages",
          style: TextStyle(
              color: Colors.black87, fontFamily: "Comfortaa", fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 10, 175, 4),
                color: Colors.white,
                child: TextField(
                  autocorrect: false,
                  onChanged:
                      null, //look up the user that closly represents the name in the search bar
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 22.5, maxWidth: 20),
                    contentPadding: EdgeInsets.only(left: 10),
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
          ),
          Expanded(
            flex: 15,
            child: ListView(
              children: <Widget>[
                MessageBox(
                  profilePicture: '',
                  userName: 'Jane Doe',
                  timeRecieved: '10:02 PM',
                ),
              ],
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}
