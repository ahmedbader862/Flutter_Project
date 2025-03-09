import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/blocDetailes.dart';
import 'package:movie_app/bloc/getmoviesDetailes.dart';
import 'package:movie_app/hive/hive.dart';

class ShowDeatiles extends StatefulWidget {
  final movieDeatiles;

  const ShowDeatiles({super.key, this.movieDeatiles});

  @override
  State<ShowDeatiles> createState() => _ShowDeatilesState();
}

class _ShowDeatilesState extends State<ShowDeatiles> {
  @override
  initState() {
    context
        .read<GetmoviesBlocDetailes>()
        .getMovieDetailes(widget.movieDeatiles.id);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: IconButton(onPressed: ()=>{}, icon: Icon(Icons.notifications),),
      //    backgroundColor: Colors.transparent,
      // ),

      body: BlocBuilder<GetmoviesBlocDetailes, StatesMoviesDetailes>(
        builder: (context, state) {
          if (state is LodaingMoviesDetailes) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EventsMoviesDetailes) {
            return Center(child: Text(' Something went wrong'));
          } else if (state is SucssesMoviesDetailes) {
            var Detailes = state;
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.movieDeatiles.backdrop_path}',
                      height: 315,
                      width: 400,
                      fit: BoxFit.fill),
                ),

                Positioned(
                  top: 65,
                  left: 24,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Positioned(
                  top: 65,
                  left: 327,
                  child: IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

                Positioned(
                    top: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      width: 400,
                      height: 530,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${Detailes.moviesDetailes[0].name}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    //  ${Detailes.moviesDetailes[0].id}
                                    HiveMethods().handleHive(context, Detailes.moviesDetailes);
                                  },
                                  icon: Icon(Icons.class_sharp,
                                      color: Colors.yellow, size: 20),
                                ),
                              ],
                            ),
                            // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(255, 195, 25, 1),
                                ),
                                Text('${widget.movieDeatiles.vote_average}',
                                    style: TextStyle(
                                        fontFamily: 'Mulish',
                                        fontSize: 12,
                                        color: Color.fromRGBO(156, 156, 156, 1),
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            // $$$$$$$$$$$$$$$$$$$$$$$$$$

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                      "${Detailes.moviesDetailes[0].known_for_department}",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 8,
                                          color:
                                              Color.fromRGBO(136, 164, 232, 1),
                                          fontWeight: FontWeight.w700)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(
                                                  219, 227, 255, 1))),
                                ),
                                ElevatedButton(
                                  onPressed: () => {print("object")},
                                  child: Text(
                                      "${Detailes.moviesDetailes[0].known_for_department}",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 8,
                                          color:
                                              Color.fromRGBO(136, 164, 232, 1),
                                          fontWeight: FontWeight.w700)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(
                                                  219, 227, 255, 1))),
                                ),
                                ElevatedButton(
                                  onPressed: () => {print("object")},
                                  child: Text(
                                      "${Detailes.moviesDetailes[0].known_for_department}",
                                      style: TextStyle(
                                          fontFamily: 'Mulish',
                                          fontSize: 8,
                                          color:
                                              Color.fromRGBO(136, 164, 232, 1),
                                          fontWeight: FontWeight.w700)),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(
                                                  219, 227, 255, 1))),
                                ),
                              ],
                            ),

                            // &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "length",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(156, 156, 156, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Muli'),
                                    ),
                                    Text(
                                      "data",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Muli'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Language",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(156, 156, 156, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Muli'),
                                    ),
                                    Text(
                                      "${widget.movieDeatiles.original_language}",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Muli'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Rating",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(156, 156, 156, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Muli'),
                                    ),
                                    Text(
                                      "data",
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Muli'),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // (((((((((((((((((((((((((((((((())))))))))))))))))))))))))))))))
                            SizedBox(
                              height: 20,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Description',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(17, 14, 71, 1),
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Merriweather')),
                                Text(
                                  '${widget.movieDeatiles.overview}',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(156, 156, 156, 1),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Muli'),
                                ),
                              ],
                            ),

                            // (((((((((((((((((((((((((((((((())))))))))))))))))))))))))))))))

                            SizedBox(
                              height: 20,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('cast',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromRGBO(17, 14, 71, 1),
                                        fontWeight: FontWeight.w900)),
                                ElevatedButton(
                                    onPressed: () => {print("object")},
                                    child: Text('see more',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromRGBO(17, 14, 71, 1),
                                            fontWeight: FontWeight.w900)))
                              ],
                            ),

                            // ?????????????????????????????????????????????

                            Container(
                              height: 130,
                              child: ListView.builder(
                                itemCount: Detailes.moviesDetailes.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Image.network(
                                        'https://image.tmdb.org/t/p/w500${Detailes.moviesDetailes[index].profile_path}',
                                        height: 110,
                                        width: 72,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${Detailes.moviesDetailes[index].name}',
                                            style: TextStyle(
                                                fontFamily: 'Muli',
                                                color: Color.fromRGBO(
                                                    17, 14, 71, 1),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            );
          } else {
            return Center(child: Text('🚫 لا يوجد أفلام متاحة'));
          }
        },
      ),
    );
  }
}
