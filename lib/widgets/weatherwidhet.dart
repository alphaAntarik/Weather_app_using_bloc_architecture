import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app_using_bloc_architecture/repo/locationrespiratory.dart';
import 'package:weather_app_using_bloc_architecture/widgets/searchwidget.dart';

import '../bloc/location bloc/location_bloc.dart';
import '../bloc/weather bloc/weather_bloc.dart';

import '../repo/weatherrepository.dart';
import 'astro.dart';
import 'cityname.dart';

class weatherwidget extends StatelessWidget {
  const weatherwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LocationBloc(locationrespiratory: LocationRespiratory())
            ..add(GetLocationEvent()),
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: ((context, state) {
          if (state is LocationLoaded) {
            return BlocProvider(
              create: (context) => WeatherBloc(
                  weatherRepository: WeatherRepository(), cityname: "london")
                ..add(FetchDataEvent()),
              child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: ((context, state) {
                if (state is WeatherLoaded) {
                  return
                      // RefreshIndicator(
                      //   onRefresh: () async {
                      //     context.read<WeatherBloc>().add(RefreshEvent());
                      //   },
                      //   child:
                      Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height * 0.05,
                        right: MediaQuery.of(context).size.height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Weatherly",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed(
                                              SearchWidget.searchwidget);
                                        },
                                        icon: Icon(
                                          Icons.search_outlined,
                                          color: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .color,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                        )),
                                    Text(
                                      "${state.weatherreport.location!.localtime!.replaceAll("${state.weatherreport.location!.localtime}", "${state.weatherreport.location!.localtime}".substring(11))}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            // Text(
                            //     "${state.weatherreport.location!.country}"),
                            // SizedBox(
                            //   width:
                            //       MediaQuery.of(context).size.height * 0.7,
                            // ),
                            //  ],
                            //),
                          ],
                        ),
                        // Stack(
                        //   children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        // Text(
                        //     "${state.weatherreport.current!.condition!.text}"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            // clipBehavior: Clip.antiAliasWithSaveLayer,
                            children: [
                              Center(
                                child: CityName(
                                  name: "${state.weatherreport.location!.name}",
                                  image:
                                      "${state.weatherreport.current!.condition!.icon}",
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                //width: MediaQuery.of(context).size.height * 0.2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Astro(
                                        image:
                                            "https://img.icons8.com/?size=512&id=8EUmYhfLPTCF&format=png",
                                        time:
                                            '${state.weatherreport.forecast!.forecastday![0].astro!.sunrise}',
                                        isday:
                                            state.weatherreport.current!.isDay),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Astro(
                                        image:
                                            "https://img.icons8.com/?size=512&id=atmlqapzedh5&format=png",
                                        time:
                                            '${state.weatherreport.forecast!.forecastday![0].astro!.sunset}',
                                        isday:
                                            state.weatherreport.current!.isDay),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Astro(
                                        image:
                                            "https://img.icons8.com/?size=512&id=fxdxLCkl9ka7&format=png",
                                        time:
                                            '${state.weatherreport.forecast!.forecastday![0].astro!.moonrise}',
                                        isday:
                                            state.weatherreport.current!.isDay),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Astro(
                                        image:
                                            "https://img.icons8.com/?size=512&id=chZV3rpyOiBh&format=png",
                                        time:
                                            '${state.weatherreport.forecast!.forecastday![0].astro!.moonset}',
                                        isday:
                                            state.weatherreport.current!.isDay),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Astro(
                                        image: state
                                                    .weatherreport
                                                    .forecast!
                                                    .forecastday![0]
                                                    .astro!
                                                    .moonPhase ==
                                                "new"
                                            ? "https://img.icons8.com/?size=512&id=Wdnu-edbShJS&format=png"
                                            : state
                                                        .weatherreport
                                                        .forecast!
                                                        .forecastday![0]
                                                        .astro!
                                                        .moonPhase ==
                                                    "waxing crescent"
                                                ? "https://img.icons8.com/?size=512&id=CHn0rtZuD2M0&format=png"
                                                : state
                                                            .weatherreport
                                                            .forecast!
                                                            .forecastday![0]
                                                            .astro!
                                                            .moonPhase ==
                                                        "first quarter"
                                                    ? "https://img.icons8.com/?size=512&id=KIPHVfQWWl4R&format=png"
                                                    : state
                                                                .weatherreport
                                                                .forecast!
                                                                .forecastday![0]
                                                                .astro!
                                                                .moonPhase ==
                                                            "waxing gibbous"
                                                        ? "https://img.icons8.com/?size=512&id=SnlxFjy7u-4t&format=png"
                                                        : state
                                                                    .weatherreport
                                                                    .forecast!
                                                                    .forecastday![
                                                                        0]
                                                                    .astro!
                                                                    .moonPhase ==
                                                                "full"
                                                            ? "https://img.icons8.com/?size=512&id=F8cuVFEGG4cI&format=png"
                                                            : state
                                                                        .weatherreport
                                                                        .forecast!
                                                                        .forecastday![
                                                                            0]
                                                                        .astro!
                                                                        .moonPhase ==
                                                                    "waning gibbous"
                                                                ? "https://img.icons8.com/?size=512&id=RLniTqU8gD1y&format=png"
                                                                : state
                                                                            .weatherreport
                                                                            .forecast!
                                                                            .forecastday![
                                                                                0]
                                                                            .astro!
                                                                            .moonPhase ==
                                                                        "third quarter"
                                                                    ? "https://img.icons8.com/?size=512&id=KIPHVfQWWl4R&format=png"
                                                                    : "https://img.icons8.com/?size=512&id=JGGPnA5MB09j&format=png",
                                        time: "Moonphase",
                                        isday:
                                            state.weatherreport.current!.isDay),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Stack(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${state.weatherreport.current!.tempC}°C",
                                  style: GoogleFonts.balooTammudu2(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  "${state.weatherreport.current!.condition!.text}",
                                  style: GoogleFonts.alegreyaSans(
                                    color: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .color,
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      //fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Text(
                                  "${state.weatherreport.forecast!.forecastday![0].day!.maxtempC}°C /${state.weatherreport.forecast!.forecastday![0].day!.mintempC}°C"),
                            )
                          ],
                        ),

                        //   ],
                        // ),
                        //   ],
                        // ),
                      ],
                    ),
                    // ),
                  );
                }
                if (state is WeatherError) {
                  return Text("${state.error}");
                }
                if (state is WeatherLoading) {
                  return CircularProgressIndicator();
                }
                return CircularProgressIndicator();
              })),
            );
          }
          return CircularProgressIndicator();
        }),
      ),
    );
  }
}
