part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends WeatherEvent {}

//class RefreshEvent extends WeatherEvent {}
