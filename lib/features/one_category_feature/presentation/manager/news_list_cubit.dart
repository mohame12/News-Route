import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_route1/features/one_category_feature/data/models/NewsListModel.dart';
import 'package:news_app_route1/features/one_category_feature/data/repositories/get_news_list_repo.dart';

part 'news_list_state.dart';

class NewsListCubit extends Cubit<NewsListState> {
  NewsListCubit(this.getNewsListRepo) : super(NewsListInitial());
  final GetNewsListRepository getNewsListRepo;
  int selected=0;
  void selectCategory(int index){
    selected=index;
    emit(NewsListCategorySelected(selected: selected));
  }

  Future<void> fetchNewsList({required String sourceId}) async {
    var res=await getNewsListRepo.getNewsList(sourceId: sourceId);
    res.fold((e){
      print(e.toString());
      emit(NewsListError(errorMessage: e.message));
    }, (artical){
      emit(
        NewsListSuccessData(abstract: artical)
      );
    });
}
}
