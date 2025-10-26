import 'package:edu_planner/my_app.dart';
import 'package:edu_planner/src/service/api/dio/secure_storage.dart';
import 'package:edu_planner/src/service/di/di.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await SecureStorage.initSharedPref();
  runApp(const MyApp());
}