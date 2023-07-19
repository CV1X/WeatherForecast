import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  const JsonParsingSimple({super.key});

  @override
  State<JsonParsingSimple> createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  late Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Json"),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return createListView(snapshot.data, context);
                    }
                  }))),
    );
  }

  Future getData() async {
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);

    data = await network.fetchData(); // Wait for the data to be fetched

    return data;
  }
}

Widget createListView(data, BuildContext context) {
  return Container(
    child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(height: 10),
              ListTile(
                title: Text("${data[index]['title']}"),
                subtitle: Text("${data[index]['body']}"),
                leading: Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 23,
                        child: Text("${data[index]['id']}"))
                  ],
                ),
              )
            ],
          );
        }),
  );
}

class Network {
  Network(this.url);

  final String url;

  Future fetchData() async {
    print("$url");
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      //ok
      //print(response.body[0]);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
