import 'package:edu_planner/src/service/navigation/routing.dart';
import 'package:edu_planner/src/utils/assets/app_icons.dart';
import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(3.seconds, () {
      context.push(RoutingConstants.authScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            AppIcons.logo.assetSvg().animate(effects: [
              FadeEffect(duration: 1000.ms),
              MoveEffect(
                duration: 500.ms,
                delay: 10.ms,
                begin: const Offset(0, -300),
                end: const Offset(0, 0),
              ),
            ]),
            const Spacer(),
            const CircularProgressIndicator(
              color: AppColors.white,
              strokeWidth: 6,
              strokeCap: StrokeCap.round,
            ).animate(effects: [
              FadeEffect(duration: 1000.ms, delay: 1000.ms),
            ]),
            20.ph,
            const Text(
              "www.xrcoder.uz",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ).paddingOnly(bottom: 30.h),
          ],
        ),
      ),
    );
  }
}
