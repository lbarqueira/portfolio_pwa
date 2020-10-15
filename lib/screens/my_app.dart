import 'package:flutter/material.dart';
import 'home_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio PWA',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto'),
      home: HomeScreen(),
    );
  }
}
