import 'package:demo/ad_screen.dart';
import 'package:demo/data/user_type.dart';
import 'package:demo/screens/drawer.dart';
import 'package:demo/screens/history_screen.dart';

import 'package:demo/screens/home/mr_home_screen.dart';
import 'package:demo/screens/developer_profile_screen.dart';
import 'package:demo/screens/home/pd_home_screen.dart';
import 'package:demo/screens/share_screen.dart';

import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  UserType userType = UserType();
  int index = 1;

  @override
  void initState() {
    super.initState();

    // showing ad
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showGeneralDialog(
        context: context,
        barrierColor: Colors.black12.withOpacity(0.6), // Background color
        barrierDismissible: true,
        barrierLabel: 'Dialog',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) {
          return const AdBannerScreen();
        },
      );
    });
  }

  // setting up home screen
  Widget homeScreen() {
    return FutureBuilder(
      future: userType.getUserType(),
      builder: (context, AsyncSnapshot<UserDef?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        UserDef? user = snapshot.data;
        if (user == UserDef.MR) {
          return const MRHomeScreen();
        } else if (user == UserDef.PD) {
          return const PDHomeScreen();
        }
        return const Center(
          child: Text("Something went wrong!"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int i) {
      setState(() {
        index = i;
      });
    }

    List<Widget> screens = [
      const ShareScreen(),
      homeScreen(),
      const HistoryScreen(),
    ];
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(icon: Icon(Icons.share), label: "Share"),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      const BottomNavigationBarItem(
          icon: ImageIcon(AssetImage("assets/notes.png")), label: "Notes"),
    ];
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.blue,
        backgroundColor: Colors.transparent,
        title: SizedBox(height: 30, child: Image.asset("assets/logo.png")),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const ImageIcon(
            AssetImage("assets/drawer.png"),
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              maximumSize: const Size(50, 40),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DeveloperProfileProfileScreen(),
              ));
            },
            child: SizedBox(
              height: 30,
              width: 300,
              child: Image.asset("assets/dev_img_icon.png"),
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(0, 106, 183, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        items: items,
        currentIndex: index,
        onTap: _onItemTapped,
      ),
      body: screens[index],
    );
  }
}
