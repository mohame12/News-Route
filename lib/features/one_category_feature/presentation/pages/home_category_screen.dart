import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_styles.dart';
import '../widgets/list_view_of_category_home_screen.dart';
import '../widgets/tap_bar_section.dart';

class HomeCategoryScreen extends StatelessWidget {
  static const String id='HomeCategoryScreen';
  const HomeCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.whiteColor,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(MyAssets.scaffoldBackground))
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
            actions: [

              IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.magnifyingGlass,color: MyColors.whiteColor,)),
              SizedBox(width: 29.w,),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 15.h,),
              const TapBarSection(),
              const ListViewOfCategoryHomeScreen()
            ],
          ),

        ),
      ),
    );
  }
}



