import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notifications = [
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications, You Have No Notifications",
    "You Have No Notifications",
    "You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications",
    "You Have No Notifications, You Have No Notifications, You Have No Notifications, You Have No Notifications, You Have No Notifications",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(0, 106, 183, 1),
              ),
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(236, 247, 255, 1)),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          // height: 100,
          // width: 100,
          child: notifications.isNotEmpty
              ? Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Color.fromRGBO(0, 106, 183, 1),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.55,
                        ),
                        padding: const EdgeInsets.all(15),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: notifications
                                .map((text) => Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            "assets/notif.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                          const SizedBox(),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: DefaultTextStyle(
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(
                                                    0, 106, 183, 1),
                                              ),
                                              child: Text(
                                                text,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.55,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              notifications.clear();
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(0, 106, 183, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // minimumSize: const Size(double.maxFinite, 30),
                            // tapTargetSize: MaterialTapTargetSize.padded,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "Clear all Notifications",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/notif.png"),
                      const SizedBox(
                        height: 20,
                      ),
                      const DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 106, 183, 1),
                        ),
                        child: Text(
                          "You Have No Notifications",
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
