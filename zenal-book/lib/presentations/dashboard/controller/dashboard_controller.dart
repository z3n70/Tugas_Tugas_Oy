import 'package:get/get.dart';

enum DashboardType { Home, Profile }

class DashboardController extends GetxController {
  DateTime? backButtonPressTime;
  final snackBarDuration = const Duration(seconds: 3);
  DashboardType dashboardType = DashboardType.Home;

  onChangeDashboard(int value) {
    switch (value) {
      case 0:
        dashboardType = DashboardType.Home;
        break;
      case 1:
        dashboardType = DashboardType.Profile;
        break;
    }
    update();
  }

  Future<bool> handleWillPop() async {
    final now = DateTime.now();
    final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed = backButtonPressTime == null || now.difference(backButtonPressTime!) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = now;
      Get.snackbar("Konfirmasi", "Tekan sekali lagi untuk keluar");
      return false;
    }
    return true;
  }
}
