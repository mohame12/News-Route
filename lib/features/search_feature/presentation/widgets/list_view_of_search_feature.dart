
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/features/search_feature/presentation/manager/search_cubit.dart';

import '../../../../core/themes/my_styles.dart';


class ListViewOfSearchFeature extends StatelessWidget {
  const ListViewOfSearchFeature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    var cubit =BlocProvider.of<SearchCubit>(context);
    if(state is SearchSuccess)
    {
      return Padding(
        padding: EdgeInsetsDirectional.only(top: 30.h),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount:state.abstract.length,
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
                    child: Text(
                      '${state.abstract[index].title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: MyStyles.font14GreyLightWeight500Poppins,),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 40.w),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(state.abstract[index].publishedAt??"00:00",
                          style: MyStyles.font13GreyLighterWeight400Inter,)),
                  )
                ],
              ),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 20.h,)
          ,),
      );
    }
    else if(state is SearchError)
      {
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Search error',style: MyStyles.font22BlackWeight700Poppins),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.w))
                  ),
                  onPressed: (){
                cubit.getSearchList(q:cubit.search);
              }, child: Text('retry',style: MyStyles.font22WhiteWeight400Exo))
            ],
          ),
        );
      }
    else if (state is SearchLoading) {
      return const Center(child: CircularProgressIndicator(
        color: MyColors.green,
      ));
    }
      return const Center(child: Text('No data'));
  },
);
  }
}