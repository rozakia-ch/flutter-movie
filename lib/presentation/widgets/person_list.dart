import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/logic/cubit/trending/trending_cubit.dart';
import 'package:flutter_movie_app/logic/models/trending/person.dart';
import 'package:flutter_movie_app/logic/models/trending/person_response.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_movie_app/presentation/widgets/person_loading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonList extends StatelessWidget {
  const PersonList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrending(),
      child: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          if (state is TrendingLoading) {
            return _buildLoadingWidget();
          } else if (state is TrendingLoaded) {
            return _buildHomeWidget(context, state.result);
          }
          return Container();
        },
      ),
    );
  }
}

Widget _buildLoadingWidget() {
  return PersonLoading();
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

Widget _buildHomeWidget(BuildContext context, PersonResponse data) {
  List<Person> persons = data.results;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
        child: Text(
          "TRENDING PERSONS ON THIS WEEK",
          style: TextStyle(
            color: Style.Colors.titleColor,
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
          ),
        ),
      ),
      SizedBox(height: 5.0),
      (persons.length == 0)
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
              height: 120.0,
              padding: EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 10.0, right: 8.0),
                    width: 100.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          persons[index].profilePath == null
                              ? Hero(
                                  tag: persons[index].id,
                                  child: Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
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
                                  tag: persons[index].id,
                                  child: Container(
                                    width: 70.0,
                                    height: 70.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w300/" +
                                              persons[index].profilePath,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(height: 10.0),
                          Text(
                            persons[index].name,
                            maxLines: 2,
                            style: TextStyle(
                              height: 1.4,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 9.0,
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            "Trending for " + persons[index].knownForDepartment,
                            maxLines: 2,
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
