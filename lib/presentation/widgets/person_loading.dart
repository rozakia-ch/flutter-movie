import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;
import 'package:flutter_movie_app/presentation/widgets/shimmer_effect.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonLoading extends StatelessWidget {
  const PersonLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: ShimmerEffect(
            child: Container(
              width: 100,
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
}
