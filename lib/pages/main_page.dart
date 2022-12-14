import 'package:car_marketplace_ui/pages/car_store_page.dart';
import 'package:car_marketplace_ui/pages/profile_page.dart';
import 'package:car_marketplace_ui/pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const CarStorePage(),
    const SearchPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    List<GButton> navButtons = [
      _buildNavBarButton(icon: CupertinoIcons.settings_solid, text: 'Browse'),
      _buildNavBarButton(icon: CupertinoIcons.search, text: 'Search'),
      _buildNavBarButton(icon: CupertinoIcons.profile_circled, text: 'Profile'),
    ];
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: _buildAppBar(screenSize),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              width: double.infinity,
              height: screenSize.height * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.elliptical(300, 100),
                    bottomEnd: Radius.elliptical(750, 275)),
                color: Colors.deepPurple,
              ),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: GNav(
          tabs: navButtons,
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.white,
          activeColor: Colors.redAccent[100],
          tabBackgroundColor: Colors.redAccent.withOpacity(0.08),
          selectedIndex: _currentIndex,
          haptic: true,
          duration: const Duration(milliseconds: 1),
          gap: 5,
          tabMargin: const EdgeInsets.all(15),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(Size size) => AppBar(
        toolbarHeight: size.height * 0.1,
        centerTitle: true,
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          child: const Icon(Icons.menu),
          padding: const EdgeInsetsDirectional.only(start: 10),
        ),
        title: SizedBox(
          width: size.width * 0.6,
          child: CupertinoSearchTextField(
            padding: const EdgeInsets.symmetric(vertical: 15),
            prefixInsets: const EdgeInsets.symmetric(horizontal: 15),
            backgroundColor: Colors.black.withOpacity(0.08),
            itemColor: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        actions: [
          Container(
            child: const Icon(CupertinoIcons.profile_circled),
            padding: const EdgeInsetsDirectional.only(end: 10),
          )
        ],
      );
  GButton _buildNavBarButton({required IconData icon, required String text}) =>
      GButton(
        icon: icon,
        text: text,
      );
}
