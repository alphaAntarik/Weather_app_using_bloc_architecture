import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/weather search/weathersearch_bloc.dart';
import '../widgets/astro.dart';
import '../widgets/cityname.dart';

class SearchResult extends StatelessWidget {
  static String searchresultroute = '/searchresultroute';
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeathersearchBloc, WeathersearchState>(
      builder: (context, state) {
        if (state is DataLoaded) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              // backgroundColor: state.weatherreport.forecast!.forecastday![0]
              //             .hour![0].isDay ==
              //         1
              //     ? Color(0xFFD8F2FF)
              //     : Color(0xFF3F3F3F),
              body: Padding(
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Text(
                            //   "Weatherly",
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .displayLarge!
                            //       .copyWith(
                            //           fontSize:
                            //               MediaQuery.of(context).size.height *
                            //                   0.05,
                            //           fontWeight: FontWeight.bold),
                            // ),
                            Row(
                              children: [
                                Text(
                                  "Time in ${state.weatherreport.location!.name} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        //  fontWeight: FontWeight.bold
                                      ),
                                ),
                                Text(
                                  "${state.weatherreport.location!.localtime!.replaceAll("${state.weatherreport.location!.localtime}", "${state.weatherreport.location!.localtime}".substring(11))}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
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
                        //     Text("${state.weatherreport.location!.country}"),
                        //     SizedBox(
                        //       width: MediaQuery.of(context).size.height * 0.7,
                        //     ),
                        //   ],
                        // ),
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
                            height: MediaQuery.of(context).size.height * 0.6,
                            //width: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Astro(
                                    image:
                                        "https://img.icons8.com/?size=512&id=8EUmYhfLPTCF&format=png",
                                    time:
                                        '${state.weatherreport.forecast!.forecastday![0].astro!.sunrise}',
                                    isday: state.weatherreport.current!.isDay),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Astro(
                                    image:
                                        "https://img.icons8.com/?size=512&id=atmlqapzedh5&format=png",
                                    time:
                                        '${state.weatherreport.forecast!.forecastday![0].astro!.sunset}',
                                    isday: state.weatherreport.current!.isDay),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Astro(
                                    image:
                                        "https://img.icons8.com/?size=512&id=fxdxLCkl9ka7&format=png",
                                    time:
                                        '${state.weatherreport.forecast!.forecastday![0].astro!.moonrise}',
                                    isday: state.weatherreport.current!.isDay),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Astro(
                                    image:
                                        "https://img.icons8.com/?size=512&id=chZV3rpyOiBh&format=png",
                                    time:
                                        '${state.weatherreport.forecast!.forecastday![0].astro!.moonset}',
                                    isday: state.weatherreport.current!.isDay),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
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
                                                                .forecastday![0]
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
                                    isday: state.weatherreport.current!.isDay),
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
                                color:
                                    // state.weatherreport.forecast!
                                    //             .forecastday![0].hour![0].isDay ==
                                    //         1
                                    //     ?
                                    Color(0xFF3F3F3F)
                                //  : Colors.white
                                ,
                                textStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.1,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "${state.weatherreport.current!.condition!.text}",
                              style: GoogleFonts.alegreyaSans(
                                color:
                                    // state.weatherreport.forecast!
                                    //             .forecastday![0].hour![0].isDay ==
                                    //         1
                                    //     ?
                                    Color(0xFF3F3F3F)
                                //: Colors.white
                                ,
                                textStyle: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
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
                            "${state.weatherreport.forecast!.forecastday![0].day!.maxtempC}°C /${state.weatherreport.forecast!.forecastday![0].day!.mintempC}°C",
                            style: TextStyle(
                              color:
                                  // state.weatherreport.forecast!
                                  //             .forecastday![0].hour![0].isDay ==
                                  //         1
                                  //     ?
                                  Color(0xFF3F3F3F)
                              //     :
                              // Colors.white
                              ,
                            ),
                          ),
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
              ));
        }
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
