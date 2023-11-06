import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/services/movie_service.dart';
import 'package:movies_app/utils/functions.dart';

import '../models/movie.dart';
import '../screens/movie_detail.dart';


class MovieList extends StatefulWidget {
  const MovieList({super.key, required this.endpoint});

  //parametro
  final String endpoint;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  //variables
  MovieService? _movieService;
  final _pageSize=20;

  final PagingController<int,Movie> _pagingController= PagingController(firstPageKey: 1);

  @override
  void initState(){
    //inicialiazo el servicio
    _movieService=MovieService();
    //llamo a fetchpage
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future _fetchPage(int pageKey) async{

    try{
      //por cada llamada del metodo del servicio creo un arreglo de movie
     final movies=(await _movieService!.getAll(widget.endpoint, pageKey)).data as List<Movie>;

     //veo si el tamaño de movies es menor a 20, que el que quiero mostrar en cada paginacion
     final isLastPage=movies.length<_pageSize;

     if(isLastPage){ //si es menor a 20
       _pagingController.appendLastPage(movies); //muestro las peliculas
     }else{
       final nextPageKey=pageKey+1; //creo otra pagina
       //llamo al metod del servicio pasandole como parametro la pagina 2
       _pagingController.appendPage(movies, nextPageKey);
     }
    }catch(error){
      _pagingController.error=error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int,Movie>(
      scrollDirection: Axis.horizontal, //crea cada paginacion horizontalmente
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Movie>(
        itemBuilder: (context,item,index){
          return MovieItem(movie:item); //cada indice de movies es un moviItem
        }
      ),
    );
  }
}

class MovieItem extends StatefulWidget {
  const MovieItem({super.key, required this.movie});

  //parametro
  final Movie movie;

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {

  @override
  Widget build(BuildContext context) {

    //creo la imagen
    final image=Image.network(getUrl(widget.movie.posterPath));

    //veo el ancho de la pantalla
    final width=MediaQuery.of(context).size.width;

    return GestureDetector(

      //para navegar a movieDetail
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=> MovieDetail(movie:widget.movie),),
        );
      },
      child: SizedBox(
        width: width/3,
        child: Card(
          child: Column(
            children: [
              image,
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Text(widget.movie.title, maxLines: 1,)
              ),
            ],
          ),
        ),
      ),
    );
  }

}















