part of 'weathersearch_bloc.dart';

sealed class WeathersearchEvent extends Equatable {
  const WeathersearchEvent();

  @override
  List<Object> get props => [];
}

class FetchDataSearch extends WeathersearchEvent {
  final String searchstring;

  FetchDataSearch({required this.searchstring});
  @override
  List<Object> get props => [searchstring];
}
