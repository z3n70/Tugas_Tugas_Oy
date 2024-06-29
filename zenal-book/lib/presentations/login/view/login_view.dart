import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenal/presentations/component/component.dart';
import 'package:zenal/presentations/dashboard/view/dashboard.dart';
import 'package:zenal/presentations/register/view/register_view.dart';

class LoginView extends StatelessWidget {
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.book,
                  color: ColorPalette.primary,
                  size: 100,
                ),
                const SizedBox(
                  width: 5,
                ),
                Component.textBold(
                  "Zenal Books",
                  colors: ColorPalette.primary,
                  fontSize: 20,
                ),
              ],
            ),
            SizedBox(height: 50),
            Component.textBold("Hi \nWelcome Back !", colors: ColorPalette.primary, fontSize: 25, letterSpacing: .6),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autofillHints: [AutofillHints.email],
              style: Component.textFieldStyle(),
              decoration: Component.textFieldDecorationDefault(
                "Username, Phone Number or Email",
                iconPrefix: Icons.person,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              autofillHints: [AutofillHints.password],
              obscureText: true,
              style: Component.textFieldStyle(),
              decoration: Component.textFieldDecorationDefault(
                "Password",
                iconPrefix: Icons.lock,
              ),
            ),
            const SizedBox(
              height: 30,
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
                "Login",
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
                  "Don't have Account? ",
                  style: TextStyle(
                    color: ColorPalette.primary,
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(() => RegisterView()),
                  child: Text(
                    "Sign Up",
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
