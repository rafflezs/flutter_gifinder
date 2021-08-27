import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  int _offset = 0;

  Future<Map> _requestSearch() async {
    http.Response response;
    if (_search == null) {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=FWD6OsPwiKuC189snT3QLm8GtF12oAYh&limit=30&rating=r"));
    } else {
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=FWD6OsPwiKuC189snT3QLm8GtF12oAYh&q=${_search}&limit=30&offset=${_offset}&rating=r&lang=en"));
    }

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _requestSearch().then((map) {
      print("Debug test number 1");
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          'assets/Logo.png',
          scale: 40,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Pesquise aqui: ",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 250,
                      height: 250,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 6,
                      ),
                    );
                  default:
                    return Container();
                }
              },
              future: _requestSearch(),
            ),
          ),
        ],
      ),
    );
  }
}
