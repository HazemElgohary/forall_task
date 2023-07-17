import 'package:flutter/material.dart';
import 'package:forall_task/services/problem.dart';
import 'package:get_it/get_it.dart';

Future<void> inject() async{
  WidgetsFlutterBinding.ensureInitialized();
  final locator = GetIt.instance;
  locator.registerLazySingleton(() => ProblemService());
}