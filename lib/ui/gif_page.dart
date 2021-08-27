import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GifPage extends StatelessWidget {
  final Map _getImage;
  GifPage(this._getImage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_getImage["title"]),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Share.share(_getImage["images"]["fixed_height"]["url"]);
              },
              icon: Icon(Icons.share))
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_getImage["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
