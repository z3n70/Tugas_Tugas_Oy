import 'package:get/get.dart';
import 'package:zenal/presentations/login/view/login_view.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    checkSession();
    super.onInit();
  }

  Future checkSession() async {
    await 2.delay();
    Get.offAll(() => LoginView(), transition: Transition.fade);
  }
}
