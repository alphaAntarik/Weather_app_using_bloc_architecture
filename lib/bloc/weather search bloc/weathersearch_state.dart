part of 'weathersearch_bloc.dart';

@immutable
abstract class WeathersearchState {}

class WeathersearchInitial extends WeathersearchState {}


final class DataLoading extends WeathersearchState {}

final class DataLoaded extends WeathersearchState {
  final Searchweathermodel weatherreport;

  DataLoaded({required this.weatherreport});
  @override
  List<Object> get props => [weatherreport];
}

final class DataError extends WeathersearchState {
  final String error;

  DataError({required this.error});
  @override
  List<Object> get props => [error];
}

