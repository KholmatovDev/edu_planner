import 'package:edu_planner/src/bloc/regions/regions_bloc.dart';
import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/assets/app_icons.dart';
import '../../../utils/assets/app_images.dart';
import '../../../utils/colors/app_colors.dart';
import '../../widget/buttons/global_button.dart';
import '../../widget/text_fields/global_text_field.dart';
import 'bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final retypePasswordController = TextEditingController();
  final _bloc = AuthBloc();

  bool _canRegister = false;

  @override
  void initState() {
    context.read<RegionsBloc>().add(RegionsEvent.getRegions());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _page = PageController();
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: _bloc,
          builder: (context, state) {
            return GlobalButton(
              title: "Hududni tanlash",
              onTap: _canRegister
                  ? () {
                      _page.animateToPage(1,
                          duration: 200.ms,
                          curve: Curves.fastEaseInToSlowEaseOut);
                    }
                  : null,
            ).opacity(_canRegister ? 1 : 0.4);
          },
        ),
      ).paddingSymmetric(horizontal: 38.w).paddingOnly(bottom: 30.h),
      backgroundColor: AppColors.primaryGreen,
      body: PageView(
        controller: _page,
        children: [
          Column(
            children: [
              30.h.ph,
              AppImages.listening.assetSvg(size: 350.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: Column(
                  children: [
                    GlobalTextField(
                      hint: "Login",
                      icon: AppIcons.head,
                      controller: usernameController,
                      onChanged: (value) {
                        _canRegister = value.length >= 3;
                        setState(() {});
                      },
                    ),
                    10.ph,
                    GlobalTextField(
                      hint: "Parol",
                      icon: AppIcons.password,
                      controller: passwordController,
                      isPassword: true,
                      onChanged: (value) {
                        _canRegister = value == retypePasswordController.text &&
                            value.length >= 6;
                        setState(() {});
                      },
                    ),
                    10.ph,
                    GlobalTextField(
                      hint: "Parolni qayta kiriting",
                      icon: AppIcons.password,
                      controller: retypePasswordController,
                      isPassword: true,
                      onChanged: (value) {
                        _canRegister = value == passwordController.text &&
                            value.length >= 6;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Salom ${usernameController.text.split(" ").first}!",
                  style: 28.bold(
                    AppColors.white,
                  ),
                ).globalAnimate(),
                Text(
                  "Tizimga kirish uchun maktabni tanlang",
                  style: 18.semiBold(
                    AppColors.white,
                  ),
                ).globalAnimate(),

                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 23.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16.r)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shaxar/Tuman",
                          style: 16.medium(AppColors.primaryGreen),
                        ),
                        AppIcons.arrowDown.assetSvg(),
                      ],
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w).paddingOnly(top: 40.h),
          )
        ],
      ),
    );
  }
}
