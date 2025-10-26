import 'package:edu_planner/src/utils/assets/app_icons.dart';
import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextField extends StatefulWidget {
  final String hint;
  final String icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final bool isPassword;
  const GlobalTextField({super.key, required this.hint, required this.icon, this.onChanged, required this.controller, this.isPassword = false});

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool obSecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.isPassword&&obSecure,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        color: AppColors.primaryGreen,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword?  GestureDetector(
          onTap: () {
            obSecure=!obSecure;
            setState(() {

            });
          },
          child: obSecure? AppIcons.eyeClosed.assetSvg().paddingSymmetric(vertical: 15):AppIcons.eyeOpen.assetSvg().paddingSymmetric(vertical: 15),
        ):null,
        prefixIcon: widget.icon.assetSvg().paddingSymmetric(vertical: 8.h),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16.r),
        ),
        hintStyle: TextStyle(
          color: AppColors.primaryGreen.withOpacity(0.5),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 23.h,
        ),
      ),
    );
  }
}
