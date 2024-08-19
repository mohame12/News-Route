
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_styles.dart';
import '../../../../core/utile/my_assets.dart';

class ListViewOfCategoryHomeScreen extends StatelessWidget {
  const ListViewOfCategoryHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 30.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) =>
              Column(
                children: [
                  Image(image: AssetImage(MyAssets.test)),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 30.w),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('BBC news *',style: MyStyles.font10GreyWeight400Poppins,)),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(start: 30.w),
                    child: Text('Why are football`s biggest clubs starting a new tournament?',maxLines: 2,overflow: TextOverflow.ellipsis,style: MyStyles.font14GreyLightWeight500Poppins,),
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(end: 40.w),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text('3 hours ago',style: MyStyles.font13GreyLighterWeight400Inter,)),
                  )
                ],
              ), separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 20.h,)
          ,),
      ),
    );
  }
}