import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/logic/cubit/discover/discover_movie_cubit.dart';
import 'package:flutter_movie_app/logic/models/discover/discover_response.dart';
import 'package:flutter_movie_app/logic/models/movies/movie.dart';
import 'package:flutter_movie_app/presentation/screens/movie_detail_screen.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieByGenre extends StatelessWidget {
  const MovieByGenre({Key key, this.genreId}) : super(key: key);
  final int genreId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverMovieCubit()..getDiscoverMovie(id: genreId),
      child: BlocBuilder<DiscoverMovieCubit, DiscoverMovieState>(
        builder: (context, state) {
          if (state is DiscoverMovieLoading) {
            return _buildLoadingWidget();
          } else if (state is DiscoverMovieLoaded) {
            return _buildHomeWidget(context, state.result);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ));
  }

  // Widget _buildErrorWidget(String error) {
  //   return Center(
  //       child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text("Error occured: $error"),
  //     ],
  //   ));
  // }

  Widget _buildHomeWidget(BuildContext context, DiscoverResponse data) {
    List<Movie> movies = data.results;
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 270.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    movies[index].posterPath == null
                        ? Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: new BoxDecoration(
                              color: Style.Colors.secondColor,
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  EvaIcons.filmOutline,
                                  color: Colors.white,
                                  size: 60.0,
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: 120.0,
                            height: 180.0,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2.0)),
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("https://image.tmdb.org/t/p/w200/" +
                                      movies[index].posterPath)),
                            ),
                          ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 100,
                      child: Text(
                        movies[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          movies[index].voteAverage.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        RatingBarIndicator(
                          itemSize: 8.0,
                          rating: movies[index].voteAverage / 2,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            EvaIcons.star,
                            color: Style.Colors.ratingColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
