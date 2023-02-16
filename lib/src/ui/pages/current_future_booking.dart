import 'package:barber_app/model/chekOutModel.dart';
import 'package:barber_app/src/ui/pages/jump_queue_page.dart';
import 'package:barber_app/src/ui/pages/map_page.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../widgets/bottom_sheet.dart';

class CurrentAndFutureBooking extends StatefulWidget {
  const CurrentAndFutureBooking({Key? key}) : super(key: key);

  @override
  _CurrentAndFutureBookingState createState() =>
      _CurrentAndFutureBookingState();
}

class _CurrentAndFutureBookingState extends State<CurrentAndFutureBooking> {
  int _currentPage = 0;

  final _auth =FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  List<CheckoutModel> bookings =[];
  Future<void> _getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore.collection('bookings').where("uid", isEqualTo: _auth.currentUser?.uid ).get();
    bookings = List.from(querySnapshot.docs.map((doc)=>CheckoutModel.fromSnapshot(doc),));
    setState((){
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: const CustomBottomSheet(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _currentPage = 0;
                      setState(() {});
                    },
                    child: Text(
                      'Bookings',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: _currentPage == 0
                              ? AppColors.yellowColors
                              : Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    height: 15,
                    width: 2,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      _currentPage = 1;
                      setState(() {});
                    },
                    child: Text(
                      'Queue',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: _currentPage == 1
                              ? AppColors.yellowColors
                              : Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                ],
              ),
              _currentPage == 0?
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for(int i = bookings.length-1; i >0 ; i --)
                            if(bookings[i].queue.toString() =="no" && bookings[i].note != "childElement")
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Appnavigation().push(const MapPage(), context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: AppColors.yellowColors,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          AppImages.barber,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bookings[i].shopName.toString(),
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w700, fontSize: 18),
                                                  ),
                                                  const Spacer(),
                                                  const SizedBox(width: 5),
                                                  Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext c) {
                                                                return Dialog(
                                                                  backgroundColor:
                                                                  Colors.transparent,
                                                                  child: Container(
                                                                    padding:
                                                                    const EdgeInsets.symmetric(
                                                                        horizontal: 25,
                                                                        vertical: 35),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            20),
                                                                        border: Border.all(
                                                                            color: Colors.white),
                                                                        color: Colors.black),
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                      MainAxisSize.min,
                                                                      children: [
                                                                        const Center(
                                                                          child: Text(
                                                                            'All Cancellations are subject to a 30% fee.',
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight:
                                                                                FontWeight.w400,
                                                                                fontSize: 14,
                                                                                fontStyle: FontStyle
                                                                                    .italic),
                                                                            textAlign:
                                                                            TextAlign.center,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height: 30,
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () {},
                                                                          child: const Padding(
                                                                            padding: EdgeInsets
                                                                                .symmetric(
                                                                              horizontal: 25,
                                                                            ),
                                                                            child: Text(
                                                                              'Confirm',
                                                                              style: TextStyle(
                                                                                  color:
                                                                                  Colors.white,
                                                                                  fontSize: 10,
                                                                                  fontStyle:
                                                                                  FontStyle
                                                                                      .italic),
                                                                            ),
                                                                          ),
                                                                          style:
                                                                          TextButton.styleFrom(
                                                                              shape:
                                                                              RoundedRectangleBorder(
                                                                                borderRadius:
                                                                                BorderRadius
                                                                                    .circular(
                                                                                    20),
                                                                              ),
                                                                              backgroundColor:
                                                                              AppColors
                                                                                  .yellowColors),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Image.asset(
                                                          AppImages.cross,
                                                          width: 24,
                                                          height: 24,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 2,
                                                      ),
                                                      const Text(
                                                        'Cancel',
                                                        style: TextStyle(fontSize: 7),
                                                      ),
                                                    ],
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${bookings[i].month}-${bookings[i].day}-${bookings[i].year}',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontStyle: FontStyle.italic,
                                                        fontSize: 11,
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                  const Spacer(),
                                                  //  GestureDetector(
                                                  //   child: Container(
                                                  //     padding: const EdgeInsets.symmetric(
                                                  //         horizontal: 5, vertical: 2),
                                                  //     child: Text(
                                                  //       'Jump Queue',
                                                  //       style: TextStyle(
                                                  //           fontStyle: FontStyle.italic,
                                                  //           fontSize: 9,
                                                  //           color: AppColors.yellowColors,
                                                  //           fontWeight: FontWeight.w400),
                                                  //     ),
                                                  //     decoration: BoxDecoration(
                                                  //         borderRadius:
                                                  //         BorderRadius.circular(8),
                                                  //         color: Colors.black),
                                                  //   ),
                                                  //   onTap: () {
                                                  //     Appnavigation()
                                                  //         .push(const JumpQueue(), context);
                                                  //   },
                                                  // )

                                                ],
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                children:  [
                                                  Text(
                                                    '${bookings[i].style} ',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 11,
                                                        fontStyle: FontStyle.italic),
                                                  ),
                                                  // Text(
                                                  //   'At Home',
                                                  //   overflow: TextOverflow.ellipsis,
                                                  //   style: TextStyle(
                                                  //       fontSize: 11,
                                                  //       color: Colors.white,
                                                  //       fontStyle: FontStyle.italic),
                                                  // ),
                                                ],
                                              ),
                                              Row(
                                                children:  [
                                                  Text(
                                                    '${bookings[i].slot}',
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 11, fontStyle: FontStyle.italic),
                                                  ),
                                                  /* Text(
                                'Time Left  01:08:20',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )*/
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),

                        ],
                      ),
                    ),
                  )
                  // ? _buildList(itemCount: bookings.length, isQueue: false)


                  :    Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int i = bookings.length-1; i >= 0 ; i --)
                        if(bookings[i].queue.toString() =="yes" && bookings[i].note != "childElement")
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Appnavigation().push(const MapPage(), context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.yellowColors,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        AppImages.barber,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  bookings[i].shopName.toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w700, fontSize: 18),
                                                ),
                                                const Spacer(),
                                                const SizedBox(width: 5),
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (BuildContext c) {
                                                              return Dialog(
                                                                backgroundColor:
                                                                Colors.transparent,
                                                                child: Container(
                                                                  padding:
                                                                  const EdgeInsets.symmetric(
                                                                      horizontal: 25,
                                                                      vertical: 35),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          20),
                                                                      border: Border.all(
                                                                          color: Colors.white),
                                                                      color: Colors.black),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize.min,
                                                                    children: [
                                                                      const Center(
                                                                        child: Text(
                                                                          'All Cancellations are subject to a 30% fee.',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight:
                                                                              FontWeight.w400,
                                                                              fontSize: 14,
                                                                              fontStyle: FontStyle
                                                                                  .italic),
                                                                          textAlign:
                                                                          TextAlign.center,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height: 30,
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () {},
                                                                        child: const Padding(
                                                                          padding: EdgeInsets
                                                                              .symmetric(
                                                                            horizontal: 25,
                                                                          ),
                                                                          child: Text(
                                                                            'Confirm',
                                                                            style: TextStyle(
                                                                                color:
                                                                                Colors.white,
                                                                                fontSize: 10,
                                                                                fontStyle:
                                                                                FontStyle
                                                                                    .italic),
                                                                          ),
                                                                        ),
                                                                        style:
                                                                        TextButton.styleFrom(
                                                                            shape:
                                                                            RoundedRectangleBorder(
                                                                              borderRadius:
                                                                              BorderRadius
                                                                                  .circular(
                                                                                  20),
                                                                            ),
                                                                            backgroundColor:
                                                                            AppColors
                                                                                .yellowColors),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Image.asset(
                                                        AppImages.cross,
                                                        width: 24,
                                                        height: 24,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    const Text(
                                                      'Cancel',
                                                      style: TextStyle(fontSize: 7),
                                                    ),
                                                  ],
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${bookings[i].month}-${bookings[i].day}-${bookings[i].year}',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontStyle: FontStyle.italic,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                                const Spacer(),
                                                //  GestureDetector(
                                                //   child: Container(
                                                //     padding: const EdgeInsets.symmetric(
                                                //         horizontal: 5, vertical: 2),
                                                //     child: Text(
                                                //       'Jump Queue',
                                                //       style: TextStyle(
                                                //           fontStyle: FontStyle.italic,
                                                //           fontSize: 9,
                                                //           color: AppColors.yellowColors,
                                                //           fontWeight: FontWeight.w400),
                                                //     ),
                                                //     decoration: BoxDecoration(
                                                //         borderRadius:
                                                //         BorderRadius.circular(8),
                                                //         color: Colors.black),
                                                //   ),
                                                //   onTap: () {
                                                //     Appnavigation()
                                                //         .push(const JumpQueue(), context);
                                                //   },
                                                // )

                                              ],
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              children:  [
                                                Text(
                                                  '${bookings[i].style.toString()} ',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 11,
                                                      fontStyle: FontStyle.italic),
                                                ),
                                                // Text(
                                                //   'At Home',
                                                //   overflow: TextOverflow.ellipsis,
                                                //   style: TextStyle(
                                                //       fontSize: 11,
                                                //       color: Colors.white,
                                                //       fontStyle: FontStyle.italic),
                                                // ),
                                              ],
                                            ),
                                            Row(
                                              children:  [
                                                Text(
                                                  bookings[i].slot.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 11, fontStyle: FontStyle.italic),
                                                ),
                                                /* Text(
                                'Time Left  01:08:20',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )*/
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),

                    ],
                  ),
                ),
              ),
            ],
          )
              // ),
              ),
        ));
  }

  Widget _buildList({required int itemCount, required bool isQueue}) {
    return Expanded(
        child: ListView.separated(
            // padding: const EdgeInsets.all(20),
            itemBuilder: (context, i) {

              return
                  _currentPage ==0 && bookings[i].queue.toString() =="no" && bookings[i].note.toString() !="childElement"?
                  GestureDetector(
                    onTap: () {
                      Appnavigation().push(const MapPage(), context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.yellowColors,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.barber,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bookings[i].shopName.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700, fontSize: 18),
                                      ),
                                      const Spacer(),
                                      // Image.asset(
                                      //   AppImages.subtract,
                                      //   width: 20,
                                      //   height: 20,
                                      // ),

                                      // Column(
                                      //   children: [
                                      //     Image.asset(
                                      //       AppImages.subtract,
                                      //       width: 20,
                                      //       height: 20,
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 2,
                                      //     ),
                                      //     const Text(
                                      //       'No-Show',
                                      //       style: TextStyle(fontSize: 7),
                                      //     ),
                                      //   ],
                                      //   mainAxisAlignment: MainAxisAlignment.center,
                                      // ),
                                      const SizedBox(width: 5),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext c) {
                                                    return Dialog(
                                                      backgroundColor:
                                                      Colors.transparent,
                                                      child: Container(
                                                        padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 25,
                                                            vertical: 35),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                            border: Border.all(
                                                                color: Colors.white),
                                                            color: Colors.black),
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          children: [
                                                            const Center(
                                                              child: Text(
                                                                'All Cancellations are subject to a 30% fee.',
                                                                style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontWeight:
                                                                    FontWeight.w400,
                                                                    fontSize: 14,
                                                                    fontStyle: FontStyle
                                                                        .italic),
                                                                textAlign:
                                                                TextAlign.center,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 30,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: const Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal: 25,
                                                                ),
                                                                child: Text(
                                                                  'Confirm',
                                                                  style: TextStyle(
                                                                      color:
                                                                      Colors.white,
                                                                      fontSize: 10,
                                                                      fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                                ),
                                                              ),
                                                              style:
                                                              TextButton.styleFrom(
                                                                  shape:
                                                                  RoundedRectangleBorder(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        20),
                                                                  ),
                                                                  backgroundColor:
                                                                  AppColors
                                                                      .yellowColors),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                              AppImages.cross,
                                              width: 24,
                                              height: 24,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          const Text(
                                            'Cancel',
                                            style: TextStyle(fontSize: 7),
                                          ),
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${bookings[i].month}-${bookings[i].day}-${bookings[i].year}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(),
                                      isQueue == true
                                          ? GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 2),
                                          child: Text(
                                            'Jump Queue',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 9,
                                                color: AppColors.yellowColors,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: Colors.black),
                                        ),
                                        onTap: () {
                                          Appnavigation()
                                              .push(const JumpQueue(), context);
                                        },
                                      )
                                          : const SizedBox()
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children:  [
                                      Text(
                                        '${bookings[i].style} ',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      // Text(
                                      //   'At Home',
                                      //   overflow: TextOverflow.ellipsis,
                                      //   style: TextStyle(
                                      //       fontSize: 11,
                                      //       color: Colors.white,
                                      //       fontStyle: FontStyle.italic),
                                      // ),
                                    ],
                                  ),
                                  Row(
                                    children:  [
                                      Text(
                                        '${bookings[i].slot}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 11, fontStyle: FontStyle.italic),
                                      ),
                                      /* Text(
                              'Time Left  01:08:20',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                            )*/
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ):
                  Container();
            },
            separatorBuilder: (context, j) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: itemCount));
  }

  Widget _buildListQueue({required int itemCount, required bool isQueue}) {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, i) {

              return
                bookings[i].note.toString() =="childElement" ?
                Container()
                    :
                    bookings[i].queue.toString() =="yes"?
                GestureDetector(
                  onTap: () {
                    Appnavigation().push(const MapPage(), context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.yellowColors,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AppImages.barber,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bookings[i].shopName.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700, fontSize: 18),
                                    ),
                                    const Spacer(),
                                    // Image.asset(
                                    //   AppImages.subtract,
                                    //   width: 20,
                                    //   height: 20,
                                    // ),

                                    // Column(
                                    //   children: [
                                    //     Image.asset(
                                    //       AppImages.subtract,
                                    //       width: 20,
                                    //       height: 20,
                                    //     ),
                                    //     const SizedBox(
                                    //       height: 2,
                                    //     ),
                                    //     const Text(
                                    //       'No-Show',
                                    //       style: TextStyle(fontSize: 7),
                                    //     ),
                                    //   ],
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    // ),
                                    const SizedBox(width: 5),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext c) {
                                                  return Dialog(
                                                    backgroundColor:
                                                    Colors.transparent,
                                                    child: Container(
                                                      padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 25,
                                                          vertical: 35),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                          border: Border.all(
                                                              color: Colors.white),
                                                          color: Colors.black),
                                                      child: Column(
                                                        mainAxisSize:
                                                        MainAxisSize.min,
                                                        children: [
                                                          const Center(
                                                            child: Text(
                                                              'All Cancellations are subject to a 30% fee.',
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight:
                                                                  FontWeight.w400,
                                                                  fontSize: 14,
                                                                  fontStyle: FontStyle
                                                                      .italic),
                                                              textAlign:
                                                              TextAlign.center,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 30,
                                                          ),
                                                          TextButton(
                                                            onPressed: () {},
                                                            child: const Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 25,
                                                              ),
                                                              child: Text(
                                                                'Confirm',
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.white,
                                                                    fontSize: 10,
                                                                    fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                              ),
                                                            ),
                                                            style:
                                                            TextButton.styleFrom(
                                                                shape:
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      20),
                                                                ),
                                                                backgroundColor:
                                                                AppColors
                                                                    .yellowColors),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Image.asset(
                                            AppImages.cross,
                                            width: 24,
                                            height: 24,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                          'Cancel',
                                          style: TextStyle(fontSize: 7),
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${bookings[i].month}-${bookings[i].day}-${bookings[i].year}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                    isQueue == true
                                        ? GestureDetector(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 2),
                                        child: Text(
                                          'Jump Queue',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 9,
                                              color: AppColors.yellowColors,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            color: Colors.black),
                                      ),
                                      onTap: () {
                                        Appnavigation()
                                            .push(const JumpQueue(), context);
                                      },
                                    )
                                        : const SizedBox()
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children:  [
                                    Text(
                                      '${bookings[i].style} ',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    // Text(
                                    //   'At Home',
                                    //   overflow: TextOverflow.ellipsis,
                                    //   style: TextStyle(
                                    //       fontSize: 11,
                                    //       color: Colors.white,
                                    //       fontStyle: FontStyle.italic),
                                    // ),
                                  ],
                                ),
                                Row(
                                  children:  [
                                    Text(
                                      '${bookings[i].slot}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 11, fontStyle: FontStyle.italic),
                                    ),
                                    /* Text(
                                'Time Left  01:08:20',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )*/
                                  ],
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ): Container();
            },
            separatorBuilder: (context, j) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: itemCount));
  }

  Widget _buildProfileTop() {
    return Padding(
      padding: const EdgeInsets.all(20),
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
            'Current & Future Bookings',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const Spacer(),
          Image.asset(
            AppImages.cart,
            color: Colors.transparent,
            fit: BoxFit.cover,
            width: 10,
            height: 10,
          ),
        ],
      ),
    );
  }
}
