part of 'source_cubit.dart';

@immutable
sealed class SourceState {}

final class SourceInitial extends SourceState {}
final class SourceLoadingSource extends SourceState {}
final class SourceSuccessSource extends SourceState {
  final List<Sources> source;
  final String title;

   SourceSuccessSource({required this.title,required this.source });
}
final class SourceFailureSource extends SourceState {
  final String error;

   SourceFailureSource({required this.error });
}

final class SourceChangeTitle extends SourceState {}
