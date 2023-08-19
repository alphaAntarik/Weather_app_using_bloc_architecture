part of 'weathersearch_bloc.dart';

@immutable
abstract class WeathersearchEvent {}

class FetchDataSearch extends WeathersearchEvent {
  final String searchstring;

  FetchDataSearch({required this.searchstring});
  @override
  List<Object> get props => [searchstring];
}

