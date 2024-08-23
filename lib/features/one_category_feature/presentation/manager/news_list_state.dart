part of 'news_list_cubit.dart';

@immutable
sealed class NewsListState {}

final class NewsListInitial extends NewsListState {}
final class NewsListCategorySelected extends NewsListState {
  final int selected;

  NewsListCategorySelected({required this.selected});

}


final class NewsListLoading extends NewsListState {}

final class NewsListError extends NewsListState {
  final String errorMessage;

  NewsListError({required this.errorMessage});
}

final class NewsListSuccessData extends NewsListState {
  final List<Articles>abstract ;

  NewsListSuccessData({required this.abstract});

}
