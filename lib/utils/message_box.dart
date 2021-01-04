import "package:flutter/material.dart";
import 'package:nitelyfe/constants.dart';

class MessageBox extends StatefulWidget {
  final String profilePicture;
  final String userName;
  final String timeRecieved;
  MessageBox(
      {this.profilePicture,
      @required this.userName,
      @required this.timeRecieved});
  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: FlatButton(
        splashColor: Colors.black12,
        highlightColor: Colors.transparent,
        height: 80,
        onPressed: () => print('hello'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: widget.profilePicture != null
                      ? AssetImage(widget.profilePicture)
                      : null,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@' + widget.userName, //
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Text(
                        'tedsfadsfaadfadhalkdjgaslkdlkmst',
                        style: TextStyle(color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                  child: Text(widget.timeRecieved),
                  decoration: BoxDecoration(
                    color: kNiteLyfeRed.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* 

MessageBox will be a button in which it holds the updated message(s)
that are being sent to the user from someone else. ATM doing live chats
P2P is expensive so dont focus on that, just focus on building the concept
for the boxes and how they actual chat log will look when clicked on :)

*/
