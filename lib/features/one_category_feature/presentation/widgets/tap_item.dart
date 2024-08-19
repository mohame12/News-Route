import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';

class TapItem extends StatelessWidget {
  const TapItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95.w,
      height: 34.h,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2,color: MyColors.green,)
      ),
      child: Center(child: Text('BBC news',style: MyStyles.font14GreenWeight400Exo,)),
    );
  }
}
