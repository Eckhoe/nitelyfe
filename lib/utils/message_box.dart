import "package:flutter/material.dart";
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/screens/main_screens/chat_screen.dart';

class MessageBox extends StatefulWidget {
  final String profilePicture;
  final String userName;
  final String timeRecieved;
  final String recivedText;
  final bool isNew;

  MessageBox({
    this.profilePicture,
    @required this.recivedText,
    @required this.userName,
    @required this.timeRecieved,
    @required this.isNew,
  });
  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                userName: widget.userName,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: kNiteLyfeRed,
                  radius: 30,
                  // backgroundImage: ,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@' + widget.userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Text(
                        widget.recivedText,
                        style: TextStyle(color: Colors.black, fontSize: 14),
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
                    color: widget.isNew == true
                        ? kNiteLyfeRed.withOpacity(.5)
                        : Colors.transparent,
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
