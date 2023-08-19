import 'package:weather_app_using_bloc_architecture/repo/locationrespiratory.dart';
import 'package:weather_app_using_bloc_architecture/screens/searchresult.dart';

import '/repo/weatherrepository.dart';
import '/widgets/searchwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/location bloc/location_bloc.dart';
import 'bloc/weather bloc/weather_bloc.dart';

import 'bloc/weather search bloc/weathersearch_bloc.dart';
import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(
              weatherRepository: WeatherRepository(), cityname: "london"),
        ),
        BlocProvider(
          create: (context) =>
              LocationBloc(locationrespiratory: LocationRespiratory()),
        ),
        BlocProvider(
            create: (context) =>
                WeathersearchBloc(weatherRepository: WeatherRepository()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.anekGujaratiTextTheme().copyWith(
              displayMedium: GoogleFonts.aBeeZee().copyWith(
                  color:
                      //  DateTime.now().hour > 5 && DateTime.now().hour < 17
                      //     ?
                      Color(0xFF3F3F3F)
                  //     :
                  //  Colors.white
                  ),
              displayLarge: GoogleFonts.anekGujarati().copyWith(
                  color:
                      // DateTime.now().hour > 5 && DateTime.now().hour < 17
                      //     ?
                      Color(0xFF3F3F3F)
                  //  :
                  // Colors.white
                  )),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ).copyWith(
              background:
                  //  DateTime.now().hour > 5 && DateTime.now().hour < 17
                  //     ?
                  Color(0xFFD8F2FF)
              // :
              //  Color(0xFF3F3F3F)
              ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          SearchWidget.searchwidget: (context) => const SearchWidget(),
          SearchResult.searchresultroute: (context) => const SearchResult(),
        },
      ),
    );
  }
}
