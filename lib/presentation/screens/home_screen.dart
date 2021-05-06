import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_movie_app/presentation/widgets/app_drawer.dart';
import 'package:flutter_movie_app/presentation/widgets/genres/genres_widget.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_top_rated.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_now_playing.dart';
import 'package:flutter_movie_app/presentation/widgets/person_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: AppDrawer()),
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            EvaIcons.menu2Outline,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text("Discover"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              EvaIcons.searchOutline,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          NowPlayingWidget(),
          GenresWidget(),
          PersonList(),
          MovieTopRated(),
        ],
      ),
    );
  }
}
