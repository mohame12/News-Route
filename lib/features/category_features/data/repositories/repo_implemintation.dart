import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_route1/core/networking/dio_helper.dart';
import 'package:news_app_route1/core/networking/failure.dart';
import 'package:news_app_route1/features/category_features/data/models/source_model.dart';
import 'package:news_app_route1/features/category_features/data/repositories/source_repo.dart';


class RepoImplemtation implements SourceRepository
{
  @override
  Future<Either<Failure, List<Sources>>> getSource({required String category}) async {
   try {
     var response = await DioHelper.getData(
         url: 'top-headlines/sources?category=$category&apiKey=d9b26400797f4a56be2cbe5547d6ff12');
     Map<String, dynamic>sources=response.data;
     List<Sources> sourceList = [];

     for(var i in sources['sources'])
       {
         sourceList.add(Sources.fromJson(i));
       }
     return Right(sourceList);
   }catch(e)
    {
      if(e is DioException)
        {
          return Left(Failure.fromDioError(e));
        }
      else
        {
          return left(
            Failure(message: e.toString())
          );
        }
    }
  }
  
}