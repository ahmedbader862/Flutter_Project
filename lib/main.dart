import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/bloc/getmovieSearch.dart';
import 'package:movie_app/bloc/getmovies.dart';
import 'package:movie_app/bloc/getmoviesDetailes.dart';
import 'package:movie_app/bloc/navigate.dart';
import 'package:movie_app/view/home.dart';
import 'package:movie_app/webserves/getdata.dart';
import 'package:path_provider/path_provider.dart';

Box? myBox;

Future<Box> openHiveBox(String box) async {
  if (!Hive.isBoxOpen(box)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  
  }
  myBox = await Hive.openBox(box);
  return myBox!;
}

void main() async {
  WidgetsFlutterBinding();
  await openHiveBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Wepserver wepserver = Wepserver();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetmoviesBloc(wepserver)..Getmovies(),
        ),
        BlocProvider(
          create: (context) => GetmoviesBlocDetailes(wepserver),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => GetmoviesBlocSearch(wepserver),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
