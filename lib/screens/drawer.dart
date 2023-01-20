import 'package:demo/data/user_type.dart';
import 'package:demo/screens/about_us_screen.dart';
import 'package:demo/screens/gallery_screens.dart';
import 'package:demo/screens/home/my_profile_screen.dart';

import 'package:demo/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List menu = [
    "Home",
    "Profile",
    "About Us",
    "Gallery",
    "Vacancy",
    "Contact Us",
    "Privacy Policy",
    "Terms & Conditions",
    "Logout"
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var primaryColor = const Color.fromRGBO(0, 106, 183, 1);

    return Drawer(
      backgroundColor: const Color.fromRGBO(236, 247, 255, 1),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: getUserType(),
                builder: (context, AsyncSnapshot snapshot) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              backgroundColor: Color.fromRGBO(236, 247, 255, 1),
                              backgroundImage: AssetImage(
                                "assets/user_person.png",
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Name!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10,
                          ),
                          child: Text(
                            snapshot.connectionState != ConnectionState.waiting
                                ? snapshot.data == UserDef.PD
                                    ? "PD Code : 45651354"
                                    : "MR Code : 12345678"
                                : "Loading Data",
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Container(
              constraints: const BoxConstraints(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: menu.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = i;
                      });
                      switch (menu[i]) {
                        case "Profile":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyProfileScreen(),
                          ));
                          break;
                        case "About Us":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AboutUsScreen(),
                          ));
                          break;
                        case "Gallery":
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const GalleryScreen(),
                          ));
                          break;
                        case "Logout":
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const SplashScreen(),
                              ),
                              (route) => false);
                          break;
                        default:
                      }
                    },
                    child: MyTile(
                      text: menu[i],
                      color:
                          i == currentIndex ? primaryColor : Colors.transparent,
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Text(
                  "Version 0.1.1",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

Future getUserType() async {
  var user = await UserType().getUserType();
  return user;
}

class MyTile extends StatelessWidget {
  const MyTile({Key? key, required this.text, this.color}) : super(key: key);
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    var primaryColor = const Color.fromRGBO(0, 106, 183, 1);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top:
              BorderSide(width: 1.0, color: Color.fromRGBO(50, 140, 236, 0.19)),
          bottom:
              BorderSide(width: 1.0, color: Color.fromRGBO(50, 140, 236, 0.19)),
        ),
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 10,
            color: color,
          ),
          const SizedBox(width: 40),
          Text(
            text,
            textScaleFactor: 1.1,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
