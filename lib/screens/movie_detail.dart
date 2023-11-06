
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.movie});

  //parametro
  final Movie movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
