part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends WeatherEvent {
  final WeatherRepository weatherRepository;
  final String lat;
  final String long;

  FetchDataEvent({required this.weatherRepository, required this.lat, required this.long});
  @override
  List<Object> get props => [weatherRepository,lat,long];
}

//class RefreshEvent extends WeatherEvent {}
