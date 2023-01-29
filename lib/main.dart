import 'package:flutter/material.dart';
import 'package:movies_app/core/utilies/app_string.dart';
import 'core/services/services-locator.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().inite();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}

