import 'dart:developer';

import 'package:demo/data/user_type.dart';
import 'package:demo/screens/card_usage.dart';
import 'package:demo/screens/home/associate_kyc_screen.dart';
import 'package:demo/screens/home/associate_list_screen.dart';
import 'package:demo/screens/home/associate_onboarding_screen.dart';
import 'package:demo/screens/home/associate_screen.dart';
import 'package:demo/screens/home/associate_kyc_online_screen.dart';
import 'package:demo/screens/home/attendence_screen.dart';
import 'package:demo/screens/home/card_renewal_screen.dart';
import 'package:demo/screens/home/complaint_screen.dart';
import 'package:demo/screens/home/customer_list_screen.dart';
import 'package:demo/screens/home/customer_onboarding_screen.dart';
import 'package:demo/screens/home/document_screen.dart';
import 'package:demo/screens/home/expenses_screen.dart';
import 'package:demo/screens/home/medical_camp_screen.dart';
import 'package:demo/screens/home/my_profile_screen.dart';
import 'package:demo/screens/home/requirement_screen.dart';
import 'package:demo/screens/home/transactions_screen.dart';

import 'package:demo/screens/home/verify_card.dart';
import 'package:demo/screens/home/work_report_screen.dart';
import 'package:demo/utils/custom_size.dart';

import 'package:demo/widgets/card.dart';
import 'package:demo/widgets/custom_icon_buttons.dart';
import 'package:demo/widgets/top_welcome_nav.dart';
import 'package:flutter/material.dart';

import 'package:marquee/marquee.dart';

class PDHomeScreen extends StatelessWidget {
  const PDHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CustomSize customSize = CustomSize();

    List<Map> tools = [
      {
        "path": "assets/my_profile_main.png",
        "text": "My Profile",
        "page": const MyProfileScreen()
      },
      {
        "path": "assets/attendance_icon.png",
        "text": "Attendance",
        "page": const AttendanceScreen()
      },
      {
        "path": "assets/associate.png",
        "text": "Associate",
        "page": const AssociateScreen()
      },
      {
        "path": "assets/customer.png",
        "text": "Customer Onboarding",
        "page": const CustomerOnboardingScreen(),
      },
      {
        "path": "assets/document_icon.png",
        "text": "Customer List",
        "page": const CustomerListScreen()
      },
      {
        "path": "assets/verify_card.png",
        "text": "Card Renual",
        "page": const CardRenewalScreen()
      },
      {
        "path": "assets/verify_card.png",
        "text": "Verify Card",
        "page": const VerifyCardScreen(),
      },
      {
        "path": "assets/transaction.png",
        "text": "Transaction",
        "page": TransactionsScreen()
      },
      {
        "path": "assets/card_usage.png",
        "text": "Card Usage",
        "page": CardUsageScreen()
      },
      {
        "path": "assets/pay_scale-icon.png",
        "text": "Pay Scale",
        // "page": const EKYCScreen(),
      },
      {
        "path": "assets/requirement_icon.png",
        "text": "Requirement",
        "page": const RequirementScreen()
      },
      {
        "path": "assets/document_icon.png",
        "text": "Document",
        "page": const DocumentScreen()
      },
      {
        "path": "assets/icon-park_expenses.png",
        "text": "Expenses",
        "page": const ExpensesScreen()
      },
      {
        "path": "assets/complaint_icon.png",
        "text": "Complaint",
        "page": const ComplaintScreen()
      },
    ];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const MyTopNav(),
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                constraints: BoxConstraints(
                    maxHeight: customSize.getHeightForHomePage(context),
                    minHeight: 200),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: const [
                            _DetailInfoTab(title: "Monthly Salary\n₹ 15,000/-"),
                            _DetailInfoTab(
                              title: "Wallet",
                              val: "4560",
                            ),
                            _DetailInfoTab(
                              title: "Performance\nno of Cards",
                              val: "10",
                            ),
                            _DetailInfoTab(
                              title: "Monthly Target\n210 Cards",
                            ),
                            _DetailInfoTab(
                              title: "Incentive",
                              val: "₹ 10,000/-",
                            ),
                            _DetailInfoTab(
                              title: "Total No.\nof Customers",
                              val: "400",
                            ),
                          ],
                        ),
                      ),
                      MyCard(
                        cardWidth: MediaQuery.of(context).size.width * 0.9,
                      ),
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
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: tools.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
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
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // message bar top
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(208, 255, 227, 1)),
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 25,
                child: Marquee(
                  text:
                      "Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum Lorem ipsum Loren Ipsum Loren Ipsum Lorem Ipsum",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _DetailInfoTab extends StatelessWidget {
  const _DetailInfoTab({Key? key, required this.title, this.val})
      : super(key: key);
  final String title;
  final String? val;
  @override
  Widget build(BuildContext context) {
    double tileWidth = MediaQuery.of(context).size.width * 0.425;
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 106, 183, 1),
          borderRadius: BorderRadius.circular(10)),
      width: tileWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: val != null
                ? BoxConstraints(
                    maxWidth: tileWidth * 0.6 - 10,
                    maxHeight: 50 - 10,
                  )
                : null,
            child: FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (val != null)
            Container(
              constraints: BoxConstraints(
                maxWidth: tileWidth * 0.4 - 15,
              ),
              child: FittedBox(
                child: Text(
                  val!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
