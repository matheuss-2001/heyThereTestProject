import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'containers/brasil_movies/components/brasil_recent_movies-screen.dart';
import 'api/brasil_movies_service/i_brasil_movies_service.dart';
import 'api/brasil_movies_service/brasil_movies_service.dart';

void main() {
  if (!Injector.appInstance.exists<IBrasilMoviesService>())
    Injector.appInstance
        .registerDependency<IBrasilMoviesService>(() => BrasilMoviesService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'imdb movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BrasilRecentMoviesScreen(),
    );
  }
}
