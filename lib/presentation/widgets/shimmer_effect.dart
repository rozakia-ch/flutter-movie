import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_movie_app/presentation/style/style.dart' as Style;

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key key, this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [Style.Colors.titleColor, Colors.white54, Style.Colors.titleColor],
        stops: [0.45, 0.50, 0.55],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      child: child,
    );
  }
}
