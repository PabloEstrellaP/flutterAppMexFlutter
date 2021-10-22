import 'package:flutter/material.dart';
import 'package:autenticar_google/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba',
      initialRoute: 'register',
      routes: appRoutes,
    );
  }
}
