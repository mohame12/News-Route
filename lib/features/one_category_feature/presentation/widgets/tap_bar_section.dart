import 'package:flutter/material.dart';
import 'package:news_app_route1/features/category_features/data/models/nav_model.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/widgets/tap_item.dart';

class TapBarSection extends StatelessWidget {
   const TapBarSection({
    super.key, required this.data,
  });
  final NavigationModel data;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: data.source!.length,
        child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            physics: BouncingScrollPhysics(),
            tabAlignment: TabAlignment.center,
            tabs:data.source!.map((e){
              return TapItem(text: e.name??'');
            }).toList(),
        ));
  }
}