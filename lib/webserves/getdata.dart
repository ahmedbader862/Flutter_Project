import 'package:dio/dio.dart';
import 'package:movie_app/webserves/modle.dart';

class Wepserver {
  final dio = Dio();

  //  String type = 'now_playing';
  String langue = 'en';
  String baseUrl = 'https://api.themoviedb.org/3/movie';
  String apiKey = '9b743af1d4fde1d65af33c40dcccce87';

  Future<List<MovieModle>> getMovieApi(String type) async {
    try {
      final Response response =
          await dio.get('$baseUrl/$type?api_key=$apiKey&language=$langue');

      final data = response.data;
      if (data['results'] == null) {
        print("No movies found!");
        return [];
      }

      List<MovieModle> movies = data['results'].map<MovieModle>((movie) {
        return MovieModle.fromJson(movie);
      }).toList();

      return movies;
    } on DioException catch (e) {
      print('%%%%%%%%%%%%%%%%%%%% $e');
    } catch (e) {
      print('%%%%%%%%%%%%%%%%%%%% $e');
    }

    return []; 
  }

// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// (((((((((((((((((((((((((((((((((())))))))))))))))))))))))))))))))))
  Future<List<MovieDetailsModle>> getMovieDetailes(int id) async {
    try {
      final Response response = await dio
          .get('$baseUrl/$id/credits?api_key=$apiKey&language=$langue');

      final data = response.data;
      if (data['cast'] == null) {
        print("No movies found!");
        return [];
      }

      List<MovieDetailsModle> moviesDetailes =
          data['cast'].map<MovieDetailsModle>((movie) {
        return MovieDetailsModle.fromJson(movie);
      }).toList();

      return moviesDetailes;
    } on DioException catch (e) {
      print('?????????????????????????? $e');
    } catch (e) {
      print('?????????????????????????? $e');
    }

    return [];
  }

// &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
// (((((((((((((((((((((((((((((((((())))))))))))))))))))))))))))))))))

  Future<List<MovieModle>> getMovieSearch(String search) async {
    try {
      final Response response = await dio.get(
        'https://api.themoviedb.org/3/search/movie?query=$search&api_key=$apiKey&language=$langue');

      final data = response.data;
      if (data['results'] == null) {
        print("No movies found!");
        return [];
      }

    List<MovieModle> movieSearch = data['results'].map<MovieModle>((movieSearch) {
        return MovieModle.fromJson(movieSearch);
      }).toList();

      return movieSearch;

    } catch (e) {
      print('?????????????????????????? $e');
    }
    return []; 
  }
}
