import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app_using_bloc_architecture/screens/searchresult.dart';

import '../bloc/weather search bloc/weathersearch_bloc.dart';



class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});
  static String searchwidget = '/searchwidget';

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
        child: TextField(
          controller: searchController,
          onEditingComplete: () {
            if (searchController.text.isNotEmpty) {
              BlocProvider.of<WeathersearchBloc>(context)
                  .add(FetchDataSearch(searchstring: searchController.text));

              // WeatherBloc(
              //     weatherRepository: WeatherRepository(),
              //     cityname: searchController.text);
    Navigator.of(context).pushNamed(
    SearchResult.searchresultroute);

              // searchController.clear();
              // FocusScope.of(context).unfocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          cursorColor: Colors.black,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintMaxLines: 1,
            hintText: "Search any city",
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            suffixIconColor: Colors.grey,
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Container(
              margin: const EdgeInsets.all(6),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.search_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
