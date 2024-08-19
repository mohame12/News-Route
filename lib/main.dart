import 'package:flutter/material.dart';
import 'package:news_app_route1/core/routing/routes.dart';
import 'package:news_app_route1/features/splash_screen/presentation/pages/splash_screen.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.id ,
      routes: Routes.routes,

    );
  }
}
