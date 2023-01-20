import 'package:demo/screens/home/associate_kyc_online_screen.dart';
import 'package:demo/screens/home/associate_kyc_pending.dart';
import 'package:demo/screens/home/associate_kyc_self.dart';
import 'package:demo/screens/home/associate_verify_kyc_screen.dart';
import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/page_heading.dart';
import 'package:flutter/material.dart';

class AssociateKYCScreen extends StatelessWidget {
  const AssociateKYCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> tools = [
      {
        "path": "assets/verify_card.png",
        "text": "Verify\nAssociate KYC",
        "page": const AssociateVerifyKYCScreen()
      },
      {
        "path": "assets/kyc.png",
        "text": "Associate\nKYC Online",
        "page": const AssociateKycOnlinePendingScreen()
      },
      {
        "path": "assets/kyc_self.png",
        "text": "Associate\nKYC Self",
        "page": const AssociateKycSelfScreen()
      },
    ];
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
            text: "Associate KYC",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  Container(
                    // height: 200,
                    constraints: const BoxConstraints(),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    width: double.maxFinite,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: tools.length,
                      itemBuilder: (context, i) {
                        // ignore: avoid_unnecessary_containers
                        return Container(
                          child: Center(
                            child: InkWell(
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              // splashColor: Colors.green,
                              onTap: () {
                                if (tools[i]["page"] != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => tools[i]["page"],
                                    ),
                                  );
                                }
                              },
                              child: CustomIconButtons(
                                path: tools[i]["path"],
                                text: tools[i]["text"],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
