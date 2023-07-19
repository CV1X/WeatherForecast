import 'package:flutter/material.dart';
import 'package:flutter_1/WeatherForecast/Util/Covert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/WFModel.dart';
import '../Util/WFUtil.dart';

Widget forecastCard(AsyncSnapshot<WFModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;

  var forecastData = forecastList?[index];

  var dayOfWeek = Util.getFormattedDate(
    DateTime.fromMillisecondsSinceEpoch((forecastData?.dt ?? 0) * 1000),
  ).split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          dayOfWeek,
          style: TextStyle(color: Colors.black),
        ),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: getWeatherIcon(
                  weatherDescription:
                      forecastList?[index].weather?[0].main ?? '',
                  color: Colors.pinkAccent,
                  size: 40)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      Text(
                        "${forecastList?[index].main?.tempMin?.toStringAsFixed(0)} °C",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Icon(FontAwesomeIcons.solidArrowAltCircleDown,
                            color: Colors.black, size: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      Text(
                          "${forecastList?[index].main?.tempMax?.toStringAsFixed(0)} °C",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Icon(FontAwesomeIcons.solidArrowAltCircleUp,
                            color: Colors.black, size: 17),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: [
                      Text(
                          "${forecastList?[index].main?.humidity?.toStringAsFixed(0)} %",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: Icon(FontAwesomeIcons.solidGrinBeamSweat,
                            color: Color.fromARGB(255, 238, 178, 157),
                            size: 17),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                        "${forecastList?[index].wind?.speed?.toStringAsFixed(1)} %",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                      ),
                      child: Icon(FontAwesomeIcons.wind,
                          color: Colors.blueAccent, size: 17),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ],
  );
}
