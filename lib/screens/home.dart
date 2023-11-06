import 'package:flutter/material.dart';
import 'package:movies_app/screens/movies.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Movies(),
    );
  }
}
