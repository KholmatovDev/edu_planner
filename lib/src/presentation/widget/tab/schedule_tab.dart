import 'package:flutter/material.dart';

import '../../../utils/colors/app_colors.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({super.key});

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

class _ScheduleTabState extends State<ScheduleTab> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) {
          return Container(
            child: Column(
              children: [
                Text(
                  _getWeekdayName(index),
                  style: TextStyle(
                    color: selectedIndex == index?AppColors.white:AppColors.underLine,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  _getWeekdayName(index),
                  style: TextStyle(
                    color: selectedIndex == index?AppColors.white:AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

String _getWeekdayName(int day){
  final weekday = ["D","S","Ch","P","J","Sh"];
  return weekday[day];
}
