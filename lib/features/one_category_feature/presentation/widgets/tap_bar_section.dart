import 'package:flutter/material.dart';
import 'package:news_app_route1/features/one_category_feature/presentation/widgets/tap_item.dart';

class TapBarSection extends StatelessWidget {
  const TapBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(length: 7,
        child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            physics: BouncingScrollPhysics(),
            tabAlignment: TabAlignment.center,
            tabs: [TapItem(),TapItem(),TapItem(),TapItem(),TapItem(),TapItem(),TapItem()]));
  }
}