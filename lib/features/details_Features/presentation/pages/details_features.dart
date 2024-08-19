import 'package:flutter/material.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/core/themes/my_styles.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';

import '../widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String id='DetailsScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.whiteColor
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(MyAssets.scaffoldBackground))
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: MyColors.green,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(bottomEnd:Radius.circular(30) ,bottomStart: Radius.circular(30))
            ),
            title: Text('NewsTitle',style: MyStyles.font22WhiteWeight400Exo,),
              centerTitle: true,

          ),
          body: const DetailsBody(),
        ),
      ),
    );
  }
}


