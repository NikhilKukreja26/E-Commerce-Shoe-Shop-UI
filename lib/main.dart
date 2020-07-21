import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './pages/home_page.dart';
import './pages/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Shoe Shop',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
      routes: {},
    );
  }
}
