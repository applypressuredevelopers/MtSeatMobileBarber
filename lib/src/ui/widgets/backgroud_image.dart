import 'package:flutter/material.dart';

import '../../utils/images.dart';


class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
       // color: AppColors.blackColor.withOpacity(0.7),
        image: DecorationImage(
          image: AssetImage(AppImages.backImage),
          fit: BoxFit.fill,
        )
      ),
      child: child,
    );
  }
}
