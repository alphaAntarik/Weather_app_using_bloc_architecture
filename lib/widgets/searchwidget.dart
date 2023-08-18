import 'package:flutter/material.dart';
import 'package:weather_app_using_bloc_architecture/bloc/weather%20bloc/weather_bloc.dart';
import 'package:weather_app_using_bloc_architecture/repo/weatherrepository.dart';

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
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(bottom: 8, right: 5, left: 5),
        child: TextField(
          controller: searchController,
          onEditingComplete: () {
            if (searchController.text.isNotEmpty) {
              // WeatherBloc(
              //     weatherRepository: WeatherRepository(),
              //     cityname: searchController.text);
              // Navigator.pushNamed(
              //   context,
              //   '/',
              //   arguments: searchController.text,
              // )
              ;
              searchController.clear();
              FocusScope.of(context).unfocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          cursorColor: Colors.black,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintMaxLines: 1,
            hintText: "Search any city",
            hintStyle: TextStyle(
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
              margin: EdgeInsets.all(6),
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
