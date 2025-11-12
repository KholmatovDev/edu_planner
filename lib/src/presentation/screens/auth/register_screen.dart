import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
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
          builder: (context, authState) {
            return BlocBuilder<RegionsBloc, RegionsState>(
              builder: (context, state) {
                return GlobalButton(
                  isLoading: authState.isLoading,
                  title: _page.page == 0.0 ? "Hududni tanlash" : "Ro'yxatdan o'tish",
                  onTap: _canRegister
                      ? () {
                          if (_page.page == 0.0) {
                            _page.jumpToPage(1);
                            setState(() {});
                          } else if (state.selectedClass != null &&
                              state.selectedRegion != null &&
                              state.selectedSchool != null) {
                            _bloc.add(
                              AuthEvent.register(
                                username: usernameController.text,
                                password: passwordController.text,
                                classId: state.selectedClass!,
                                regionId: state.selectedRegion!,
                                schoolId: state.selectedSchool!,
                              ),
                            );
                          }
                        }
                      : null,
                );
              },
            ).opacity(_canRegister ? 1 : 0.4);
          },
        ),
      ).paddingSymmetric(horizontal: 38.w).paddingOnly(bottom: 30.h),
      backgroundColor: AppColors.primaryGreen,
      body: PageView(
        controller: _page,
        physics: NeverScrollableScrollPhysics(),
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
                        _canRegister = value.length >= 3 &&
                            passwordController.text == retypePasswordController.text &&
                            passwordController.text.length >= 6;
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
                        _canRegister = value == retypePasswordController.text && value.length >= 6;
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
                        _canRegister = value == passwordController.text && value.length >= 6;
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
                  "Tizimga kirish uchun maktabni tanlang🫆",
                  style: 18.semiBold(
                    AppColors.white,
                  ),
                ).globalAnimate(),
                60.ph,
                BlocBuilder<RegionsBloc, RegionsState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            DropDownState<String>(
                              dropDown: DropDown<String>(
                                data: <SelectedListItem<String>>[
                                  ...List.generate(
                                    state.regions?.regions.length ?? 0,
                                    (index) {
                                      return SelectedListItem(
                                        data: state.regions?.regions[index].name ?? "",
                                      );
                                    },
                                  )
                                ],
                                onSelected: (selectedItems) {
                                  List<String> list = [];
                                  for (var item in selectedItems) {
                                    list.add(item.data);
                                  }
                                  context
                                      .read<RegionsBloc>()
                                      .add(RegionsEvent.setRegion(list.first));
                                },
                              ),
                            ).showModal(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 23.h),
                            decoration: BoxDecoration(
                                color: AppColors.white, borderRadius: BorderRadius.circular(16.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.selectedRegionName ?? "Shaxar/Tuman",
                                  style: 16.medium(AppColors.primaryGreen),
                                ),
                                AppIcons.arrowDown.assetSvg(),
                              ],
                            ),
                          ),
                        ).globalAnimate(),
                        20.ph,
                        if (state.selectedRegion != null)
                          GestureDetector(
                            onTap: () {
                              DropDownState<String>(
                                dropDown: DropDown<String>(
                                  data: <SelectedListItem<String>>[
                                    ...List.generate(
                                      state.schools?.schools.length ?? 0,
                                      (index) {
                                        return SelectedListItem(
                                          data: state.schools?.schools[index].name ?? "",
                                        );
                                      },
                                    )
                                  ],
                                  onSelected: (selectedItems) {
                                    List<String> list = [];
                                    for (var item in selectedItems) {
                                      list.add(item.data);
                                    }
                                    context
                                        .read<RegionsBloc>()
                                        .add(RegionsEvent.setSchool(list.first));
                                  },
                                ),
                              ).showModal(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 23.h),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.isLoading
                                        ? "Yuklanmoqda..."
                                        : state.selectedSchoolName ?? "Maktab",
                                    style: 16.medium(AppColors.primaryGreen),
                                  ),
                                  AppIcons.arrowDown.assetSvg(),
                                ],
                              ),
                            ).globalAnimate(),
                          ),
                        20.ph,
                        if (state.selectedSchool != null)
                          GestureDetector(
                            onTap: () {
                              DropDownState<String>(
                                dropDown: DropDown<String>(
                                  data: <SelectedListItem<String>>[
                                    ...List.generate(
                                      state.classes?.classes.length ?? 0,
                                      (index) {
                                        return SelectedListItem(
                                          data: state.classes?.classes[index].name ?? "",
                                        );
                                      },
                                    )
                                  ],
                                  onSelected: (selectedItems) {
                                    List<String> list = [];
                                    for (var item in selectedItems) {
                                      list.add(item.data);
                                    }
                                    print(list);
                                    context
                                        .read<RegionsBloc>()
                                        .add(RegionsEvent.setClass(list.first));
                                  },
                                ),
                              ).showModal(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 23.h),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.isClassLoading
                                        ? "Yuklanmoqda..."
                                        : state.selectedClassName ?? "Sinf",
                                    style: 16.medium(AppColors.primaryGreen),
                                  ),
                                  AppIcons.arrowDown.assetSvg(),
                                ],
                              ),
                            ).globalAnimate(),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ).paddingSymmetric(horizontal: 16.w).paddingOnly(top: 40.h),
          )
        ],
      ),
    );
  }
}
