import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/bloc.dart';
import 'package:movie_app/bloc/getmovies.dart';
import 'package:movie_app/view/show_deatiles.dart';

class Home_body extends StatelessWidget {
  const Home_body({super.key});

  @override
  Widget build(BuildContext context) {
//  var data = BlocProvider.of<GetmoviesBloc>(context).movies;

    return Scaffold(
    

      body: BlocBuilder<GetmoviesBloc, StatesMovies>(
        builder: (context, state) {
          if (state is LodaingMovies) {
            return Center(child: CircularProgressIndicator());
          } 
          
          else if (state is EventsMovies) {
            return Center(child: Text('Some thing wrong'));
          } 
          
          else if (state is SucssesMovies) {
            var data = state;

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Now Showing',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(17, 14, 71, 1),
                              fontWeight: FontWeight.w900)),
                      ElevatedButton(
                          onPressed: () {
                            print("dddd");
                          },
                          child: Text('see more',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(17, 14, 71, 1),
                                  fontWeight: FontWeight.w900)))
                    ],
                  ),
                ),

                // ###################################

                Container(
                  width: 143,
                  height: 283,
                  child: ListView.builder(
                      itemCount: data.moviesNow.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowDeatiles(movieDeatiles:data.moviesNow[i])))
                            },
                            child: Column(
                              children: [
                                Image.network("https://image.tmdb.org/t/p/w500${data.moviesNow[i].poster_path}",
                                    height: 212, width: 143, fit: BoxFit.fill),
                                Text('${data.moviesNow[i].title}',
                                    style: TextStyle(
                                        fontFamily: '',
                                        fontSize: 14,
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontWeight: FontWeight.w700)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color.fromRGBO(255, 195, 25, 1),
                                    ),
                                    Text('${data.moviesNow[i].vote_average}',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(156, 156, 156, 1),
                                            fontWeight: FontWeight.w400)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                //  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(17, 14, 71, 1),
                              fontWeight: FontWeight.w900)),
                      ElevatedButton(
                          onPressed: () => {
                          },
                          child: Text('see more',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(17, 14, 71, 1),
                                  fontWeight: FontWeight.w900)))
                    ],
                  ),
                ),

                // (((((((((((((((((((((((  ####    )))))))))))))))))))))))
                // (((((((((((((((((((((((  ####    )))))))))))))))))))))))
                // (((((((((((((((((((((((  ####   )))))))))))))))))))))))

                
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.moviesPop.length,
                    itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(bottom: 10 , left: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowDeatiles(movieDeatiles:data.moviesPop[index])))
                            },
                            child: Image.network("https://image.tmdb.org/t/p/w500${data.moviesPop[index].poster_path}",
                                height: 212, width: 143, fit: BoxFit.fill),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${data.moviesPop[index].title}',
                                      style: TextStyle(
                                          fontFamily: 'Muli',
                                          fontSize: 14,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontWeight: FontWeight.w700),
                                        // overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                          
                                          ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(255, 195, 25, 1),
                                      ),
                                      Text('${data.moviesPop[index].vote_average}',
                                          style: TextStyle(
                                              fontFamily: 'Mulish',
                                              fontSize: 12,
                                              color: Color.fromRGBO(156, 156, 156, 1),
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                                    
                                  // *****************************************************
                                                    
                                  Row(
                                    children: [
                                      Container(
                                        width: 61,
                                        height: 18,
                                       margin: EdgeInsets.all(8),
                                        child: ElevatedButton(
                                          onPressed: () => {print("object")},
                                          child: Text('see more',
                                              style: TextStyle(
                                                  fontFamily: 'Mulish',
                                                  fontSize: 8,
                                                  color: Color.fromRGBO(136, 164, 232, 1),
                                                  fontWeight: FontWeight.w700)),
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  Color.fromRGBO(219, 227, 255, 1))),
                                        ),
                                      ),
                                      Container(
                                        width: 61,
                                        height: 18,
                                        child: ElevatedButton(
                                          onPressed: () => {print("object")},
                                          child: Text('see more',
                                              style: TextStyle(
                                                  fontFamily: 'Mulish',
                                                  fontSize: 8,
                                                  color: Color.fromRGBO(136, 164, 232, 1),
                                                  fontWeight: FontWeight.w700)),
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  Color.fromRGBO(219, 227, 255, 1))),
                                        ),
                                      ),
                                      Container(
                                        width: 61,
                                        height: 18,
                                        margin: EdgeInsets.all(8),
                                        child: ElevatedButton(
                                          onPressed: () => {print("object")},
                                          child: Text('see more',
                                              style: TextStyle(
                                                  fontFamily: 'Mulish',
                                                  fontSize: 8,
                                                  color: Color.fromRGBO(136, 164, 232, 1),
                                                  fontWeight: FontWeight.w700)),
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(
                                                  Color.fromRGBO(219, 227, 255, 1))),
                                        ),
                                      ),
                                    ],
                                  ),
                                                    
                                  // @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
                                                    
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.watch_later_outlined,
                                        size: 9.72,
                                      ),
                                      Text(
                                        "${data.moviesPop[index].release_date}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Muli'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                            }
                  ),
                )
              ],
            );
          } else {
            return Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}

