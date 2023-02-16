import 'package:barber_app/src/ui/pages/booking_done.dart';
import 'package:barber_app/src/ui/pages/check_in.dart';
import 'package:barber_app/src/ui/widgets/drop_down.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../widgets/bottom_sheet.dart';
import 'add_next_customer.dart';
import 'make_booking.dart';

class AddAnotherServiceProvider extends StatefulWidget {
  const AddAnotherServiceProvider({Key? key}) : super(key: key);

  @override
  _AddAnotherServiceProviderState createState() =>
      _AddAnotherServiceProviderState();
}

class _AddAnotherServiceProviderState extends State<AddAnotherServiceProvider> {
  var _page = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  Color color = AppColors.yellowColors;
  int selected = -1;

  bool isTrue = true;
  bool isTrue1 = true;
  bool isTrue2 = true;
  bool isTrue3 = true;
  bool isTrue4 = true;
  bool isTrue5 = true;
  bool isTrue6 = true;
  bool isTrue7 = true;
  bool isTrue8 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        // bottomNavigationBar: CustomBottomSheet(),
        // appBar: AppBar(
        //   iconTheme: IconThemeData(
        //     color: AppColors.yellowColors,
        //   ),
        //   title: const Text(
        //     "Make A Booking",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     _buildCartAndBell(url: AppImages.bell, context: context),
        //     _buildCartAndBell(url: AppImages.cart, context: context),
        //   ],
        // ),
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backGround),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Selected Service Provider',
                            style: TextStyle(
                              color: AppColors.yellowColors,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          AppImages.whiteMan,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Henry',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          color: AppColors.yellowColors,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: _page == 0
                                    ? Colors.black
                                    : AppColors.yellowColors,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: const Text(
                                'All',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _page = 0;
                                pageController.animateToPage(
                                  0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn,
                                );
                                setState(() {});
                              },
                            )),
                            Expanded(
                                child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: _page == 1
                                    ? Colors.black
                                    : AppColors.yellowColors,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: const Text(
                                'Category 1',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _page = 1;
                                pageController.animateToPage(1,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn);
                                setState(() {});
                              },
                            )),
                            Expanded(
                                child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: _page == 2
                                    ? Colors.black
                                    : AppColors.yellowColors,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: const Text(
                                'Category 2',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _page = 2;
                                pageController.animateToPage(2,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn);
                                setState(() {});
                              },
                            )),
                            Expanded(
                                child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: _page == 3
                                    ? Colors.black
                                    : AppColors.yellowColors,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                              ),
                              child: const Text(
                                'Category 3',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _page = 3;
                                pageController.animateToPage(3,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn);
                                setState(() {});
                              },
                            )),
                            // Expanded(
                            //     child: TextButton(
                            //   style: TextButton.styleFrom(
                            //       backgroundColor: _page == 4
                            //           ? Colors.black
                            //           : AppColors.yellowColors,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(120))),
                            //   child: const Text(
                            //     'Category 4',
                            //     style: TextStyle(
                            //       fontSize: 10,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            //   onPressed: () {
                            //     _page = 4;
                            //
                            //     pageController.animateToPage(4,
                            //         duration: const Duration(seconds: 1),
                            //         curve: Curves.easeIn);
                            //     setState(() {});
                            //   },
                            // )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            children: [
                              _buildAllCategoriesScrollPage(category: 'All'),
                              _buildScrollPage(category: '1'),
                              _buildScrollPage(category: '2'),
                              _buildScrollPage(category: '3'),
                            ],
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildHorizontalListView(),
              Padding(
                padding: const EdgeInsets.only(left: 90, right: 90, top: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const BookingDonePage(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.yellowColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ))
                  ],
                ),
              ),

              // Expanded(
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(
              //           12,
              //         ),
              //         border: Border.all(color: Colors.white),
              //         color: Colors.black),
              //     child: SingleChildScrollView(
              //       padding: const EdgeInsets.all(20),
              //       child:
              //       Column(crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           _buildExpansionTile(
              //             title: 'Top Level Cat. 2',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Facil Hair Cut',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Top Level Cat. 1',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Top Level Cat. 2',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Top Level Cat. 3',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Top Level Cat. 4',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Spcial Service',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Hair Cuts',
              //           ),
              //           _buildExpansionTile(
              //             title: 'Hair Cuts',
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Text(
              //   'Select Another Barber',
              //   style: TextStyle(color: AppColors.yellowColors, fontSize: 18),
              // ),
              // SizedBox(
              //   height: 20,
              // ),

              // SizedBox(
              //   height: 130,
              //   child: ListView.separated(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (c, i) {
              //         return _buildColorContainer();
              //       },
              //       separatorBuilder: (context, i) {
              //         return SizedBox(
              //           width: 30,
              //         );
              //       },
              //       itemCount: 6),
              // ),
            ],
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     TextButton(
          //       onPressed: () {},
          //       child: Row(
          //         children: [
          //           const Icon(
          //             Icons.add,
          //             color: Colors.white,
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           Text(
          //             'Selected Service Provider',
          //             style: TextStyle(
          //                 color: AppColors.yellowColors, fontSize: 18),
          //           )
          //         ],
          //       ),
          //     ),
          //     Column(
          //       children: [
          //         Container(
          //           margin: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
          //           height: 50,
          //           width: 50,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(120),
          //             border: Border.all(width: 2, color: Colors.green),
          //           ),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(120),
          //             child: Image.asset(
          //               AppImages.girl,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //         const Text(
          //           'Nanny',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(color: Colors.white),
          //         )
          //       ],
          //     ),
          //     Container(
          //       margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //       decoration: BoxDecoration(
          //           color: Colors.black,
          //           border: Border.all(
          //             color: Colors.white,
          //           ),
          //           borderRadius: BorderRadius.circular(12)),
          //       padding: const EdgeInsets.all(20),
          //       height: 300,
          //       child: ListView.builder(itemBuilder: (c, i) {
          //         return _buildCon(onTap: () {});
          //       }),
          //     ),
          //     const Spacer(),
          //     _buildHorizontalListView(),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     _buildButtonContinue(
          //       text: 'Continue',
          //       onTap: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const BookingDonePage()));
          //       },
          //     ),
          //   ],
          // ),

          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  Widget _buildHorizontalListView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            width: 2,
            color: AppColors.yellowColors,
          ),
          bottom: BorderSide(
            width: 2,
            color: AppColors.yellowColors,
          ),
        ),
      ),
      height: 200,
      child: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Select Barber',
                  style: TextStyle(color: AppColors.yellowColors, fontSize: 18),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (c, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          border: Border.all(
                              width: 2, color: AppColors.yellowColors),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(120),
                            child: Image.asset(
                              i % 2 == 0 ? AppImages.whiteMan : AppImages.girl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          i % 2 == 0 ? 'Mick' : 'Nanny',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          i == 0 ? 'Available' : 'Availavle \nat 2:00 pm',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12,
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
          ),
        ],
      ),
    );
  }

  Widget _buildScrollPage({
    required String category,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Category $category',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildCon(
            isTrue: isTrue,
            onTap: () {
              isTrue = !isTrue;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue1,
            onTap: () {
              isTrue1 = !isTrue1;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue2,
            onTap: () {
              isTrue2 = !isTrue2;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue3,
            onTap: () {
              isTrue3 = !isTrue3;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue4,
            onTap: () {
              isTrue4 = !isTrue4;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue5,
            onTap: () {
              isTrue5 = !isTrue5;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue6,
            onTap: () {
              isTrue6 = !isTrue6;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue7,
            onTap: () {
              isTrue7 = !isTrue7;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue8,
            onTap: () {
              isTrue8 = !isTrue8;
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildAllCategoriesScrollPage({
    required String category,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildCon(
            isTrue: isTrue,
            onTap: () {
              isTrue = !isTrue;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue1,
            onTap: () {
              isTrue1 = !isTrue1;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue2,
            onTap: () {
              isTrue2 = !isTrue2;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue3,
            onTap: () {
              isTrue3 = !isTrue3;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue4,
            onTap: () {
              isTrue4 = !isTrue4;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue5,
            onTap: () {
              isTrue5 = !isTrue5;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue6,
            onTap: () {
              isTrue6 = !isTrue6;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue7,
            onTap: () {
              isTrue7 = !isTrue7;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue8,
            onTap: () {
              isTrue8 = !isTrue8;
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildCon({required bool isTrue, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        children: [
          const MyTooltip(
            message: 'Trimming',
            child: Icon(
              Icons.error_outline,
              color: Colors.grey,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Trimming',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '18 Minutes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
          const Text(
            ' £ 120',
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
          TextButton(
            onPressed: onTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Select",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: isTrue ? AppColors.yellowColors : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Widget _buildButtonContinue(
      {required String text, required VoidCallback onTap}) {
    return Padding(
        padding: const EdgeInsets.only(left: 70, bottom: 5, top: 0, right: 70),
        child: Center(
            child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            style:
                TextButton.styleFrom(backgroundColor: AppColors.yellowColors),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        )));
  }
}
