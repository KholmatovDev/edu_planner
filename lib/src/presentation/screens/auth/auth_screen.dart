import 'package:edu_planner/src/presentation/widget/buttons/global_button.dart';
import 'package:edu_planner/src/service/navigation/routing.dart';
import 'package:edu_planner/src/utils/assets/app_images.dart';
import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImages.globus.assetSvg(),
            20.h.ph,
            Text(
              'EduPlanner UZ',
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700),
            ),
            10.h.ph,
            Text(
              "Endi dars jadvali uchun rasmga olish shart emas\nBarcha funksiyalar bitta ilovada",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            GlobalButton(
              title: "Kirish",
              onTap: () {},
              type: ButtonType.filled,
            ),
            10.h.ph,
            GlobalButton(
              title: "Ro'yxatdan o'tish",
              onTap: () {
                context.push(RoutingConstants.register);
              },
              type: ButtonType.secondary,
            ),
            40.h.ph,
          ],
        ).paddingSymmetric(horizontal: 38.w).paddingOnly(top: 30.h),
      ),
    );
  }
}
