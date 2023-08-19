part of 'weathersearch_bloc.dart';

sealed class WeathersearchState extends Equatable {
  const WeathersearchState();

  @override
  List<Object> get props => [];
}

final class WeathersearchInitial extends WeathersearchState {}

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
