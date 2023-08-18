import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/searchweathermodel.dart';
import '../../repo/weatherrepository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  final String cityname;
  //WeatherBloc({required this.weatherRepository}) : super(WeatherLoading());

  WeatherBloc({required this.weatherRepository, required this.cityname})
      : super(WeatherLoading()) {
    on<FetchDataEvent>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await weatherRepository.createAlbum(cityname);
        emit(WeatherLoaded(weatherreport: weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
    // on<RefreshEvent>((event, emit) async {
    //   await Future.delayed(const Duration(seconds: 2));
    //   emit(WeatherLoading());
    //   try {
    //     final weather = await weatherRepository.createAlbum();
    //     emit(WeatherLoaded(weatherreport: weather));
    //   } catch (e) {
    //     emit(WeatherError(e.toString()));
    //   }
    // });
  }
}
