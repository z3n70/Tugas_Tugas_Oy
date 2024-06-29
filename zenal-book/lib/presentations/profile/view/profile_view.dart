import 'package:flutter/material.dart';
import 'package:zenal/presentations/component/component.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://static.wikia.nocookie.net/tokyorevengers/images/c/cd/Anime_mikey.jpg/revision/latest?cb=20220219124743&path-prefix=es",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Component.textBold(
                        "Hi, Zenal",
                        colors: ColorPalette.primary,
                        fontSize: 20,
                      ),
                      Component.textDefault(
                        "zenal@gmail.com",
                        colors: ColorPalette.primary,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorPalette.primary, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: ColorPalette.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Component.textDefault(
                      "Favorite",
                      colors: ColorPalette.primary,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorPalette.primary,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorPalette.primary, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.password,
                      color: ColorPalette.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Component.textDefault(
                      "Change Password",
                      colors: ColorPalette.primary,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorPalette.primary,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorPalette.primary, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: ColorPalette.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Component.textDefault(
                      "Info",
                      colors: ColorPalette.primary,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorPalette.primary,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorPalette.primary, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorPalette.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Component.textDefault(
                      "Rate Us",
                      colors: ColorPalette.primary,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorPalette.primary,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorPalette.primary, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.thumb_up,
                      color: ColorPalette.primary,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Component.textDefault(
                      "Donate",
                      colors: ColorPalette.primary,
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: ColorPalette.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorPalette.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Component.textBold("Logout"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
