import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/searchweathermodel.dart';

class WeatherRepository {
  Future<Searchweathermodel> createAlbum(String cityname) async {
    final http.Response response = await http.get(
        Uri.parse(
            'https://weatherapi-com.p.rapidapi.com/forecast.json?q=$cityname&days=3'),
        headers: {
          "X-RapidAPI-Key":
              "c0c533132cmsh9902808cfe93801p172f22jsn1fd21f57c77f",
          "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com"
        });

    if (response.statusCode == 200) {
      //final List result = jsonDecode(response.body);
      //return result.map((e) => Weathermodel.fromJson(e)).toList();
      // final List<dynamic> jsonData = jsonDecode(response.body);
      // return jsonData.map((json) => Weathermodel.fromJson(json));
      return Searchweathermodel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
