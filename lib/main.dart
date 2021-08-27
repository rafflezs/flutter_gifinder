import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/gif_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(hintColor: Colors.white, primaryColor: Colors.white),
    home: HomePage(),
  ));
}
