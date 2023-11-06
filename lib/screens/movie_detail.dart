
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/repositories/favorite_movie_repository.dart';

import '../utils/functions.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.movie});

  //parametro
  final Movie movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  //atributos
  bool _favorite=false;

  initialize()async{
    //_favorite toma el valor que da el metodo del repositorie al pasarle cada entidad
    _favorite=await FavoriteMovieRepository().isFavorite(widget.movie.id);
    if (mounted){ //si ya se cargo toda la informacion
      setState(() {
        _favorite=_favorite;
      });
    }
  }

  @override
  void initState(){
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final my_icon = Icon(Icons.favorite, color:_favorite ? Colors.red: Colors.grey);

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
                onPressed: (){
                  if(mounted){ //si ya se cargo toda la info
                    setState(() {
                      _favorite =! _favorite; //cambia de valor cada que se da click
                    });
                  }
                   //si es true inserta, sino elimina
                  _favorite? FavoriteMovieRepository().insert(widget.movie.id)
                  :FavoriteMovieRepository().delete(widget.movie.id);
                },
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
