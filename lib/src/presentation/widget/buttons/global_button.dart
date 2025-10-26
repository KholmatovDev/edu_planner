import 'package:edu_planner/src/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GlobalButton extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final ButtonType type;
  final bool isLoading;
  const GlobalButton({super.key, required this.title, this.onTap, this.type = ButtonType.filled,  this.isLoading = false});

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: AnimatedScale(
        scale: isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Material(
          borderRadius: BorderRadius.circular(80),
          color: widget.type == ButtonType.filled
              ? AppColors.green
              : widget.type == ButtonType.secondary
                  ? AppColors.white
                  : Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(80),
            onTap: widget.onTap,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 24.w),
              child:widget.isLoading?SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeCap: StrokeCap.round,
                  )) :Text(
                widget.title,
                style: TextStyle(
                  color: widget.type == ButtonType.secondary
                      ? AppColors.primaryGreen
                      : AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setPressed(bool value) {
    setState(() => isPressed = value);
  }
}


enum ButtonType { filled, secondary, outline }