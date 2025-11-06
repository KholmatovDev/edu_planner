import 'package:edu_planner/src/bloc/regions/regions_bloc.dart';
import 'package:edu_planner/src/service/navigation/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppGoRouter();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegionsBloc(),)
      ],
      child: ScreenUtilInit(
        splitScreenMode: true,
        designSize: const Size(400, 890),
        minTextAdapt: true,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0)),
            child: MaterialApp.router(
              color: Colors.white,
              routerConfig: router.router,
              debugShowCheckedModeBanner: false,
            ),

          );
        },
      ),
    );
  }
}
