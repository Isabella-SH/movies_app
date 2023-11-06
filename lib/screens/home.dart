import 'package:flutter/material.dart';
import 'package:movies_app/screens/movies.dart';
import 'package:movies_app/widgets/favorite_movie_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedTab=0;

  final List<Widget> _tabs=[
    const Movies(),
    const FavoriteMovieList()
  ];

  _changeTab(int index){
    setState(() {
      _selectedTab=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: _tabs[_selectedTab],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index)=> _changeTab(index),

        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,

        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}