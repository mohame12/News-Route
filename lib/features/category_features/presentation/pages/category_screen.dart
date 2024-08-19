import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/core/themes/my_styles.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';

import '../widgets/categorys_of_news.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String id='HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.whiteColor,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(MyAssets.scaffoldBackground),fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: MyColors.green,
            title: Text('NewsApp',style: MyStyles.font22WhiteWeight400Exo,),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(bottomStart:Radius.circular(50) ,bottomEnd:Radius.circular(50) )
            ),
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 29),
              child:IconButton(onPressed: () {  }, icon: const Icon(Icons.menu,color: MyColors.whiteColor,)
              ),
            ),
          ),
          body: Padding(
            padding:  EdgeInsetsDirectional.only(top:36.h,start: 35.h,end: 37.h,bottom: 91.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pick your category\nof interest',style: MyStyles.font22BlackWeight700Poppins,),
                  const CategoryOfNews()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

