import 'package:flutter/material.dart';
import 'package:flutter_1/WeatherForecast/Util/Covert.dart';
import 'package:flutter_1/WeatherForecast/Util/WFUtil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/WFModel.dart';

Widget midView(AsyncSnapshot<WFModel> snapshot) {
  var forecastList = snapshot.data?.list;

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${snapshot.data?.city?.name}, ${snapshot.data?.city?.country}",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10),
            child: Text(
              "${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch((forecastList?[0].dt ?? 0) * 1000))}",
              style: TextStyle(fontSize: 15, letterSpacing: 1),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(
                weatherDescription: forecastList?[0].weather?[0].main ?? '',
                color: Colors.pinkAccent,
                size: 185),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${forecastList?[0].main?.temp?.toStringAsFixed(0)} °C ",
                  style: TextStyle(fontSize: 34),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: Text(
                      "${forecastList?[0].weather?[0].description?.toUpperCase()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "${forecastList?[0].wind?.speed?.toStringAsFixed(1)} mi/hr"),
                      Icon(FontAwesomeIcons.wind,
                          size: 20, color: Color.fromARGB(255, 66, 125, 236))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                        "${forecastList?[0].main?.humidity?.toStringAsFixed(0)} %"),
                    const Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 20,
                      color: Color.fromARGB(255, 238, 178, 157),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "${forecastList?[0].main?.tempMax?.toStringAsFixed(0)} °C"),
                    const Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 20,
                      color: Color.fromARGB(255, 250, 101, 64),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );

  return midView;
}
