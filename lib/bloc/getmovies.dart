import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/webserves/getdata.dart';
import 'package:movie_app/webserves/modle.dart';

class GetmoviesBloc extends Cubit<StatesMovies> {

final Wepserver wepserver;


  GetmoviesBloc(this.wepserver) : super(LodaingMovies());

// late List<MovieModle> movies;


  Future<void> Getmovies() async {
    try {
      emit(LodaingMovies());

      List<MovieModle> moviesNow = await wepserver.getMovieApi('now_playing');

      List<MovieModle> moviesPop = await wepserver.getMovieApi('top_rated');

      if (moviesNow.isEmpty || moviesPop.isEmpty ) {
        emit(EventsMovies()); 
      } else {
        emit(SucssesMovies(moviesNow , moviesPop));
      }
    } catch (e) {
      emit(EventsMovies());
    }
  }

  

   
}
