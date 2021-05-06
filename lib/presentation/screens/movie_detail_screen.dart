import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/logic/cubit/movies/movie_video_cubit.dart';
import 'package:flutter_movie_app/logic/models/movies/movie.dart';
import 'package:flutter_movie_app/logic/models/movies/video/video.dart';
import 'package:flutter_movie_app/logic/models/movies/video/video_response.dart';
import 'package:flutter_movie_app/presentation/screens/video_player_screen.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_movie_app/presentation/widgets/casts.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_info.dart';
import 'package:flutter_movie_app/presentation/widgets/similar_movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({Key key, this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: Builder(
        builder: (context) {
          return SliverFab(
            floatingPosition: FloatingPosition(right: 20),
            floatingWidget: BlocProvider(
              create: (context) => MovieVideoCubit()..video(id: movie.id),
              child: BlocBuilder<MovieVideoCubit, MovieVideoState>(
                builder: (context, state) {
                  if (state is MovieVideoLoaded) {
                    return _buildVideoWidget(context, state.result);
                  }
                  return Container();
                },
              ),
            ),
            expandedHeight: 200.0,
            slivers: [
              SliverAppBar(
                backgroundColor: Style.Colors.mainColor,
                expandedHeight: 200.0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    movie.title.length > 40 ? movie.title.substring(0, 37) + "..." : movie.title,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                  background: Stack(
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/original/" + movie.backdropPath,
                            ),
                          ),
                        ),
                        child: new Container(
                          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.1, 0.9],
                            colors: [Colors.black.withOpacity(0.9), Colors.black.withOpacity(0.0)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(0.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              movie.voteAverage.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            RatingBarIndicator(
                              itemSize: 10.0,
                              rating: movie.voteAverage / 2,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                EvaIcons.star,
                                color: Style.Colors.ratingColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                        child: Text(
                          "OVERVIEW",
                          style: TextStyle(
                            color: Style.Colors.titleColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          movie.overview,
                          style: TextStyle(color: Colors.white, fontSize: 12.0, height: 1.5),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      MovieInfo(id: movie.id),
                      Casts(id: movie.id),
                      SimilarMovie(id: movie.id)
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildVideoWidget(BuildContext context, VideoResponse data) {
    List<Video> videos = data.results;
    return FloatingActionButton(
      backgroundColor: Style.Colors.secondColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              controller: YoutubePlayerController(
                initialVideoId: videos[0].key,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  // mute: true,
                ),
              ),
            ),
          ),
        );
      },
      child: Icon(Icons.play_arrow),
    );
  }
}
