import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final ButtonType type;
  const GlobalButton({super.key, required this.title, this.onTap,  this.type = ButtonType.filled});

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}
  bool isHovered = false;

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isHovered ? 1.0 : 0.95,
          duration: const Duration(milliseconds: 100),
      child: Material(
        color:widget.type==ButtonType.filled? AppColors.green: widget.type==ButtonType.secondary?AppColors.white:Colors.transparent,
        borderRadius: BorderRadius.circular(80),
        child: InkWell(
          onTap: widget.onTap,
          onTapUp: (value) {
            isHovered = true;
            setState(() {});
          },
          onTapDown: (value) {
            isHovered = false;
            setState(() {});
          },
          borderRadius: BorderRadius.circular(80),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding:  EdgeInsets.symmetric(vertical: 15.h, horizontal: 24.w),
            child:  Text(
              widget.title,
              style: TextStyle(
                color: widget.type==ButtonType.secondary?AppColors.primaryGreen: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType { filled, secondary, outline }