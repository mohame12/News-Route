import 'package:dartz/dartz.dart';
import 'package:news_app_route1/core/networking/failure.dart';
import 'package:news_app_route1/features/one_category_feature/data/models/NewsListModel.dart';

abstract class GetNewsListRepository{
 Future<Either<Failure,List<Articles>>> getNewsList({required String sourceId});
}