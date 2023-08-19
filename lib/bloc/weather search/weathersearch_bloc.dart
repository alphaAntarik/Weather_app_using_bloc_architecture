import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_using_bloc_architecture/models/searchweathermodel.dart';
import 'package:weather_app_using_bloc_architecture/repo/weatherrepository.dart';

part 'weathersearch_event.dart';
part 'weathersearch_state.dart';

class WeathersearchBloc extends Bloc<WeathersearchEvent, WeathersearchState> {
  final WeatherRepository weatherRepository;
  WeathersearchBloc({required this.weatherRepository})
      : super(WeathersearchInitial()) {
    on<FetchDataSearch>((event, emit) async {
      // TODO: implement event handler
      emit(DataLoading());
      try {
        // final weather = await weatherRepository.createAlbumSearch(cityname);
        emit(DataLoaded(
            weatherreport:
                await weatherRepository.createAlbumSearch(event.searchstring)));
      } catch (e) {
        emit(DataError(error: e.toString()));
      }
    });
  }
}
