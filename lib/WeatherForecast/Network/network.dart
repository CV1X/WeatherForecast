import 'dart:convert';

import 'package:flutter_1/WeatherForecast/Model/WFModel.dart';
import 'package:http/http.dart';

import '../Util/WFUtil.dart';

class Network {
  Future<WFModel> getWF({required String cityName}) async {
    var finalUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Util.appId}&units=metric";

    final response =
        await get(Uri.parse(Uri.encodeFull(finalUrl))); // Corrected Uri usage
    print("URL:${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      print("Weather data : ${response.body}");
      return WFModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Something went wrong");
    }
  }
}
