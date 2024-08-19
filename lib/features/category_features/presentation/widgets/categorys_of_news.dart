import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';
import 'package:news_app_route1/features/category_features/presentation/widgets/right_containers_of_categoorys.dart';

import 'left_container_of_category.dart';

class CategoryOfNews extends StatelessWidget {
  const CategoryOfNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 19.w,top: 29.h),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsetsDirectional.only(end: 25.w),
            child: Column(
              children: [
                const LeftContainersOfCategoorys(color: MyColors.red, image: MyAssets.sportLogo, text: 'Sports',),
                SizedBox(height: 20.h,),
                const LeftContainersOfCategoorys(color: MyColors.pink, image: MyAssets.healthLogo,text: 'Health',),
                SizedBox(height: 20.h,),
                const LeftContainersOfCategoorys(color: MyColors.blue, image: MyAssets.enviromentLogo,text:'Enviroment'),

              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const RightContainersOfCategoorys(color: MyColors.blueLight, image: MyAssets.politicsLogo, text: 'Politics'),
                SizedBox(height: 20.h,),
                const RightContainersOfCategoorys(color: MyColors.orangeLight, image: MyAssets.busnessLogo, text: 'Business '),
                SizedBox(height: 20.h,),
                const RightContainersOfCategoorys(color: MyColors.yelloLight, image: MyAssets.scienceLogo, text: 'Science'),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


