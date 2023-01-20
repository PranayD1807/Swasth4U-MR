import 'package:demo/utils/custom_size.dart';
import 'package:demo/widgets/associate_kyc_card.dart';
import 'package:demo/widgets/associate_list_tile.dart';

import 'package:flutter/material.dart';
import 'package:demo/widgets/page_heading.dart';

// ignore: must_be_immutable
class AssociateKycSelfScreen extends StatefulWidget {
  const AssociateKycSelfScreen({Key? key}) : super(key: key);

  @override
  State<AssociateKycSelfScreen> createState() => _AssociateKycSelfScreenState();
}

class _AssociateKycSelfScreenState extends State<AssociateKycSelfScreen> {
  CustomSize customSize = CustomSize();

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
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              const PageHeading(
                text: "Associates KYC Self",
              ),
              Container(
                constraints: BoxConstraints(
                    // maxHeight: MediaQuery.of(context).size.height * 0.72,
                    maxHeight:
                        customSize.getHeightForScreenWithoutBottomNav(context)),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => const AssociateKycCardTile(),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
