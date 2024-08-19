import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/core/themes/my_styles.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 29.h,),
          Image(image: AssetImage(MyAssets.test),width: double.infinity,fit: BoxFit.cover,),
          Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Text('BBC news *',style: MyStyles.font10GreyWeight400Poppins,),
                Text('Why are football`s biggest clubs starting a newtournament?',style: MyStyles.font14GreyLightWeight500Poppins,),
                Align(
                    alignment: Alignment.topRight,
                    child: Text('3 hours ago',style: MyStyles.font13GreyLighterWeight400Inter,)),
                Card(
                  color: MyColors.whiteColor,
                  elevation: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsetsDirectional.only(top: 24.h,start: 11.w,end: 12.w),
                        child: Text('Why are football`s biggest clubs starting a new\ntournament Why are football`s biggest clubs\nstarting a new tournamentWhy are football`s biggest\nclubs starting a new tournamentWhy are football`s\nbiggest clubs starting a new tournamentWhy are\nfootball`s biggest clubs starting a new tournament.\nWhy are football`s biggest clubs starting a new\ntournamentWhy are football`s biggest clubs starting\na new tournamentWhy are football`s biggest clubs\nstarting a new tournamentWhy are football`s biggest\nclubs starting a new tournamentWhy are football`s\nbiggest clubs starting a new tournamentWhy are\nfootball`s biggest clubs starting a new tournament Why\nare football`s biggest clubs starting a new tournament',style: MyStyles.font13GreyLightWeight300Poppins,),
                      ),
                      SizedBox(height: 55.h,),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text('View Full Article',style: MyStyles.font14GreyLightWeight500Poppins,)),
                      SizedBox(height: 36.h,),
                    ],
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}