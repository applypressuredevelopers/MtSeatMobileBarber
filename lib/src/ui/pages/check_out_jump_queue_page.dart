import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';

class CheckOutJumpQueuePage extends StatefulWidget {
  const CheckOutJumpQueuePage({Key? key}) : super(key: key);

  @override
  _CheckOutJumpQueuePageState createState() => _CheckOutJumpQueuePageState();
}

class _CheckOutJumpQueuePageState extends State<CheckOutJumpQueuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.backGround),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          _buildProfileTop(),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25,right: 90),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                text: 'Men’s Fade',
                                children: [
                                  TextSpan(
                                    text: ' - Queue Jump',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: AppColors.yellowColors),
                                  )
                                ],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                              const SizedBox(
                                height: 3,
                              ),
                              i % 2 == 0
                                  ? const Text(
                                      'January 30th 2022, 16:45 - 17:00, Client Name, Barber Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                      text: 'January 30th 2022, 22:30 - 22:45,  ',
                                      children: [
                                        TextSpan(
                                          text: 'Other Client Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                              color: AppColors.yellowColors),
                                        )
                                        ,const TextSpan(
                                          text: ' Barber Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white),
                                        )
                                      ],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),
                                    )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 100, bottom: 40),
                  child: Row(
                    children: [
                      const Text(
                        'Promo Code',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic),
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Colors.white38,
                                fontStyle: FontStyle.italic),
                            hintText: 'Enter Code',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                          child: Text(
                            'Claim',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white70),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.yellowColors),
                      )
                    ],
                  ),
                ),
                _buildPayment(text: 'Subtotal'),
                _buildPayment(text: 'Discount'),
                _buildPayment(text: 'Booking Fee'),
                _buildPayment(text: 'Total', fontWeight: FontWeight.bold),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 70, bottom: 5, top: 40, right: 70),
                    child: Center(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.yellowColors,
                        ),
                        onPressed: () {
                          // Appnavigation()
                          //     .push(const CurrentAndFutureBooking(), context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            'Checkout Now ',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    )))
              ],
            ),
          ))
        ],
      )
          // ),
          ),
    ));
  }

  Widget _buildPayment({required String text, FontWeight? fontWeight}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.w700,
                color: Colors.white,
                fontSize: 14),
          )),
          const SizedBox(
            width: 100,
          ),
          Expanded(
              child: Text(
            'XX',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.w700,
                color: Colors.white,
                fontSize: 14),
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Widget _buildProfileTop() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              AppImages.backArrow,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Appnavigation().pop(context);
            },
          ),
          const Spacer(),
          const Text(
            'Check Out',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Image.asset(
            AppImages.bell,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

 }
