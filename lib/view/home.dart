import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/navigate.dart';
import 'package:movie_app/wedgit/favoiret.dart';
import 'package:movie_app/wedgit/home_body.dart';
import 'package:movie_app/wedgit/search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Home_body(),
      const Search(),
      const Favoiret(),
    ];

    return Scaffold(

      appBar: AppBar(
        title: Center(
          child: Text(
            'FilmKu',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.notifications),
          ),
        ],
      ),

      // &&&&&&&&&&&&&&&%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$
     
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),

      // &&&&&&&&&&&&&&&%%%%%%%%%%%%%%%$$$$$$$$$$$$$$$$$$$$$$$$$$$$

      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return screens[selectedIndex]; 
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
        builder: (context, selectedIndex) {
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => context.read<NavigationCubit>().changeTab(index),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        },
      ),
    );
  }
}
