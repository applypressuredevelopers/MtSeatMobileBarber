import 'package:flutter/material.dart';

class WeirdBorder extends CustomClipper<Path> {
  late final double cornerR;
  @override
  Path getClip(Size size) => Path()
    ..lineTo(size.width, 0)
    ..lineTo(
      size.width,
      size.height - cornerR,
    )
    ..arcToPoint(
      Offset(
        size.width - cornerR,
        size.height,
      ),
      radius: Radius.circular(cornerR),
      clockwise: false,
    )
    ..lineTo(0, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
 
}