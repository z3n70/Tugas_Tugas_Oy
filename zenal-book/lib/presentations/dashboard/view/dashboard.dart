import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenal/core/app/color_palette.dart';

import '../../home/view/home_view.dart';
import '../../profile/view/profile_view.dart';
import '../controller/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key, this.page = 0}) : super(key: key);
  final int page;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorPalette.black,
          body: WillPopScope(
            onWillPop: () => controller.handleWillPop(),
            child: (() {
              switch (controller.dashboardType) {
                case DashboardType.Home:
                  return HomeView();
                case DashboardType.Profile:
                  return ProfileView();
                default:
                  return Container();
              }
            }()),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorPalette.primary,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            currentIndex: controller.dashboardType.index,
            selectedItemColor: ColorPalette.white,
            onTap: (index) => controller.onChangeDashboard(index),
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: ColorPalette.white,
                ),
                icon: Icon(Icons.home, color: ColorPalette.grey),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.person,
                  color: ColorPalette.white,
                ),
                icon: Icon(Icons.person, color: ColorPalette.grey),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
