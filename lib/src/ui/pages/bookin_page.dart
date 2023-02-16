import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/const.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../widgets/bottom_sheet.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustomBottomSheet(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.yellowColors,
        ),
        title: const Text(
          "Henry's Cut",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _buildCartAndBell(url: AppImages.bell, context: context),
          _buildCartAndBell(url: AppImages.cart, context: context),
        ],
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(top: 90),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGround),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    AppImages.saloon,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(text: 'Button'),
                  const SizedBox(
                    width: 20,
                  ),
                  _buildButton(text: 'Button'),
                ],
              ),
              _buildHorizontalList(),
              Divider(
                height: 0,
                thickness: 10,
                color: AppColors.yellowColors,
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(25),
                child: Text(
                  lorem,
                  style: TextStyle(color: AppColors.yellowColors),
                ),
              ),
              Divider(
                height: 0,
                thickness: 10,
                color: AppColors.yellowColors,
              ),
              const SizedBox(
                height: 15,
              ),
              // Center(
              //   child: TextButton(
              //     style: TextButton.styleFrom(
              //         backgroundColor: AppColors.yellowColors),
              //     onPressed: () {
              //
              //     },
              //     child: const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
              //       child: Text(
              //         'Continue',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

  Widget _buildCartAndBell({
    required String url,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: GestureDetector(
        child: Image.asset(url),
        onTap: () {},
      ),
    );
  }

  Widget _buildButton({
    required String text,
  }) {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(
              color: AppColors.yellowColors,
            )),
      ),
      onPressed: () {},
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 120,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return Column(
              children: [
                GestureDetector(
                  // onTap: () {
                  //   showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return const CustomDialog();
                  //       });
                  // },
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppImages.whiteMan,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(120),
                        border: Border.all(
                            width: 2, color: AppColors.yellowColors)),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Text(
                    'Henry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            );
          },
          separatorBuilder: (c, i) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: 30),
    );
  }
}
