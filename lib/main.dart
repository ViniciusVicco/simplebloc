import 'package:flutter/material.dart';
import 'package:simpleblocproject/cep/presentation/pages/cep_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CepPage(title: 'Flutter Demo Home Page'),
    );
  }
}
