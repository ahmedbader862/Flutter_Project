import 'package:movie_app/webserves/modle.dart';

class StatesMovies  {
  
}

class LodaingMovies extends StatesMovies {
  
}
class SucssesMovies extends StatesMovies {
  final List<MovieModle> moviesNow;
  final List<MovieModle> moviesPop;
  SucssesMovies(this.moviesNow , this.moviesPop);
}


class EventsMovies extends StatesMovies {
  
}



