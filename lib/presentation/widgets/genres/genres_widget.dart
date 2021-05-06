import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/logic/cubit/genres/genres_movie_list_cubit.dart';
import 'package:flutter_movie_app/logic/models/genres/genre.dart';
import 'package:flutter_movie_app/logic/models/genres/genre_response.dart';
import 'package:flutter_movie_app/presentation/widgets/genres/genres_list.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenresMovieListCubit()..genresMovie(),
      child: BlocBuilder<GenresMovieListCubit, GenresMovieListState>(
        builder: (context, state) {
          // if (state is GenresMovieListLoading) {
          //   return _buildLoadingWidget();
          // } else
          if (state is GenresMovieListLoaded) {
            return _buildHomeWidget(context, state.result);
          }
          return Container();
        },
      ),
    );
  }
}

// Widget _buildLoadingWidget() {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: 25.0,
//           width: 25.0,
//           child: CircularProgressIndicator(
//             valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
//             strokeWidth: 4.0,
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget _buildErrorWidget(String error) {
//   return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Error occured: $error"),
//         ],
//       ));
// }

Widget _buildHomeWidget(BuildContext context, GenreResponse data) {
  List<Genre> genres = data.genres;
  if (genres.length == 0) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
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
    return GenresList(
      genres: genres,
    );
}
