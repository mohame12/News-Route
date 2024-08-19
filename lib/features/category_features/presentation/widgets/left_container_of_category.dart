import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/my_styles.dart';

class LeftContainersOfCategoorys extends StatelessWidget {
  const LeftContainersOfCategoorys({
    super.key, required this.color, required this.image, required this.text,
  });
  final Color color;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 171.h,
      width: 148.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadiusDirectional.only(
          bottomStart:Radius.circular(25) ,
          topStart:Radius.circular(25) ,
          topEnd: Radius.circular(25),
          bottomEnd: Radius.circular(0),
        ),
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(image)),
          Text(text,style: MyStyles.font22WhiteWeight400Exo,)
        ],
      ),
    );
  }
}
