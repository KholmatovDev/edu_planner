import 'package:edu_planner/my_app.dart';
import 'package:edu_planner/src/presentation/screens/auth/auth_screen.dart';
import 'package:edu_planner/src/presentation/widget/tab/schedule_tab.dart';
import 'package:edu_planner/src/utils/assets/app_icons.dart';
import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Material(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(top: 70.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text("Full screen bottom sheet", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          highlightColor: AppColors.primaryGreen,
          child: Container(
            padding: EdgeInsets.all(16.sp),
            child: AppIcons.childHead.assetSvg(color: AppColors.white),
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      backgroundColor: AppColors.primaryGreen,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Row(
              children: [
                Text(
                  "${DateTime.now().day}",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 44.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                10.w.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      "${DateTime.now().month.toString().monthName()} ${DateTime.now().year}",
                      style: TextStyle(
                          color: AppColors.white.withOpacity(0.4), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      textAlign: TextAlign.start,
                      "${DateTime.now().weekday.toString().weekday()}",
                      style: TextStyle(
                          color: AppColors.white.withOpacity(0.4), fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                  decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Text(
                    "Bugun",
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 28.w),
          ),
          14.h.ph,
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
            ),
            child: Column(
              children: [
                20.ph,
                ScheduleTab(),
                12.ph,
                Container(
                  width: double.infinity,
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: AppColors.underLine.withOpacity(0.4),
                  ),
                ),
                20.ph,
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Vaqti",
                          style:
                              TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold),
                        ),
                        31.pw,
                        Text(
                          "Dars",
                          style:
                              TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 31.w)
              ],
            ),
          ).expanded(),
        ],
      ),
    );
  }
}
