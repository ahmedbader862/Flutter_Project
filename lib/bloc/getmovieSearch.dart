import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/blocSearch.dart';
import 'package:movie_app/webserves/getdata.dart';
import 'package:movie_app/webserves/modle.dart';

class GetmoviesBlocSearch extends Cubit<StatesMoviesSearsh> {
  final Wepserver wepserver;

  GetmoviesBlocSearch(this.wepserver) : super(DefaultMovieSearch());


Future<void> getMovieDetailes( String search) async {
  try {
    emit(LodaingMovieSearch());

    List<MovieModle> moviesSearch =
        await wepserver.getMovieSearch(search);

    if (moviesSearch.isEmpty) {
      emit(EventsMovieSearch());
    } else {
      emit(SucssesMovieSearch(moviesSearch));
    }
  } catch (e) {
    emit(EventsMovieSearch());
  }
}



}
