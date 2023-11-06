
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';

import '../utils/functions.dart';

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

    final my_icon = Icon(Icons.favorite, color: Colors.red);

    //imagen del cada movie
    final image = Image.network(getUrl(widget.movie.posterPath));

    return Scaffold(
      //                 PARA MOSTRAR LA IMAGEN DE FONDO Y EL TITULO
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: image,
                title: Text(widget.movie.title),
              ),
            )
          ];
        },
        //                 PARA MOSTRAR EL FAVORITO
        body: Column(
          children: [
            IconButton(
                onPressed: (){},
                icon: my_icon
            ),

        //                 PARA MOSTRAR EL DETALLE DE LA PELICULA
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.movie.overview),
              ),
            )
          ],
        ),
      ),
    );
  }
}
