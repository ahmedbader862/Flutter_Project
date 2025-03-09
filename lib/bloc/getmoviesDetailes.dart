import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/blocDetailes.dart';
import 'package:movie_app/webserves/getdata.dart';
import 'package:movie_app/webserves/modle.dart';

class GetmoviesBlocDetailes extends Cubit<StatesMoviesDetailes> {
  final Wepserver wepserver;

  GetmoviesBlocDetailes(this.wepserver) : super(LodaingMoviesDetailes());


Future<void> getMovieDetailes(int id) async {
  try {
    emit(LodaingMoviesDetailes());

    List<MovieDetailsModle> moviesDetailes =
        await wepserver.getMovieDetailes(id);

    if (moviesDetailes.isEmpty) {
      emit(EventsMoviesDetailes());
    } else {
      emit(SucssesMoviesDetailes(moviesDetailes));
    }
  } catch (e) {
    emit(EventsMoviesDetailes());
  }
}



}
