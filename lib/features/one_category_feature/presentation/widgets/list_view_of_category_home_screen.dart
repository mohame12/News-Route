
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/features/one_category_feature/data/repositories/get_news_list_repo_impliment.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/manager/news_list_cubit.dart';

import '../../../../core/themes/my_styles.dart';

class ListViewOfCategoryHomeScreen extends StatelessWidget {
  const ListViewOfCategoryHomeScreen({
    super.key, required this.sourceId,
  });
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit,NewsListState>(
      bloc: NewsListCubit(GetNewsListRepositoryImpliment())..fetchNewsList(sourceId: sourceId),
    builder: (context, state) {
        if(state is NewsListSuccessData) {
          return Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 30.h),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.abstract.length,
                itemBuilder: (context, index) =>
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child:CachedNetworkImage(
                            height: 232.h,
                            width: 360.w,
                            fit: BoxFit.cover,
                            imageUrl:"${state.abstract[index].urlToImage}",
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(
                                    color: MyColors.green,
                                    value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 30.w),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('${state.abstract[index].source?.name??"Unknown"} *',
                                style: MyStyles.font10GreyWeight400Poppins,)),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 30.w,end: 30.w),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              state.abstract[index].title??"Unknown",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: MyStyles.font14GreyLightWeight500Poppins,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 40.w),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text(state.abstract[index].publishedAt??"00:00", style: MyStyles
                                  .font13GreyLighterWeight400Inter,)),
                        )
                      ],
                    ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 20.h,)
                ,),
            ),
          );
        }
        else if(state is NewsListError) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Failed to fetch news', style: MyStyles.font22BlackWeight700Poppins),
                SizedBox(height: 20.h,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
                    elevation: 1,
                  ),
                  onPressed: () {
                    BlocProvider.of<NewsListCubit>(context).fetchNewsList(sourceId: sourceId);
                  }, child: Text('TryAgain',style: MyStyles.font22WhiteWeight400Exo,),)
              ],
            ),
          );
        }
        else {
          return  Expanded(
            child: Center(
              child: CircularProgressIndicator(
                color: MyColors.green,
              ),
            ),
          );
        }
    },
    );
  }
}