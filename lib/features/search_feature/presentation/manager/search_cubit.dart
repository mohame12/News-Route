import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_route1/features/search_feature/data/repositories/search_repo.dart';

import '../../../one_category_feature/data/models/NewsListModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;


 Future<List<Articles>?> getSearchList({required String q})
  async {
   var res= await searchRepo.searchLits(q: q);
   res.fold((e){
     print(e.message);
     emit(SearchError(message: e.message));
   }, (articals){
     emit(SearchSuccess(abstract: articals));
   });
   return null;
  }


  String search='';
  oNChange(String val)
  {
    search=val;
    getSearchList(q: search);

  }


}
