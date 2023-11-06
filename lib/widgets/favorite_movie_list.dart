import 'package:flutter/material.dart';
import 'package:movies_app/repositories/favorite_movie_repository.dart';

class FavoriteMovieList extends StatefulWidget {
  const FavoriteMovieList({super.key});

  @override
  State<FavoriteMovieList> createState() => _FavoriteMovieListState();
}

class _FavoriteMovieListState extends State<FavoriteMovieList> {

  FavoriteMovieRepository? _favoriteMovieRepository;
  List? _favoriteMovies;

  initialize() async{
    _favoriteMovies= await _favoriteMovieRepository!.getAll();
    if(mounted){
      setState(() {
        //renderiza el valor de todos la lista de objetos que estan en la tabla favoritos
        _favoriteMovies=_favoriteMovies;
      });
    }
  }

  @override
  void initState(){
    _favoriteMovieRepository=FavoriteMovieRepository(); //inicializar el repository
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                 //si la lista esta vacia toma el valor de 0, sino toma el tamaño que tiene
      itemCount: (_favoriteMovies == null)?0:_favoriteMovies!.length,
      itemBuilder: (context,index){
          return ListTile(
            //imprimir cada elemento, en este caso solo se guardaron id
            title: Text(_favoriteMovies![index].toString()),
          );
      },
    );
  }
}


