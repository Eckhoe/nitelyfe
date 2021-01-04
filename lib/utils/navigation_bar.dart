import 'geolocator_service.dart';
import 'package:flutter/material.dart';
import 'package:nitelyfe/constants.dart';
import 'package:nitelyfe/screens/main_screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nitelyfe/screens/main_screens/messages_screen.dart';

// ignore: must_be_immutable
class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  String _query;
  int _page = 0;
  final pages = [HomeScreen(), null, MessagesScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: kNiteLyfeRed,
        height: 65,
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.fastOutSlowIn,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: <Widget>[
          Icon(Icons.home),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 30),
            child: Material(
              elevation: 5,
              color: kNiteLyfeRed,
              borderRadius: BorderRadius.circular(30),
              child: MaterialButton(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24,
                ),
                minWidth: 150,
                height: 20,
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 400,
                        child: Stack(
                          children: [
                            Positioned(
                              child: TextField(
                                onChanged: (value) {
                                  _query = value;
                                  //update the value/name in the location bar
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 24,
                              left: 4,
                              right: 4,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(56, 0, 56, 0),
                                child: FloatingActionButton(
                                    child: Text(
                                      "Let's Party",
                                      style: TextStyle(
                                          fontFamily: 'Comfortaa',
                                          fontSize: 20),
                                    ),
                                    backgroundColor: kNiteLyfeRed,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onPressed: () async {
                                      GeolocatorService geolocatorService =
                                          new GeolocatorService();
                                      await geolocatorService
                                          .addMarkerFromQuery(_query);
                                    }
                                    //push the marker data to firebase
                                    ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Icon(
            Icons.chat,
          )
        ],
      ),
      body: Container(
        child: pages[_page],
      ),
    );
  }
}
