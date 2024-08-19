import 'package:flutter/material.dart';
import 'package:news_app_route1/features/category_features/presentation/pages/category_screen.dart';
import 'package:news_app_route1/features/splash_screen/presentation/pages/splash_screen.dart';

class Routes
{
  static Map<String, WidgetBuilder>  routes = {
    SplashScreen.id:(context)=>const SplashScreen(),
    CategoryScreen.id:(context)=>const CategoryScreen(),

      };
}