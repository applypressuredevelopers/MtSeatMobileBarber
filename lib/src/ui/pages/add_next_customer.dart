import 'package:barber_app/src/ui/pages/check_out_page.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
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
                for (int i = 0; i < 4; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              i % 2 == 0 ? 'Men’s Fade' : 'Shave',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              'November 15th 2021, WAITING LIST , Client Name, \nBarber Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.blue, width: 1)),
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(2),
                              child: ClipRRect(
                                child: Image.asset(
                                  AppImages.whiteMan,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(120),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Text(
                              'John Doe',
                              style:
                                  TextStyle(color: Colors.white38, fontSize: 6),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2, bottom: 40),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                            fontStyle: FontStyle.italic,
                          ),
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Colors.white38,
                                fontStyle: FontStyle.italic),
                            hintText: 'Enter Code',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Colors.white38,
                              ),
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
                          Appnavigation().push(const AddNewCustomer(), context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            'Add Next Customer',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
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
              fit: BoxFit.fill,
              width: 18,
              height: 18,

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
