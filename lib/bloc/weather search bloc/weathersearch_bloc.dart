import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/searchweathermodel.dart';
import '../../repo/weatherrepository.dart';

part 'weathersearch_event.dart';
part 'weathersearch_state.dart';

class WeathersearchBloc extends Bloc<WeathersearchEvent, WeathersearchState> {
  final WeatherRepository weatherRepository;
  WeathersearchBloc({required this.weatherRepository}) : super(WeathersearchInitial()) {
    on<FetchDataSearch>((event, emit) async{
      // TODO: implement event handler
      emit(DataLoading());
      try{
        emit(DataLoaded(weatherreport: await weatherRepository.createAlbumSearch(event.searchstring)));
      }catch(e){
        emit(DataError(error: e.toString()));
      }
    });
  }
}
