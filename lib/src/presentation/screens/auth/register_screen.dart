import 'package:edu_planner/my_app.dart';
import 'package:edu_planner/src/presentation/widget/text_fields/global_text_field.dart';
import 'package:edu_planner/src/utils/assets/app_icons.dart';
import 'package:edu_planner/src/utils/assets/app_images.dart';
import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: Column(
        children: [
          AppImages.listening.assetSvg(),
         const Column(
            children: [
              const GlobalTextField(
                hint: "Login",
                icon: AppIcons.head,
              ),
            ],
          ).paddingSymmetric(horizontal: 38.w),
        ],
      ),
    );
  }
}
