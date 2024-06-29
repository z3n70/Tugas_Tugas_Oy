import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenal/presentations/component/component.dart';
import 'package:zenal/presentations/splashscreen/controller/splashscreen_controller.dart';

class SplashscreenView extends StatelessWidget {
  SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashscreenController>(
      init: SplashscreenController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorPalette.primary,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.book,
                  color: ColorPalette.white,
                  size: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                Component.textBold("Zenal Books", colors: ColorPalette.white),
              ],
            ),
          ),
        );
      },
    );
  }
}
