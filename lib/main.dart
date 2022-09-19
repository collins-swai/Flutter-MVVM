import 'package:flutter/material.dart';
import 'package:mvvm_in_lutter/res/AppContextExtension.dart';
import 'package:mvvm_in_lutter/view/details/MovieDetailsScreen.dart';
import 'package:mvvm_in_lutter/view/home/HomeScreen.dart';
import 'models/moviesList/MoviesMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
        accentColor: context.resources.color.colorAccent,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        MovieDetailsScreen.id: (context) => MovieDetailsScreen(
            ModalRoute.of(context)!.settings.arguments as Movie),
      },
    );
  }
}
