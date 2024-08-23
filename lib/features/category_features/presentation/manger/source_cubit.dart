import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_route1/features/category_features/data/models/source_model.dart';
import 'package:news_app_route1/features/category_features/data/repositories/source_repo.dart';

part 'source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit(this.repository) : super(SourceInitial());
  final SourceRepository repository;
  String title="";


  Future<List<Sources>?>getSource({required String category})
  async {
    emit(SourceLoadingSource());
    var result =await repository.getSource(category: category);
    result.fold((e){
      emit(SourceFailureSource(error: e.message));
    }, (source){
      title=category;
      print(category);
      emit(SourceSuccessSource(source: source, title: category));
    });
    return null;
  }




}
