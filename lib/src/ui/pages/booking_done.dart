import 'package:barber_app/src/ui/pages/check_in.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/const.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/drop_down.dart';

class BookingDonePage extends StatefulWidget {
  const BookingDonePage({Key? key}) : super(key: key);

  @override
  _BookingDonePageState createState() => _BookingDonePageState();
}

class _BookingDonePageState extends State<BookingDonePage> {
  int customerName = 1;
  String? question1;
  String? question2;
  String? question3;
  String? question4;
  String? question5;
  List<String> questionList = <String>[
    "Check-In",
    "Reviews",
    "Portfolio",
    "Detail",
  ];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const CustomBottomSheet(),
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
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(top: 90),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backMap),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          padding:
              const EdgeInsets.only(bottom: 50, top: 10, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AppImages.shop,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          height: 120),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AppImages.shop1,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          height: 120),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AppImages.shop2,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          height: 120),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(AppImages.shop3,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                          height: 120),
                    ),
                  ],
                ),
              ),
              // TabBarView(children: [],physics: ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: DropDownWidget(
                  hint: 'Detail',
                  onChanged: (_) {
                    question1 = _;
                    question1 == 'Check-In'
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CheckInPage()))
                        : null;
                  },
                  list: questionList,
                  select: question1,
                ),
              ),

              const Text(
                'About US',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                lorem.substring(0, 300),
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'Find Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '27 Change Drive, W2C WYT'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_pin,
                    color: AppColors.yellowColors,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Availability',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildExpansionTile(day: 'Monday', isTrue: true),
              _buildExpansionTile(day: 'Tuesday'),
              _buildExpansionTile(day: 'Wednesday'),
              _buildExpansionTile(day: 'Thursday'),
              _buildExpansionTile(day: 'Friday'),
              _buildExpansionTile(day: 'Saturday'),
              _buildExpansionTile(day: 'Sunday'),
              _buildExpansionTile(day: 'View All', viewAll: true),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     _buildColumn(head: 'Monday', istrue: true),
              //     _buildColumn(),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Padding(
              //             padding: const EdgeInsets.only(left: 20),
              //             child: Container(
              //               width: 40,
              //               child: Icon(
              //                 Icons.arrow_drop_down,
              //                 color: AppColors.yellowColors,
              //                 size: 40,
              //               ),
              //             )),
              //         Container(
              //           margin:
              //               const EdgeInsets.only(left: 20, top: 5, bottom: 5),
              //           height: 80,
              //           width: 80,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(120),
              //             border: Border.all(width: 2, color: Colors.green),
              //           ),
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(120),
              //             child: Image.asset(
              //               AppImages.whiteMan,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //         const Text(
              //           'John Doe',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 16),
              //         ),
              //         const SizedBox(
              //           height: 3,
              //         ),
              //         const Text(
              //           '10am - 8pm ',
              //           textAlign: TextAlign.center,
              //           style: TextStyle(color: Colors.white, fontSize: 10),
              //         ),
              //         const SizedBox(
              //           height: 10,
              //         ),
              //         TextButton(
              //           style: TextButton.styleFrom(
              //               backgroundColor: AppColors.yellowColors,
              //               shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(30))),
              //           onPressed: () {},
              //           child: const Padding(
              //             padding:
              //                 EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //             child: Text(
              //               ' View Info',
              //               style: TextStyle(color: Colors.black, fontSize: 16),
              //             ),
              //           ),
              //         ),
              //         _buildArrowUp(),
              //         _buildArrowUp(),
              //         _buildArrowUp(),
              //         _buildArrowUp(),
              //         _buildArrowUp(),
              //         _buildArrowUp(),
              //       ],
              //     )
              //   ],
              // ),
              showBottom
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.yellowColors)),
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.loose,
                        children: [
                          Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Henry',
                                        style: TextStyle(
                                          color: AppColors.yellowColors,
                                          fontSize: 22,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Row(
                                          children: [
Text('Portfolio of Work',style: TextStyle(color: Colors.white,fontSize: 10),),                                            Icon(
                                              isShow
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down,
                                              color: Colors.white,
                                   size: 35,     ),
                                          ],
                                        ),
                                        onTap: () {
                                          scrollController.animateTo(1000,
                                              duration: const Duration(
                                                  milliseconds: 700),
                                              curve: Curves.easeIn);

                                          isShow = !isShow;
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(left: 90, top: 3),
                                child: Text(
                                  '10:00 am - 8:00 pm',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 90, top: 10),
                                child: Text(
                                  lorem.substring(0, 80),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.instagram,
                                    color: AppColors.yellowColors,
                                    height: 15,
                                    width: 15,
                                  ),
                                  Text(
                                    "@Henycutz",
                                    style: TextStyle(
                                        color: AppColors.yellowColors,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    AppImages.twitter,
                                    color: AppColors.yellowColors,
                                    height: 15,
                                    width: 15,
                                  ),
                                  Text(
                                    "@Henycutz",
                                    style: TextStyle(
                                        color: AppColors.yellowColors,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: AppColors.yellowColors,
                                      size: 16,
                                    ),
                                    Text(
                                      "@Henycutz",
                                      style: TextStyle(
                                          color: AppColors.yellowColors,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 90, top: 10),
                                child: RichText(
                                  text: TextSpan(
                                      text: ' Bookings From',
                                      children: const [
                                        TextSpan(
                                            text: ' 10:00 am to 7:00 pm',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                      style: TextStyle(
                                          color: AppColors.yellowColors)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  _buildButtonContinue(text: 'Book Today'),
                                  _buildButtonContinue(
                                      text: 'Join Now', color: Colors.green),
                                  // _buildButtonContinue(
                                  //     text: 'Advanced Booking'),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              isShow
                                  ? TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext c) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 60),
                                                child: Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: GridView.builder(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
//                                        scrollDirection: Axis.horizontal,
                                                    itemBuilder: (c, i) {
                                                      return GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return Dialog(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      child: Image
                                                                          .asset(
                                                                        i % 2 ==
                                                                                0
                                                                            ? AppImages.hairWash
                                                                            : AppImages.hairColor,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Image.asset(
                                                              i % 2 == 0
                                                                  ? AppImages
                                                                      .hairWash
                                                                  : AppImages
                                                                      .hairColor,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ));
                                                    },
                                                    itemCount: 220,

                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 9,
                                                      crossAxisSpacing: 9,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          'View All',
                                          style: TextStyle(
                                              color: AppColors.yellowColors),
                                        ),
                                      ))
                                  : const SizedBox(),
                              isShow
                                  ?
                                  // SizedBox(
                                  //         height: 200,
                                  //         child: ListView.separated(
                                  //           scrollDirection: Axis.horizontal,
                                  //           itemBuilder: (c, i) {
                                  //             return GestureDetector(
                                  //                 onTap: () {
                                  //                   showDialog(
                                  //                       context: context,
                                  //                       builder:
                                  //                           (BuildContext context) {
                                  //                         return Dialog(
                                  //                           child: ClipRRect(
                                  //                             borderRadius:
                                  //                                 BorderRadius
                                  //                                     .circular(8),
                                  //                             child: Image.asset(
                                  //                               i % 2 == 0
                                  //                                   ? AppImages
                                  //                                       .hairWash
                                  //                                   : AppImages
                                  //                                       .hairColor,
                                  //                               fit: BoxFit.cover,
                                  //                             ),
                                  //                           ),
                                  //                         );
                                  //                       });
                                  //                 },
                                  //                 child: ClipRRect(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(8),
                                  //                   child: Image.asset(
                                  //                     i % 2 == 0
                                  //                         ? AppImages.hairWash
                                  //                         : AppImages.hairColor,
                                  //                     fit: BoxFit.cover,
                                  //                   ),
                                  //                 ));
                                  //           },
                                  //           itemCount: 20,
                                  //           separatorBuilder:
                                  //               (BuildContext context, int index) {
                                  //             return const SizedBox(
                                  //               width: 30,
                                  //             );
                                  //           },
                                  //         ),
                                  //       )
                                  SizedBox(
                                      height: 250,
                                      child: GridView.builder(
                                        padding: EdgeInsets.zero,
//                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (c, i) {
                                          return GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Dialog(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.asset(
                                                            i % 2 == 0
                                                                ? AppImages
                                                                    .hairWash
                                                                : AppImages
                                                                    .hairColor,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  i % 2 == 0
                                                      ? AppImages.hairWash
                                                      : AppImages.hairColor,
                                                  fit: BoxFit.cover,
                                                ),
                                              ));
                                        },
                                        itemCount: 20,

                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 7,
                                          crossAxisSpacing: 7,
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          Positioned(
                              top: -40,
                              left: -11,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(140),
                                  child: Image.asset(
                                    AppImages.whiteMan,
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.yellowColors,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(140)),
                              ))
                        ],
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: [
                  Expanded(
                    child: _buildButtonContinue(
                      text: 'Cancellation Policy ',
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: _buildButtonContinue(
                      text: '@HenryCuts',
                    ),
                  ),
                ],
              ),
              _buildButtonContinue(
                text: 'henrycutz1216@gmail.com',
              ),
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

  bool isShow = false;
  bool showBottom = false;

  Widget _buildExpansionTile(
      {required String day, bool? isTrue, bool? viewAll}) {
    return ListTileTheme(
      dense: true,
      minVerticalPadding: 0.0,
      horizontalTitleGap: 0.0,
      minLeadingWidth: 0,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        initiallyExpanded: isTrue ?? false,
        tilePadding: EdgeInsets.zero,
        iconColor: Colors.white,
        collapsedIconColor: AppColors.yellowColors,
        title: Text(
          day,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          viewAll == true
              ? SizedBox(
                  height: 160,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (customerName, i) {
                        return _buildColumn();
                      },
                      separatorBuilder: (c, i) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 40),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildColumn(),
                    _buildColumn(),
                    _buildColumn(),
                  ],
                )
        ],
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            border: Border.all(width: 2, color: Colors.green),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              AppImages.whiteMan,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'John Doe',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(
          height: 3,
        ),
        const Text(
          '10am - 8pm ',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
        const SizedBox(
          height: 2,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.yellowColors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            showBottom = !showBottom;
            setState(() {});
            if (showBottom == true) {
              scrollController.animateTo(600,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Text(
              'View Info',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ),
        // istrue == true
        //     ? Column(
        //         children: [
        //           _buildDays(dayName: 'Tuesday'),
        //           _buildDays(dayName: 'Wednesday'),
        //           _buildDays(dayName: 'Thursday'),
        //           _buildDays(dayName: 'Friday'),
        //           _buildDays(dayName: 'Saturday'),
        //           _buildDays(dayName: 'Sunday'),
        //         ],
        //       )
        //     : const SizedBox()
      ],
    );
  }

  Widget _buildButtonContinue({required String text, Color? color}) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: color ?? AppColors.yellowColors,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    );
  }


  Widget _buildCartAndBell(
      {required String url, required BuildContext context}) {
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
}
