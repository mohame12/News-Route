import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_route1/features/category_features/data/models/nav_model.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/manager/news_list_cubit.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/widgets/tap_item.dart';

class TapBarSection extends StatelessWidget {
  const TapBarSection({
    super.key, required this.data,
  });

  final NavigationModel data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListCubit,NewsListState>(
      builder: (context, state) {
        return DefaultTabController(length: data.source!.length,
            child: TabBar(
              isScrollable: true,
              onTap: (ind) {
                 BlocProvider.of<NewsListCubit>(context).selectCategory(ind);
              },
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              physics: const BouncingScrollPhysics(),
              tabAlignment: TabAlignment.center,
              tabs: data.source!.map((e) {
                return TapItem(text: e.name ?? '',
                  isSelected:BlocProvider.of<NewsListCubit>(context).selected == data.source?.indexOf(e),);
              }).toList(),
            ));
      },
    );
  }
}

