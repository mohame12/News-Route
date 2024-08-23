import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_route1/core/themes/my_colors.dart';
import 'package:news_app_route1/core/themes/my_styles.dart';
import 'package:news_app_route1/core/utile/my_assets.dart';
import 'package:news_app_route1/features/search_feature/data/repositories/search_repo_implement.dart';
import 'package:news_app_route1/features/search_feature/presentation/manager/search_cubit.dart';
import 'package:news_app_route1/features/search_feature/presentation/widgets/list_view_of_search_feature.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String id = 'SearchScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: MyColors.whiteColor),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(MyAssets.scaffoldBackground),
                fit: BoxFit.cover)),
        child: BlocProvider(
          create: (context) => SearchCubit(SearchRepoImpl()),
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              var search=BlocProvider.of<SearchCubit>(context);
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 80,
                  backgroundColor: MyColors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(30),
                          bottomEnd: Radius.circular(30))),
                  title: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                    child: TextFormField(
                      onChanged: (val){
                        search.oNChange(val);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: MyColors.whiteColor,
                        suffixIcon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: MyColors.green,
                        ),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.x,
                          color: MyColors.green,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: MyColors.whiteColor),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: MyColors.whiteColor),
                        ),
                        hintText: 'Search Article',
                        hintStyle: MyStyles.font14GreenWeight400Poppins,
                      ),
                    ),
                  ),
                ),
                body: const ListViewOfSearchFeature(),
              );
            },
          ),
        ),
      ),
    );
  }
}
