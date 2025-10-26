import 'package:edu_planner/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: _bloc,
          builder: (context, state) {
            return GlobalButton(
              title: "Ro'yhatdan o'tish",
              onTap: _canRegister
                  ? () {
                      _bloc.add(
                        AuthEvent.register(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  : null,
            ).opacity(_canRegister ? 1 : 0.4);
          },
        ),
      ).paddingSymmetric(horizontal: 38.w).paddingOnly(bottom: 30.h),
      backgroundColor: AppColors.primaryGreen,
      body: SingleChildScrollView(
        child: Column(
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
                      _canRegister = value.length>=3;
                      setState(() {

                      });
                    },
                  ),
                  10.ph,
                  GlobalTextField(
                    hint: "Parol",
                    icon: AppIcons.password,
                    controller: passwordController,
                    isPassword: true,
                    onChanged: (value) {
                      _canRegister = value == retypePasswordController.text && value.length>=6;
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
                      _canRegister = value == passwordController.text && value.length>=6;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
