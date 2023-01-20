import 'package:demo/screens/home/complaint_status_screen.dart';
import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/popup_new_complaint.dart';
import 'package:flutter/material.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        title: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(height: 35, child: Image.asset("assets/logo.png"))),
        // centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
        ),
      ),
      body: Column(
        children: <Widget>[
          const PageHeading(
            text: "Complaint",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            barrierColor: Colors.black12
                                .withOpacity(0.6), // Background color
                            barrierDismissible: true,
                            barrierLabel: 'Dialog',
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder: (_, __, ___) {
                              return const PopupNewComplaint();
                            },
                          );
                        },
                        child: const CustomIconButtons(
                          path: "assets/add_icon.png",
                          text: "Submit New\nComplaint",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ComplaintStatusScreen(),
                            ),
                          );
                        },
                        child: const CustomIconButtons(
                          path: "assets/complaint_icon.png",
                          text: "Complaint\nStatus",
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
