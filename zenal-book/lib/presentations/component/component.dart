import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zenal/core/app/constant.dart';

export '../../core/app/color_palette.dart';
import '../../core/app/color_palette.dart';
export '../../core/app/constant.dart';

class Component {
  static ThemeData theme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.primary,
        foregroundColor: ColorPalette.primary,
        elevation: 0,
        shadowColor: ColorPalette.primary,
        surfaceTintColor: ColorPalette.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          backgroundColor: MaterialStateProperty.all<Color>(ColorPalette.primary),
          foregroundColor: MaterialStateProperty.all<Color>(ColorPalette.white),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all<Color>(ColorPalette.white),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(primary: ColorPalette.primary, secondary: ColorPalette.secondary.withAlpha(100)).copyWith(
            background: const Color(0xffF7F7F7),
          ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorPalette.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        modalBackgroundColor: ColorPalette.white,
        modalBarrierColor: ColorPalette.white,
        surfaceTintColor: ColorPalette.white,
      ),
      fontFamily: Constant.poppinsRegular,
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorPalette.white,
        surfaceTintColor: ColorPalette.white,
        shadowColor: ColorPalette.white,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.all<Color>(ColorPalette.white),
          surfaceTintColor: MaterialStateProperty.all<Color>(ColorPalette.white),
        ),
      ),
    );
  }

  static SystemUiOverlayStyle statusbar() {
    return SystemUiOverlayStyle(
      statusBarColor: ColorPalette.primary,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: null,
    );
  }

  static Text textBold(
    String content, {
    Color colors = Colors.white,
    double fontSize = 15,
    double? letterSpacing,
    int maxLines = 2,
    FontStyle? fontStyle,
    TextAlign textAlign = TextAlign.start,
    String fontFamily = Constant.poppinsRegular,
  }) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colors,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Text textDefault(
    String content, {
    Color colors = Colors.white,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start,
    String fontFamily = Constant.poppinsRegular,
  }) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: fontFamily,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static TextStyle textStyle() => const TextStyle(fontSize: 13.0, color: ColorPalette.blackText);

  static TextStyle textFieldStyle() => const TextStyle(fontSize: 13.0, color: ColorPalette.white);

  static textFieldDecorationDefault(
    String hint, {
    IconData? iconSuffix,
    IconData? iconPrefix,
    void Function()? onClickSuffix,
  }) =>
      InputDecoration(
        fillColor: ColorPalette.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorPalette.primary.withAlpha(100)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: ColorPalette.grey.withAlpha(100)),
        ),
        prefixIcon: iconPrefix != null ? Icon(iconPrefix, color: ColorPalette.primary) : null,
        suffixIcon: iconSuffix != null
            ? InkWell(
                onTap: onClickSuffix,
                child: Icon(
                  iconSuffix,
                  color: ColorPalette.primary,
                ),
              )
            : null,
        // prefixIcon: iconPrefix != null
        //     ? Image.asset(
        //         iconPrefix,
        //         height: 10,
        //         width: 10,
        //         fit: BoxFit.fill,
        //       )
        //     : null,
        counterText: "",
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        hintStyle: const TextStyle(
          fontSize: 12.0,
          color: ColorPalette.textGrey,
          fontWeight: FontWeight.w500,
        ),
      );
}
