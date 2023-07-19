import 'package:flutter/material.dart';
import 'package:flutter_1/WeatherForecast/Model/WFModel.dart';
import 'Network/network.dart';
import 'Ui/midView.dart';
import 'Util/BottomView.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WFModel> forecastObject;
  String _cityName = "Oradea";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WFModel>(
              builder: (BuildContext context, AsyncSnapshot<WFModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      midView(snapshot),
                      bottomView(snapshot, context),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
              future: forecastObject,
            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
          child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            forecastObject = getWeather(cityName: _cityName);
          });
        },
      )),
    );
  }

  Future<WFModel> getWeather({required String cityName}) =>
      new Network().getWF(cityName: _cityName);
}
