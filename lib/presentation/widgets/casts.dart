import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/logic/cubit/movies/movie_credit_cubit.dart';
import 'package:flutter_movie_app/logic/models/movies/credit/cast.dart';
import 'package:flutter_movie_app/logic/models/movies/credit/credit_response.dart';
import 'package:flutter_movie_app/presentation/widgets/shimmer_effect.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;

class Casts extends StatelessWidget {
  const Casts({Key? key, this.id}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCreditCubit()..movieCredits(id: id),
      child: BlocBuilder<MovieCreditCubit, MovieCreditState>(
        builder: (context, state) {
          if (state is MovieCreditLoading) {
            return _buildLoadingWidget();
          } else if (state is MovieCreditLoaded) {
            return _buildCastWidget(context, state.result!);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: ShimmerEffect(
            child: Container(
              width: 50,
              height: 12,
              color: Style.Colors.titleColor,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 140.0,
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(top: 10.0, right: 8.0),
                width: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShimmerEffect(
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          color: Style.Colors.secondColor,
                        ),
                        child: Icon(
                          FontAwesomeIcons.userAlt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ShimmerEffect(
                      child: Container(
                        color: Colors.white,
                        width: 90,
                        height: 12,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    ShimmerEffect(
                      child: Container(
                        color: Style.Colors.titleColor,
                        width: 70,
                        height: 12,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget _buildErrorWidget(String error) {
  //   return Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text("Error occured: $error"),
  //         ],
  //       ));
  // }

  Widget _buildCastWidget(BuildContext context, CreditResponse data) {
    List<Cast> casts = data.cast!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "CASTS",
            style: TextStyle(
                color: Style.Colors.titleColor, fontWeight: FontWeight.w500, fontSize: 12.0),
          ),
        ),
        SizedBox(height: 5.0),
        (casts.length == 0)
            ? Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "No More Persons",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),
                ),
              )
            : Container(
                height: 140.0,
                padding: EdgeInsets.only(left: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: casts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10.0, right: 8.0),
                      width: 120.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            casts[index].profilePath == null
                                ? Hero(
                                    tag: casts[index].id!,
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Style.Colors.secondColor,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.userAlt,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Hero(
                                    tag: casts[index].id!,
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://image.tmdb.org/t/p/w300/" +
                                                casts[index].profilePath!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(height: 10.0),
                            Text(
                              casts[index].name!,
                              maxLines: 2,
                              style: TextStyle(
                                  height: 1.4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9.0),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              casts[index].character!,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.4,
                                color: Style.Colors.titleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 7.0,
                              ),
                            ),
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
