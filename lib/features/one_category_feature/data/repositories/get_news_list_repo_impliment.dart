import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_route1/core/networking/dio_helper.dart';

import 'package:news_app_route1/core/networking/failure.dart';

import 'package:news_app_route1/features/one_category_feature/data/models/NewsListModel.dart';

import 'get_news_list_repo.dart';

class GetNewsListRepositoryImpliment implements GetNewsListRepository
{
  @override
  Future<Either<Failure, List<Articles>>> getNewsList({required String sourceId}) async {
  try {
    Response response = await DioHelper.getData(
        url: 'everything?sources=$sourceId&apiKey=d9b26400797f4a56be2cbe5547d6ff12');
    Map<String, dynamic> map = response.data;
    List<Articles> articaledList = [];
    for (var art in map['articles']) {
      articaledList.add(Articles.fromJson(art));
    }
    print(articaledList);
    return Right(articaledList);
  }catch(e)
    {
      if(e is DioException)
        {
          return Left(Failure.fromDioError(e));
        }
      else
        {
          return left(Failure(message: e.toString()));
        }
    }
    
  }

}