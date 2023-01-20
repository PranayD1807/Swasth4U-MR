import 'package:demo/utils/custom_size.dart';

import 'package:demo/widgets/page_heading.dart';
import 'package:demo/widgets/work_history_tile.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CustomSize customSize = CustomSize();
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          const PageHeading(
            text: "Work History",
          ),
          Container(
            constraints: BoxConstraints(
                // maxHeight: MediaQuery.of(context).size.height * 0.72,
                maxHeight: customSize.getHeightForHomePage(context)),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => const WorkHistoryTile(),
            ),
          )
        ],
      ),
    );
  }
}
