import 'package:flutter/material.dart';

import '../Model/WFModel.dart';
import '../Ui/ForecastCard.dart';

Widget bottomView(AsyncSnapshot<WFModel> snapshot, BuildContext context) {
  //var forecastList = snapshot.data?.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("7-Day Weather forecast".toUpperCase(),
          style: TextStyle(fontSize: 15, color: Colors.grey)),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: ((context, index) => SizedBox(
                width: 8,
              )),
          itemCount: 20,
          itemBuilder: ((context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff9661C3), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight)),
              ))),
        ),
      )
    ],
  );
}
