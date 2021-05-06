import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/logic/cubit/movies/movie_top_rated_cubit.dart';
import 'package:flutter_movie_app/logic/models/movies/movie.dart';
import 'package:flutter_movie_app/logic/models/movies/movie_response.dart';
import 'package:flutter_movie_app/presentation/screens/movie_detail_screen.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_movie_app/presentation/widgets/movie_loading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieTopRated extends StatelessWidget {
  const MovieTopRated({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieTopRatedCubit()..movieTopRated(),
      child: BlocBuilder<MovieTopRatedCubit, MovieTopRatedState>(
        builder: (context, state) {
          if (state is MovieTopRatedLoading) {
            return _buildLoadingWidget();
          } else if (state is MovieTopRatedLoaded) {
            return _buildHomeWidget(context, state.result);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return MovieLoading();
  }

  // Widget _buildErrorWidget(String error) {
  //   return Center(
  //       child: Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Text("Error occurred: $error"),
  //     ],
  //   ));
  // }

  Widget _buildHomeWidget(BuildContext context, MovieResponse data) {
    List<Movie> movies = data.results;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "BEST POPULAR MOVIES",
            style: TextStyle(
              color: Style.Colors.titleColor,
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        (movies.length == 0)
            ? Container(
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
              )
            : Container(
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
                          children: [
                            Hero(
                              tag: movies[index].id,
                              child: Container(
                                width: 120.0,
                                height: 180.0,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  shape: BoxShape.rectangle,
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/" + movies[index].posterPath,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              width: 100,
                              child: Text(
                                movies[index].title,
                                maxLines: 2,
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.0),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  movies[index].voteAverage.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5.0),
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
              ),
      ],
    );
  }
}
