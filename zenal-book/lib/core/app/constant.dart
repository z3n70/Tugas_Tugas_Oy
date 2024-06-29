enum SnackType { success, info, error, warning }

enum BaseUrl { production, stagging }

enum ButtonType {
  primary,
  secondary,
  success,
  edit,
  cancel,
  warning,
  info,
  light,
  dark,
  link,
  outlinePrimary,
  outlineSecondary,
  outlineSuccess,
  outlineError,
  outlineWarning,
  outlineInfo,
  outlineLight,
  outlineDark,
  outlineLink,
}

enum TextTitleType { m1, m2, m3, l1, l2, l3, xl1, xl2, xl3, xxl1, xxl2, xxl3, xxxl1, xxxl2, xxxl3 }

enum TextBodyType { xs1, xs2, xs3, s1, s2, m1, m2, m3, l1, l2, l3 }

enum TextLabelType { green, red, blue, black, white, grey, yellow }

class Constant {
  static const String baseUrl = "http://gutendex.com/books";

  static const poppinsRegular = "poppins_regular";
  static const poppinsBold = "poppins_bold";
  static const String authBox = "auth";

  static const int durationShimmer = 1200;
  static const double imageSize = 120;
  static const double imageSizeL = 150;
}
