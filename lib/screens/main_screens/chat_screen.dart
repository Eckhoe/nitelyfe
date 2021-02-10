import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/utils/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  ChatScreen({this.userName});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.userName,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: kMessageBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                MessageBubble(
                  message: 'this is a test',
                  isMe: true,
                ),
                MessageBubble(
                    message: 'this is a asdf adsf adl om k sdfokm oi sads',
                    isMe: false)
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(
                left: 80,
              ),
              color: Colors.white,
              child: TextField(
                textInputAction: TextInputAction.send,
                maxLines: 5,
                autocorrect: true,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  isCollapsed: false,
                  hintText: 'Message',
                  border: OutlineInputBorder(
                    gapPadding: 5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
