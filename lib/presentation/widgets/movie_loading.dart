import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/widgets/shimmer_effect.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieLoading extends StatelessWidget {
  const MovieLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerEffect(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: Container(
              color: Style.Colors.titleColor,
              width: 90,
              height: 10,
            ),
          ),
        ),
        Container(
          height: 270.0,
          padding: EdgeInsets.only(left: 10.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffect(
                      child: Container(
                        width: 120.0,
                        height: 180.0,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          shape: BoxShape.rectangle,
                          color: Style.Colors.titleColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ShimmerEffect(
                      child: Container(
                        width: 100,
                        color: Style.Colors.titleColor,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ShimmerEffect(
                          child: Container(
                            color: Style.Colors.titleColor,
                            width: 10,
                            height: 10,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        ShimmerEffect(
                          child: RatingBarIndicator(
                            itemSize: 8.0,
                            rating: 10 / 2,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              EvaIcons.star,
                              color: Style.Colors.ratingColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
