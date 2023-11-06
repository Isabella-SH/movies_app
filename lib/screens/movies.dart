
import 'package:flutter/material.dart';
import 'package:movies_app/widgets/movie_list.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {

    //para hallar el alto
    final height=MediaQuery.of(context).size.height;

    //mostrara 3 listas, cada una de un servicio diferente que se accede con el parametro endpoint
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height/3,
              child: const MovieList(endpoint: 'popular'), //muestra los populares
            ),
            SizedBox(
              height: height/3,
              child: const MovieList(endpoint: 'upcoming'), //muetsra los upcoming
            ),
            SizedBox(
              height: height/3,
              child: const MovieList(endpoint: 'top_rated'), //muetsra los top_rated
            ),
          ],
        ),
      ),
    );
  }
}




