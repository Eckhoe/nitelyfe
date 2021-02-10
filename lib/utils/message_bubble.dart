import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({@required this.message, @required this.isMe});
  final String message;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset.fromDirection(-10, 3),
                ),
              ],
              color: isMe ? kNiteLyfeRed.withOpacity(1) : Colors.white,
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
            ),
            child: Padding(
              child: Text(message),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
          ),
        ],
      ),
    );
  }
}
