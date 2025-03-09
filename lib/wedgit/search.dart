import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/blocSearch.dart';
import 'package:movie_app/bloc/getmovieSearch.dart';
import 'package:movie_app/view/show_deatiles.dart';
import 'package:movie_app/webserves/modle.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) async {
                var getmoviesBlocSearch =
                    BlocProvider.of<GetmoviesBlocSearch>(context);
                getmoviesBlocSearch.getMovieDetailes(value);
              },  
              decoration: InputDecoration(
                hintText: 'Search for best movies',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                suffixIcon: const Icon(Icons.search),
                labelText: 'Search',
              ),
            ),
          ),
// ####################################################
// ####################################################
Expanded(
  child: BlocBuilder<GetmoviesBlocSearch, StatesMoviesSearsh>(
    builder: (context, state) {
      if (state is DefaultMovieSearch) {
        return const Center(child: Text('Enter a movie name to start searching'));
      } else if (state is LodaingMovieSearch) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is SucssesMovieSearch) {
        final result = state;
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.5,
          ),
          itemCount: result.MovieSearch.length,
          itemBuilder: (BuildContext context, int i) {
            MovieModle movie = result.MovieSearch[i];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowDeatiles(movieDeatiles: movie,)))
                      },
                      child: movie.poster_path != null &&
                                        movie.poster_path!.isNotEmpty
                                    ? Image.network(
                                        "https://image.tmdb.org/t/p/w500/${movie.poster_path}",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('images/imagess.jpg' , fit: BoxFit.fill , height: 220,),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.title ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color.fromRGBO(255, 195, 25, 1),
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.vote_average?.toStringAsFixed(1) ?? 'N/A',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(156, 156, 156, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
      return const Center(child: Text('No movies found'));
    },
  ),
),
        ],
      ),
    );
  }
}
