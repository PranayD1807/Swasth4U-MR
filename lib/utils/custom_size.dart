import 'dart:developer';

import 'package:flutter/material.dart';

class CustomSize {
  getHeightForHomePage(BuildContext ctx) {
    // Height required by screen
    // log(kToolbarHeight.toString()); -> 56
    // log(kBottomNavigationBarHeight.toString()); -> 56
    // log(Scaffold.of(ctx).appBarMaxHeight.toString()); -> 96
    // 30 is the height of TopWelcomeNar and PageHeading Widgets
    var bodyHeight = MediaQuery.of(ctx).size.height -
        (Scaffold.of(ctx).appBarMaxHeight! + kBottomNavigationBarHeight + 30);

    return bodyHeight;
  }

  getHeightForScreenWithoutBottomNav(BuildContext ctx) {
    var bodyHeight = MediaQuery.of(ctx).size.height -
        (Scaffold.of(ctx).appBarMaxHeight! + 30);

    return bodyHeight;
  }
}
