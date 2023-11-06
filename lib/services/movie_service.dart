
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/shared/result.dart';

class MovieService{
  //https://api.themoviedb.org/3/movie/100?api_key=3cae426b920b29ed2fb1c0749f258325
  final String baseUrl='https://api.themoviedb.org/3/movie/';
  final String _page = '?page=';
  final String _apiKey='&api_key=3cae426b920b29ed2fb1c0749f258325';

  //devuelve en algun momento una lista
  Future<Result> getAll(String endpoint, int page) async{
    //concatena un dato a la ruta
    http.Response response=await http.get(Uri.parse('$baseUrl$endpoint$_page$page$_apiKey'));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);
      //crea una lista llamada maps que recoge tod del json
      final List maps=jsonResponse["result"];
      //cada map es asignado a un objeto usando su metodo de fromJson
      final data = maps.map((e) => Movie.fromJson(e)).toList();

      return Result(  //retorna una respuesta satisfactoria
          success: true,
          data: data,
          message: 'Success'
      );
    }
    return const Result(  //retorna una respuesta no satisfactoria
        success: false,
        data: null,
        message: 'API error'
    );
  }
}





