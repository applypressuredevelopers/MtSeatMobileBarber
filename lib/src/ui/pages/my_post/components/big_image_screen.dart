import 'package:flutter/material.dart';

import '../../../../utils/images.dart';


class BigImageScreen extends StatelessWidget {
  const BigImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Hero(
        tag: 'bigImage',
        child: Center(
          child: SizedBox(
            height: height * 0.5,
            width: width,
            child: Image.asset(AppImages.girlBigImageOne,
            fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class BigImageOneScreen extends StatelessWidget {
  const BigImageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Hero(
        tag: 'bigImageOne',
        child: Center(
          child: SizedBox(
            height: height * 0.5,
            width: width,
            child: Image.asset(AppImages.girlBigImageTwo,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

class BigImageTwoScreen extends StatelessWidget {
  const BigImageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Hero(
        tag: 'bigImageTwo',
        child: Center(
          child: SizedBox(
            height: height * 0.5,
            width: width,
            child: Image.asset(AppImages.girlBigImageThree,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
