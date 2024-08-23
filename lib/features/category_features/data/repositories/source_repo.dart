
  import 'package:dartz/dartz.dart';
  import 'package:news_app_route1/core/networking/failure.dart';
  import 'package:news_app_route1/features/category_features/data/models/source_model.dart';

  abstract  class SourceRepository{
    Future<Either<Failure,List<Sources>>> getSource({required String category});
  }