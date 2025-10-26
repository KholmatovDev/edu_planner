import 'package:edu_planner/my_app.dart';
import 'package:edu_planner/src/utils/assets/app_icons.dart';
import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextField extends StatefulWidget {
  final String hint;
  final String icon;
  const GlobalTextField({super.key, required this.hint, required this.icon});

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        color: AppColors.primaryGreen,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
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
