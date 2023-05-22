import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_list/core/di/dependency_controller.dart';
import 'package:marvel_list/core/network/dio_helper.dart';
import 'package:marvel_list/features/home/data/repository/character_repository_imp.dart';
import 'package:marvel_list/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:marvel_list/features/home/presentation/home_page.dart';
import 'package:marvel_list/core/common/colors.dart';
import 'package:marvel_list/core/common/strings.dart';
import 'features/home/data/repository/character_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
        title: AppStrings.appName,
        theme: ThemeData(
          fontFamily: 'Airbnb',
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) =>
              HomeCubit(characterRepository: getIt<CharacterRepositoryImp>()),
          child: const HomePage(),
        ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
