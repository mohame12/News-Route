import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/networking/dio_helper.dart';
import 'package:news_app_route1/core/routing/routes.dart';
import 'package:news_app_route1/features/splash_screen/presentation/pages/splash_screen.dart';

import 'bloc_observer.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:SplashScreen.id ,
        routes: Routes.routes,

      ),
    );
  }
}
