import 'package:demo/screens/notifications_screen.dart';
import 'package:flutter/material.dart';

class MyTopNav extends StatelessWidget {
  const MyTopNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 106, 183, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            "Welcome, Name!",
            textScaleFactor: 1.1,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          IconButton(
            padding: const EdgeInsets.symmetric(vertical: 5),
            constraints: const BoxConstraints(),
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierColor:
                    Colors.black12.withOpacity(0.6), // Background color
                barrierDismissible: true,
                barrierLabel: 'Dialog',
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) {
                  return const NotificationScreen();
                },
              );
            },
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
