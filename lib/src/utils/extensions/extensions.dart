import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';


extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
  String weekday() {
    switch (this){
      case "1":
        return "Dushanba";
      case "2":
        return "Seshanba";
      case "3":
        return "Chorshanba";
      case "4":
        return "Payshanba";
      case "5":
        return "Juma";
      case "6":
        return "Shanba";
        case "7":
        return "Yakshanba";
      default:
        return "";
    }
  }
  String monthName() {
    switch (this) {
      case "1":
      case "01":
        return "Ya";
      case "2":
      case "02":
        return "Fe";
      case "3":
      case "03":
        return "Mart";
      case "4":
      case "04":
        return "Apr";
      case "5":
      case "05":
        return "May";
      case "6":
      case "06":
        return "Iyun";
      case "7":
      case "07":
        return "Iyul";
      case "8":
      case "08":
        return "Avg";
      case "9":
      case "09":
        return "Se";
      case "10":
        return "Okt";
      case "11":
        return "Noy";
      case "12":
        return "Dek";
      default:
        return "";
    }
  }


// String prettyPrice({String? currency, String? pattern}) {
//   return "${NumberFormat("#,### ${currency ?? ''}").format(num.tryParse(this) ?? 0).replaceAll(RegExp(r',' r''), pattern ?? ' ')} ";
// }
//
// String formatNumber({String? mask}) {
//   return MaskTextInputFormatter(initialText: this, mask: mask, filter: {"#": RegExp(r"[0-9]")}).getMaskedText();
// }
//
// String formatString({String? mask}) {
//   return MaskTextInputFormatter(initialText: this, mask: mask, filter: {"d": RegExp(r"[0-9]"), "s": RegExp(r"[a-zA-Z]")})
//       .getMaskedText();
// }
//
// String prettyDate([String? pattern]) => DateFormat(pattern ?? 'dd.MM.yyyy').format(DateTime.parse(this));
}

extension WidgetExtension on Widget {
  Widget paddingAll([double all = 0.0]) => Padding(padding: EdgeInsets.all(all), child: this);

  Widget paddingSymmetric({double? horizontal, double? vertical}) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0), child: this);
  }

  Widget paddingOnly({double? left, double? right, double? top, double? bottom}) {
    return Padding(padding: EdgeInsets.only(left: left ?? 0, right: right ?? 0, top: top ?? 0, bottom: bottom ?? 0), child: this);
  }

  Widget circleRadius([double radius = 0]) => ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  Widget backgroundColor([Color color = Colors.transparent]) => Material(color: color, child: this);

  Widget opacity([double opacity = 1.0]) => Opacity(opacity: opacity, child: this);

  Widget visibility([bool visible = true]) => Visibility(visible: visible, child: this);

  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);

  Widget flexible([int flex = 1]) => Flexible(flex: flex, child: this);

  Widget globalAnimate([int delay = 100]) => this.animate().fade(begin: 0,end: 1, delay: delay.ms,duration: 1000.ms).move(begin: Offset(0, -50),end: Offset(0, 0),duration: 400.ms, delay: 100.ms);
}

extension WrapWidgetExtension on String {
  /// Wrap Image
  Image networkImage({BoxFit? fit}) => Image(image: NetworkImage(this), fit: fit);

  Image assetImage({BoxFit? fit, double? width, double? height}) => Image(image: AssetImage(this), fit: fit, width: width, height: height);

  Image fileImage() => Image(image: FileImage(File(this)));

  /// Wrap Svg
  Widget assetSvg({Color? color, double? size}) {
    return SvgPicture.asset(this, colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null, width: size, height: size,);
  }

  // Widget networkSvg([Color? color, double? size]) {
  //   return SvgPicture.network(
  //     this,
  //     colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  //     width: size,
  //     placeholderBuilder: (context) {
  //       return Image.asset(AppImages.emptyImage, fit: BoxFit.cover);
  //     },
  //   );
  // }

  Widget fileSvg([Color? color, double? size]) {
    return SvgPicture.file(File(this), colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null, width: size);
  }

  Size getTextSizeInPixels(String text, TextStyle style) {
    return (TextPainter(text: TextSpan(text: this, style: style), maxLines: 1)..layout()).size;
  }
}

// extension DateTimeExtensions on DateTime {
//   String differenceDate({DateTime? date, String? locale, String? end}) {
//     String endText = locale == "Latn-UZ"
//         ? "oldin"
//         : locale == "Cyrl-UZ"
//         ? "олдин"
//         : "назад";
//     return end != null
//         ? timeago.format(this, locale: locale, clock: date, allowFromNow: true).replaceFirst(endText, end)
//         : timeago.format(this, locale: locale, clock: date, allowFromNow: true);
//   }
// }

extension NumExtension on num {

  SizedBox get ph => SizedBox(height: toDouble().h);
  SizedBox get pw => SizedBox(width: toDouble().w);
  /// Text Styles
  TextStyle regular([Color? color]) {
    return TextStyle(fontSize: toDouble(), color: color ?? AppColors.black,  fontWeight: FontWeight.w400);
  }

  TextStyle medium([Color? color]) {
    return TextStyle(fontSize: toDouble(), color: color ?? AppColors.black,  fontWeight: FontWeight.w500);
  }

  TextStyle semiBold([Color? color]) {
    return TextStyle(fontSize: toDouble(), color: color ?? AppColors.black,  fontWeight: FontWeight.w600);
  }

  TextStyle bold([Color? color]) {
    return TextStyle(fontSize: toDouble(), color: color ?? AppColors.black,  fontWeight: FontWeight.w700);
  }

  TextStyle extraBold([Color? color]) {
    return TextStyle(fontSize: toDouble(), color: color ?? AppColors.black, fontWeight: FontWeight.w800);
  }

// (String, TextStyle) text99() {
//   if (this > 99) {
//     return ("99+", 10.semiBold(AppColors.white));
//   } else {
//     return (toString(), 12.semiBold(AppColors.white));
//   }
// }

// /// Other
// Divider divider([Color? color]) => Divider(thickness: toDouble(), color: color ?? AppColors.underline);
}

extension KeyExtension on GlobalKey {
  Size getSize() {
    var context = currentContext;
    Size size = context != null ? (context.findRenderObject() as RenderBox).size : const Size(0, 0);
    return Size(size.width.ceilToDouble(), size.height.ceilToDouble());
  }
}

extension LocaleExtension on Locale {
  getLangName() {
    switch (countryCode) {
      case "RU":
        return "Русский";
      case "Cyrl-UZ":
        return "Ўзбекча";
      case "Latn-UZ":
        return "O'zbekcha";
      default:
        return "none";
    }
  }

// Future<void> setLang(BuildContext context) async {
//   await context.setLocale(this);
//   await locator<SecureStorage>().setLang("$languageCode-$countryCode");
// }
//
// String localeValue({required String ru, required String uzc, required String uz}) {
//   if (this == languages[0]) {
//     return ru;
//   } else if (this == languages[1]) {
//     return uzc;
//   } else {
//     return uz;
//   }
// }
}
