import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_route1/core/networking/dio_helper.dart';
import 'package:news_app_route1/core/networking/failure.dart';
import 'package:news_app_route1/features/one_category_feature/data/models/NewsListModel.dart';
import 'package:news_app_route1/features/search_feature/data/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo{
  @override
  Future<Either<Failure, List<Articles>>> searchLits({required String q}) async {
   try {
     Response response = await DioHelper.getData(
         url: 'everything?q=$q&apiKey=d9b26400797f4a56be2cbe5547d6ff12');
     Map<String, dynamic> map = response.data;
     List<Articles> articles = [];
     for (var art in map['articles']) {
       articles.add(Articles.fromJson(art));
     }
     print(articles);
     return right(articles);
   }catch(e)
    {
      if(e is DioException)
        {
          return Left(Failure.fromDioError(e));
        }else
          {
            return Left(Failure(message: e.toString()));
          }
    }
  }

}