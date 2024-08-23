import 'package:flutter/material.dart';
import 'package:news_app_route1/features/category_features/presentation/pages/category_screen.dart';
import 'package:news_app_route1/features/details_Features/presentation/pages/details_features.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/pages/home_category_screen.dart';
import 'package:news_app_route1/features/search_feature/presentation/pages/search_screen.dart';
import 'package:news_app_route1/features/splash_screen/presentation/pages/splash_screen.dart';

class Routes
{
  static Map<String, WidgetBuilder>  routes = {
    SplashScreen.id:(context)=>const SplashScreen(),
    CategoryScreen.id:(context)=>const CategoryScreen(),
    HomeCategoryScreen.id:(context)=> const HomeCategoryScreen(),
    DetailsScreen.id:(context)=>const DetailsScreen(),
    SearchScreen.id:(context)=>const SearchScreen(),


      };
}