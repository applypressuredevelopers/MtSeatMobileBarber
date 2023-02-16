import 'dart:io';

import 'package:barber_app/src/ui/model/types_saloon_material.dart';
import 'package:barber_app/src/ui/pages/category/categories_page.dart';
import 'package:barber_app/src/ui/pages/check_in.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/images.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../pages/category/service_select.dart';
import '../pages/current_future_booking.dart';
import '../widgets/bottom_sheet.dart';

class BottomHomeView extends StatefulWidget {
  const BottomHomeView({Key? key}) : super(key: key);

  @override
  _BottomHomeViewState createState() => _BottomHomeViewState();
}

class _BottomHomeViewState extends State<BottomHomeView> {
  bool isStar = false;

  Future<bool> _onClose() async {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onClose,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          // extendBodyBehindAppBar: true,
          bottomNavigationBar: const CustomBottomSheet(),
          backgroundColor: Colors.black,
          // appBar: PreferredSize(
          //   preferredSize: const Size.fromHeight(100),
          //   child: AppBar(
          //       leadingWidth: 80,
          //       leading: Image.asset(
          //         AppImages.logoApp,
          //         height: 80,
          //         width: 80,
          //         fit: BoxFit.fill,
          //       ),
          //       centerTitle: true,
          //       backgroundColor: Colors.black,
          //       title: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           const SizedBox(
          //             height: 2,
          //           ),
          //           const Text(
          //             'MT-Seat',
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 26,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //           Container(
          //             height: 30,
          //             width: 180,
          //             padding: const EdgeInsets.all(2),
          //             child: TextFormField(
          //               style: const TextStyle(color: Colors.white, fontSize: 12),
          //               decoration: InputDecoration(
          //                 suffixIcon: Image.asset(
          //                   AppImages.send,
          //                   width: 2,
          //                   height: 20,
          //                 ),
          //                 contentPadding: const EdgeInsets.only(left: 5),
          //                 hintText: 'Paddington, England , Hpp',
          //                 hintStyle:
          //                     const TextStyle(color: Colors.white, fontSize: 12),
          //                 enabledBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8),
          //                     borderSide: const BorderSide(color: Colors.white)),
          //                 focusedBorder: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8),
          //                     borderSide: const BorderSide(color: Colors.white)),
          //               ),
          //             ),
          //           ), // Container(
          //         ],
          //         mainAxisSize: MainAxisSize.min,
          //       ),
          //       actions: [
          //         _buildCartAndBell(url: AppImages.bell, context: context),
          //         _buildCartAndBell(url: AppImages.cart, context: context),
          //       ]),
          // ),
          body: Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.logoApp,
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                      const Expanded(flex: 1,child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'MT-Seat',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 180,
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: Image.asset(
                                  AppImages.send,
                                  width: 2,
                                  height: 20,
                                ),
                                contentPadding: const EdgeInsets.only(left: 5),
                                hintText: 'Paddington, England , Hpp',
                                hintStyle: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                              ),
                            ),
                          ), // Container(
                        ],
                        mainAxisSize: MainAxisSize.min,
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildCartAndBell(
                            url: AppImages.bell, context: context),
                      ),
                      Expanded(
                        flex: 2,
                        child: _buildCartAndBell(
                            url: AppImages.cart, context: context),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ),
                Expanded(
                  child:

                  SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 100),

                    // physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5.0, left: 12, right: 12),
                        //   child: SizedBox(
                        //     height: 110,
                        //     child: PageView(
                        //       scrollDirection: Axis.horizontal,
                        //       children: [
                        //         ClipRRect(
                        //           borderRadius: BorderRadius.circular(20),
                        //           child: Image.asset(AppImages.shop3,
                        //               width: MediaQuery.of(context).size.width,
                        //               fit: BoxFit.cover,
                        //               height: 100),
                        //         ),
                        //         ClipRRect(
                        //           borderRadius: BorderRadius.circular(20),
                        //           child: Image.asset(AppImages.shop,
                        //               width: MediaQuery.of(context).size.width,
                        //               fit: BoxFit.cover,
                        //               height: 100),
                        //         ),
                        //         ClipRRect(
                        //           borderRadius: BorderRadius.circular(20),
                        //           child: Image.asset(AppImages.shop2,
                        //               width: MediaQuery.of(context).size.width,
                        //               fit: BoxFit.cover,
                        //               height: 100),
                        //         ),
                        //         ClipRRect(
                        //           borderRadius: BorderRadius.circular(20),
                        //           child: Image.asset(AppImages.shop3,
                        //               width: MediaQuery.of(context).size.width,
                        //               fit: BoxFit.cover,
                        //               height: 100),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        CarouselSlider(

                          options: CarouselOptions(
                              viewportFraction: 1,
                              height: 150.0,
                              autoPlayAnimationDuration:const Duration(milliseconds: 1000),
                              autoPlayInterval: const Duration(milliseconds: 10000),
                            autoPlay: true
                          ),
                          items: [AppImages.shop,AppImages.shop1,AppImages.shop2,AppImages.shop3].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent
                                    ),
                                    child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(i,
                                              width: MediaQuery.of(context).size.width,
                                              fit: BoxFit.fill,
                                              height: 150,

                                          ),
                                        ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text(
                            'Categories',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Text(
                            'We have had picked some best services for you',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        _buildHorizontalList(),
                        _buildNearByServicesProviders(),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text(
                            'Add-Ons / Special Services',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        _buildSpecialServicesHorizontalList(),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text(
                            'Special Offers',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        _buildSpecialOfferHorizontalList(),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Text(
                            'Shops',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                        _buildShopsHorizontalList()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.backHome,
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialOfferHorizontalList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 250,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return SizedBox(
              width: 170,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffBFBEBE)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        i % 2 == 0 ? AppImages.barber : AppImages.hair,
                        height: 150,
                        width: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              i % 2 == 0 ? 'Facial' : 'Free Perm',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  // width: 160,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellowColors,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: const Text(
                                    '10% Off Trim',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              'Shovan’s Barber Shop \nABERDEEN. AB10 6DN. \n73 HOLBURN STREET',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (c, i) {
            return const SizedBox(
              width: 15,
            );
          },
          itemCount: dummyData.length),
    );
  }

  Widget _buildSpecialServicesHorizontalList() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 180,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return SizedBox(
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Appnavigation().push(const CategoriesListPage(), context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          i % 2 == 0 ? AppImages.barber : AppImages.hair,
                          height: 130,
                          width: 170,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        i % 2 == 0 ? AppImages.barber : AppImages.hair,
                        width: 66,
                        height: 40,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              i % 2 == 0 ? 'Beard Line-Up' : 'Coloring',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Text(
                              'Shovan’s Barber Shop ABERDEEN. AB10 6DN. 73 HOLBURN STREET',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 7,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (c, i) {
            return const SizedBox(
              width: 15,
            );
          },
          itemCount: dummyData.length),
    );
  }

  Widget _buildShopsHorizontalList() {
    return SizedBox(
      height: 165,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 30),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return Container(
              width: 145,
              height: 164,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                    i % 2 == 0 ? AppImages.beardOil : AppImages.beardBrush),
                fit: BoxFit.cover,
              )),
              padding: const EdgeInsets.only(left: 3, top: 6),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26,
                  ),
                  child: Text(
                    i % 2 == 0 ? 'Beard Oil' : 'Beard Brush',
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (c, i) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: dummyData.length),
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      height: 155,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 30),
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Appnavigation().push(const ServiceSelection(), context);
                    // Appnavigation().push(const CategoriesListPage(), context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          dummyData[i].url,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          dummyData[i].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        width: 100,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppColors.yellowColors,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (c, i) {
            return const SizedBox(
              width: 30,
            );
          },
          itemCount: 3),
    );
  }

  Widget _buildContainerBack() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(30, 30),
          bottomLeft: Radius.elliptical(30, 30),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
    );
  }

  Widget _buildCartAndBell({
    required String url,
    required BuildContext context,
  }) {
    return GestureDetector(
      child: Image.asset(
        url,
        width: 50,
        height: 50,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomDialog();
            });
      },
    );
  }

  Widget _buildNearByServicesProviders() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextButton(onPressed: (){
                Get.to(()=>CurrentAndFutureBooking());
              }, child: Text("List")),
              const Expanded(
                child: Text(
                  'Nearby Service Providers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ViewAllDialog();
                      });
                },
                child: const Text(
                  'View All',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.yellowColors,
                size: 18,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // for (int ix = 0; i < 4; i++)
          SizedBox(
            height: 450,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomDialog();
                          });
                    },
                    child: Container(
                      height: 140,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  AppImages.saloon,
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Shovan',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'ABERDEEN AD.60 ',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Text(
                                    '0.3 KM',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: Row(
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          Icon(
                                            Icons.star,
                                            color: AppColors.yellowColors,
                                            size: 20,
                                          ),
                                        Icon(
                                          Icons.star_border,
                                          color: AppColors.yellowColors,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: Row(
                                      children: [
                                        _buildInShopAndHome(text: 'In Shop'),
                                        _buildInShopAndHome(text: 'Home Visit'),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Live',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        maxRadius: 6,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 65,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      child: Icon(
                                        isStar ? Icons.star : Icons.star_border,
                                        color: AppColors.yellowColors,
                                        size: 35,
                                      ),
                                      onTap: () {
                                        isStar = !isStar;
                                        setState(() {});
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildInShopAndHome({
    required String text,
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.yellowColors),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 8,
          color: Colors.black,
        ),
      ),
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), //this right here
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildButton(
                text: 'In-Shop',
                onTap: () {
                  selectedIndex = 0;
                  setState(() {});
                },
                i: 0,
              ),
              const SizedBox(
                width: 10,
              ),
              _buildButton(
                text: 'Home Visit',
                onTap: () {
                  selectedIndex = 1;
                  setState(() {});
                },
                i: 1,
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CheckInPage(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.yellowColors,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int selectedIndex = -1;

  Widget _buildButton({
    required String text,
    required int i,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor:
              selectedIndex == i ? AppColors.yellowColors : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class ViewAllDialog extends StatefulWidget {
  const ViewAllDialog({Key? key}) : super(key: key);

  @override
  _ViewAllDialogState createState() => _ViewAllDialogState();
}

class _ViewAllDialogState extends State<ViewAllDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), //this right here
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton(
              text: 'In-Shop',
              onTap: () {},
            ),
            _buildButton(
              text: 'Home Visit',
              onTap: () {},
            ),
            _buildButton(
              text: 'View All',
              onTap: () {},
            ),
            _buildButton(
              text: 'Barber',
              onTap: () {},
            ),
            _buildButton(
              text: 'Hairdresser',
              onTap: () {},
            ),
            _buildButton(
              text: 'Beauty Salons',
              onTap: () {},
            ),

            // const SizedBox(
            //   height: 100,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 50),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: TextButton(
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => const CheckInPage()));
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 10),
            //           child: Text(
            //             'Continue',
            //             style: TextStyle(color: Colors.white, fontSize: 18),
            //           ),
            //         ),
            //         style: TextButton.styleFrom(
            //           backgroundColor: AppColors.yellowColors,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ))
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  int selectedIndex = -1;

  Widget _buildButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        style: TextButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: AppColors.yellowColors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
