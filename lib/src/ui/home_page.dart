import 'package:barber_app/src/ui/views/bottom_calender_view.dart';
import 'package:barber_app/src/ui/views/bottom_home_view.dart';
import 'package:barber_app/src/ui/views/bottom_search_view.dart';
import 'package:barber_app/src/ui/views/profile_bottom_view.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  int? currentIndex;

  HomePage({this.currentIndex});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _currentIndex = widget.currentIndex ?? 0;
  }

  onChange(int index) {
    _currentIndex = index;
    setState(() {});
  }

  final List<Widget> _widgets = [
    const BottomHomeView(),
    const SearchBottomView(),
    const CalenderBottomView(),
    const ProfileBottomView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        key: _scaffoldKey,
        body: _widgets[_currentIndex],
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: AppColors.yellowColors,
              //showUnselectedLabels: true,
              selectedIconTheme: const IconThemeData(color: Colors.black),
              onTap: onChange,
              currentIndex: _currentIndex,
              selectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.homeSheet,
                    color: _currentIndex == 0 ? Colors.black : null,
                    height: 15,
                    width: 15,
                  ),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: Image.asset(
                //     AppImages.search,
                //     height: 15,
                //     width: 15,
                //   ),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.grid,
                    height: 15,
                    width: 15,
                    color: _currentIndex == 1 ? Colors.black : null,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.calenderSheet,
                    height: 15,
                    width: 15,
                    color: _currentIndex == 2 ? Colors.black : null,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.personSheet,
                    height: 15,
                    width: 15,
                    color: _currentIndex == 3 ? Colors.black : null,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.yellowColors,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
