import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';

class HiveMethods  {


 


void handleHive ( context , Detailes  ){

    
 List<dynamic> moviesList =  myBox!.get("key3", defaultValue: []);
                                        
                                     for (var i = 0; i < moviesList.length; i++) {

                                       if (moviesList[i]["id"] == "${Detailes.id}") {

 
                                      AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Dialog Title',
            desc: 'Dialog description here.............',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            )..show();


                                         ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Already in favorites'),
                                        duration: Duration(seconds: 2),
                                      ),);
                                       
                                       }
                                     }

                                    // moviesList.add({
                                    //   "id": "${Detailes.moviesDetailes[0].id}",
                                    //   "name":
                                    //       "${Detailes.moviesDetailes[0].name}",
                                    //   "vote_average":
                                    //       "${widget.movieDeatiles.vote_average}",
                                    //   "original_language":
                                    //       "${widget.movieDeatiles.original_language}",
                                    //   "overview":
                                    //       "${widget.movieDeatiles.overview}",
                                    //   "poster_path":
                                    //       "${widget.movieDeatiles.poster_path}",
                                    // });
                                    
                                    myBox!.put("key3", moviesList);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Added to favorites'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );


  }


    
  }

