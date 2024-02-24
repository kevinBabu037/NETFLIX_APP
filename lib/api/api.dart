
import 'dart:convert';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/models/movies.dart';
import 'package:http/http.dart' as http;

class Api{

static const _trendingUrl='https://api.themoviedb.org/3/trending/movie/week?api_key=${Constants.apikey}'; 

static const _topten='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}'; 

static const _upComing='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}';

static const _popular ='https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apikey}';

static const searchPageIdleUrl ='https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apikey}';


////////
 Future< List<Movie>> getTrendingMovies()async{

    final response = await http.get(Uri.parse(_trendingUrl));

     if(response.statusCode == 200){ 
        final decodedData=json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }else{
       throw Exception('somethig happened');
     }
  }

 ////////

 Future< List<Movie>> getTopRatedMovies()async{

    final response = await http.get(Uri.parse(_topten));

     if(response.statusCode == 200){
        final decodedData=json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }else{
       throw Exception('somethig happened');
     }
  }

 ////////
 
  Future< List<Movie>> getTenseDramaMovies()async{

    final response = await http.get(Uri.parse(_upComing));

     if(response.statusCode == 200){
        final decodedData=json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }else{
       throw Exception('somethig happened');
     }
  }

/////////
 
 Future< List<Movie>> getPopularMovies()async{

    final response = await http.get(Uri.parse(_popular));

     if(response.statusCode == 200){
        final decodedData=json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
     }else{
       throw Exception('somethig happened');
     }
  }

//////////


  Future<List<Movie>> searchPageIdle() async {
    final respose = await http.get(Uri.parse(searchPageIdleUrl));
    if (respose.statusCode == 200) {
      final responseData = jsonDecode(respose.body)['results'] as List;
      return responseData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('error');
    }
  } 
 

//////////////

  Future<List<Movie>> searchResult(String movie)async{
   String serechResult='https://api.themoviedb.org/3/search/movie?api_key=${Constants.apikey}&query=$movie';
   final response=await http.get(Uri.parse(serechResult));
   if(response.statusCode==200){
    final responseData=jsonDecode(response.body)['results'] as List;
    return responseData.map((movie) => Movie.fromJson(movie)).toList();
   }else{
    throw Exception('error');
}
}





}


