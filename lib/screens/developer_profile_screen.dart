import 'package:demo/data/user_type.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';

class DeveloperProfileProfileScreen extends StatelessWidget {
  const DeveloperProfileProfileScreen({Key? key, this.fromTabScreen = false})
      : super(key: key);
  final bool fromTabScreen;
  @override
  Widget build(BuildContext context) {
    Future<UserDef?> getUserType() async {
      UserDef? userType = await UserType().getUserType();
      return userType;
    }

    return Scaffold(
        appBar: fromTabScreen
            ? null
            : AppBar(
                elevation: 0,
                foregroundColor: Colors.blue,
                backgroundColor: Colors.transparent,
                title: Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                        height: 35, child: Image.asset("assets/logo.png"))),
                // centerTitle: true,
                automaticallyImplyLeading: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
              ),
        body: FutureBuilder(
            future: getUserType(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              UserDef? user = snapshot.data;

              return Column(
                children: <Widget>[
                  PageHeading(
                    text: user == UserDef.PD
                        ? "BPM's Profile"
                        : user == UserDef.MR
                            ? "DPM's Profile"
                            : "Error",
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        SizedBox(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: double.maxFinite,
                            margin: const EdgeInsets.only(
                                top: 5, right: 10, left: 10),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color.fromRGBO(17, 136, 222, 1),
                                ),
                                left: BorderSide(
                                  color: Color.fromRGBO(17, 136, 222, 1),
                                ),
                                right: BorderSide(
                                  color: Color.fromRGBO(17, 136, 222, 1),
                                ),
                              ),
                              color: Color.fromRGBO(236, 247, 255, 1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 5,
                                      color:
                                          const Color.fromRGBO(0, 106, 183, 1),
                                    ),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  width:
                                      MediaQuery.of(context).size.height * 0.17,
                                  child: Image.asset(
                                    "assets/developer_profile_img.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: const Text(
                                              "Name",
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    54, 105, 166, 1),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            ": Merchant King",
                                            textScaleFactor: 1.2,
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  54, 105, 166, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // mainAxisSize: MainAxisSize.min,

                                        children: [
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              child: const Text(
                                                "Post",
                                                textScaleFactor: 1.2,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      54, 105, 166, 1),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: const Text(
                                              ": Madripoor",
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    54, 105, 166, 1),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        // mainAxisSize: MainAxisSize.min,

                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: const Text(
                                              "Mobile Number",
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    54, 105, 166, 1),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: const Text(
                                              ": +91 98456 18256",
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    54, 105, 166, 1),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            child: const FittedBox(
                                              child: Icon(
                                                Icons.phone,
                                                color: Color.fromRGBO(
                                                    54, 105, 166, 1),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      if (user == UserDef.PD)
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.center,
                                          // mainAxisSize: MainAxisSize.min,

                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: const Text(
                                                  "Email",
                                                  textScaleFactor: 1.2,
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        54, 105, 166, 1),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: const Text(
                                                ": bpm@email.com",
                                                textScaleFactor: 1.2,
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      54, 105, 166, 1),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      if (user == UserDef.PD)
                                        const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(137, 224, 255, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text(
                                    "24 X 7 Helpline Number",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 72, 99, 1),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "For Customers",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 72, 99, 1)),
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(
                                    indent: 15,
                                    endIndent: 15,
                                    color: Color.fromRGBO(0, 72, 99, 1),
                                    thickness: 2,
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    child: TextButton(
                                      onPressed: null,
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color.fromRGBO(0, 72, 99, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        minimumSize:
                                            const Size(double.maxFinite, 30),
                                        // tapTargetSize: MaterialTapTargetSize.padded,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                      ),
                                      child: const Text(
                                        "+91 94710 30085",
                                        textScaleFactor: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            0, 106, 183, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        minimumSize:
                                            const Size(double.maxFinite, 30),
                                        // tapTargetSize: MaterialTapTargetSize.padded,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                      ),
                                      child: const Text(
                                        "Call Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
