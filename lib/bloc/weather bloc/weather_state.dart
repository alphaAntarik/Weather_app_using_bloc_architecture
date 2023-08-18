part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final Searchweathermodel weatherreport;

  WeatherLoaded({required this.weatherreport});
  @override
  List<Object> get props => [weatherreport];
}

final class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);

  @override
  List<Object> get props => [error];
}
