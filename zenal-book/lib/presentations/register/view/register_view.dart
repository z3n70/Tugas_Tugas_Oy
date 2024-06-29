import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenal/presentations/component/component.dart';
import 'package:zenal/presentations/dashboard/view/dashboard.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorPalette.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 28.0, right: 28.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            Component.textBold("Create \nNew Account", colors: ColorPalette.primary, fontSize: 25, letterSpacing: .6),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  style: Component.textFieldStyle(),
                  decoration: Component.textFieldDecorationDefault("Name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  style: Component.textFieldStyle(),
                  decoration: Component.textFieldDecorationDefault("Email"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  style: Component.textFieldStyle(),
                  decoration: Component.textFieldDecorationDefault("Password"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  style: Component.textFieldStyle(),
                  decoration: Component.textFieldDecorationDefault("Date Of Birth"),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorPalette.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Get.offAll(() => Dashboard()),
              child: Component.textBold(
                "Sign Up",
                colors: ColorPalette.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Have Account? ",
                  style: TextStyle(
                    color: ColorPalette.primary,
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: "Poppins-Bold",
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.primary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
