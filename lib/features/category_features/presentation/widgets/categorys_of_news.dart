import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';
import 'package:news_app_route1/features/category_features/data/models/nav_model.dart';
import 'package:news_app_route1/features/category_features/data/repositories/repo_implemintation.dart';
import 'package:news_app_route1/features/category_features/presentation/manger/source_cubit.dart';
import 'package:news_app_route1/features/category_features/presentation/widgets/right_containers_of_categoorys.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/pages/home_category_screen.dart';

import 'left_container_of_category.dart';

class CategoryOfNews extends StatelessWidget {
  const CategoryOfNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourceCubit(RepoImplemtation()),
      child: BlocConsumer<SourceCubit, SourceState>(
        listener: (context, state) {
          if (state is SourceSuccessSource) {
            Navigator.pushNamed(context, HomeCategoryScreen.id,
                arguments:
                    NavigationModel(source: state.source, title: state.title));
          }
        },
        builder: (context, state) {
          SourceCubit source = BlocProvider.of<SourceCubit>(context);
          return Padding(
            padding: EdgeInsetsDirectional.only(start: 19.w, top: 29.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 25.w),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          source.getSource(category: 'sports');
                        },
                        child: const LeftContainersOfCategoorys(
                          color: MyColors.red,
                          image: MyAssets.sportLogo,
                          text: 'Sports',
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          source.getSource(category: 'health');
                        },
                        child: const LeftContainersOfCategoorys(
                          color: MyColors.pink,
                          image: MyAssets.healthLogo,
                          text: 'Health',
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          source.getSource(category: 'entertainment');
                        },
                        child: const LeftContainersOfCategoorys(
                            color: MyColors.blue,
                            image: MyAssets.enviromentLogo,
                            text: 'Entertain'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          source.getSource(category: 'technology');
                        },
                        child: const RightContainersOfCategoorys(
                            color: MyColors.blueLight,
                            image: MyAssets.politicsLogo,
                            text: 'Technology'),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          source.getSource(category: 'business');
                        },
                        child: const RightContainersOfCategoorys(
                            color: MyColors.orangeLight,
                            image: MyAssets.busnessLogo,
                            text: 'Business '),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          source.getSource(category: 'science');
                        },
                        child: const RightContainersOfCategoorys(
                            color: MyColors.yelloLight,
                            image: MyAssets.scienceLogo,
                            text: 'Science'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
