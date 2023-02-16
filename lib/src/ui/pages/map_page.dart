import 'dart:async';

import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/bottom_sheet.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.507351, -0.127758),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(51.507351, -0.127758),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // return Container(
    //   height: height,
    //   width: width,
    //   decoration: BoxDecoration(
    //       image: DecorationImage(
    //     image: AssetImage(AppImages.mapPage),
    //     fit: BoxFit.fill,
    //   ),),
    //   child: Scaffold(
    //     extendBody: true,
    //     backgroundColor: Colors.transparent,
    //     bottomNavigationBar: const CustomBottomSheet(),
    //     body: Stack(
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.only(
    //             top: 20,
    //             left: 10,
    //             right: 10,
    //             bottom: 10,
    //           ),
    //           /*decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: AssetImage(AppImages.mapPage),
    //               fit: BoxFit.cover,
    //             ),
    //           ),*/
    //           child: SafeArea(
    //             child: Column(
    //               children: [
    //                 /// top row with back arrow and notification icon
    //                 Row(
    //                   children: [
    //                     Image.asset(
    //                       AppImages.backArrow,
    //                       color: Colors.black,
    //                     ),
    //                     // Padding(
    //                     //   padding: const EdgeInsets.symmetric(horizontal: 13),
    //                     //   child: Image.asset(
    //                     //     AppImages.logoApp,
    //                     //   ),
    //                     // ),
    //                     const SizedBox(
    //                       width: 10,
    //                     ),
    //                     const Text(
    //                       'MT-Seat',
    //                       style: TextStyle(
    //                           color: Colors.black,
    //                           fontSize: 27,
    //                           fontWeight: FontWeight.w400),
    //                     ),
    //                     const Spacer(),
    //                     Image.asset(
    //                       AppImages.bell,
    //                       color: Colors.black,
    //                       height: 20,
    //                       width: 20,
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ],
    //                 ),
    //
    //                 /// top search bar
    //                 Container(
    //                   margin: const EdgeInsets.only(top: 20, bottom: 10),
    //                   height: 30,
    //                   width: 180,
    //                   color: Colors.black12,
    //                   child: TextFormField(
    //                     style:
    //                         const TextStyle(color: Colors.white, fontSize: 12),
    //                     decoration: InputDecoration(
    //                       suffixIcon: Image.asset(
    //                         AppImages.send,
    //                         width: 2,
    //                         height: 20,
    //                         color: Colors.black38,
    //                       ),
    //                       contentPadding: const EdgeInsets.only(left: 5),
    //                       hintText: 'Paddington, England , Hpp',
    //                       hintStyle: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 12,
    //                       ),
    //                       border: InputBorder.none,
    //                       // enabledBorder: OutlineInputBorder(
    //                       //     borderRadius: BorderRadius.circular(8),
    //                       //     borderSide:
    //                       //     const BorderSide(color: Colors.white)),
    //                       // focusedBorder: OutlineInputBorder(
    //                       //     borderRadius: BorderRadius.circular(8),
    //                       //     borderSide:
    //                       //     const BorderSide(color: Colors.white)),
    //                     ),
    //                   ),
    //                 ),
    //
    //                 /// bottom search bar
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(20),
    //                     color: Colors.black12,
    //                   ),
    //                   height: 30,
    //                   width: 220,
    //                   child: TextFormField(
    //                     style: const TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 12,
    //                     ),
    //                     decoration: InputDecoration(
    //                       suffixIcon: const Icon(
    //                         Icons.filter_list,
    //                         color: Colors.white,
    //                       ),
    //                       prefixIconConstraints: BoxConstraints.tight(
    //                         const Size.fromWidth(25),
    //                       ),
    //                       prefixIcon: const Icon(
    //                         Icons.search,
    //                         size: 15,
    //                         color: Colors.white,
    //                       ),
    //                       hintText: 'Search',
    //                       hintStyle: const TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 14,
    //                       ),
    //                       border: InputBorder.none,
    //                       // enabledBorder: OutlineInputBorder(
    //                       //     borderRadius: BorderRadius.circular(8),
    //                       //     borderSide:
    //                       //     const BorderSide(color: Colors.white)),
    //                       // focusedBorder: OutlineInputBorder(
    //                       //     borderRadius: BorderRadius.circular(8),
    //                       //     borderSide:
    //                       //     const BorderSide(color: Colors.white)),
    //                     ),
    //                   ),
    //                 ),
    //
    //                 /// pin location image
    //                 SizedBox(height: height * 0.05),
    //                 Image.asset(
    //                   AppImages.pinLocation,
    //                   height: 80,
    //                 ),
    //
    //                 /// track graph image
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 30),
    //                   child: Image.asset(
    //                     AppImages.track,
    //                   ),
    //                 ),
    //                 const Spacer(),
    //
    //                 // Container(
    //                 //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
    //                 //   decoration: BoxDecoration(
    //                 //     color: Colors.black26,
    //                 //     borderRadius: BorderRadius.circular(12),
    //                 //   ),
    //                 //   width: MediaQuery.of(context).size.width,
    //                 //   child: Column(
    //                 //     children: [
    //                 //       _buildCircleImageRow(),
    //                 //       SizedBox(height: 7,),
    //                 //       Text(
    //                 //         'Henry',
    //                 //         style: TextStyle(
    //                 //             color: Colors.black,
    //                 //             fontWeight: FontWeight.w700,
    //                 //             fontSize: 15),
    //                 //         textAlign: TextAlign.center,
    //                 //       ),
    //                 //       Padding(
    //                 //         padding: const EdgeInsets.symmetric(vertical: 2),
    //                 //         child: Text(
    //                 //           'Steve’s Barbershop',
    //                 //           style: TextStyle(
    //                 //               color: Colors.black,
    //                 //               fontWeight: FontWeight.w500,
    //                 //               fontSize: 15),
    //                 //           textAlign: TextAlign.center,
    //                 //         ),
    //                 //       ),
    //                 //       Row(
    //                 //         mainAxisAlignment: MainAxisAlignment.center,
    //                 //         children: [
    //                 //           for (int i = 0; i < 4; i++)
    //                 //             Padding(
    //                 //               padding: const EdgeInsets.only(left: 4),
    //                 //               child: Icon(
    //                 //                 Icons.star,
    //                 //                 color: AppColors.yellowColors,
    //                 //                 size: 14,
    //                 //               ),
    //                 //             ),
    //                 //           Icon(
    //                 //             Icons.star_border,
    //                 //             color: AppColors.yellowColors,
    //                 //             size: 14,
    //                 //           )
    //                 //         ],
    //                 //       )
    //                 //     ],
    //                 //   ),
    //                 // )
    //
    //                 // Container(
    //                 //   height: 270,
    //                 //   width: MediaQuery.of(context).size.width,
    //                 //   child: Padding(
    //                 //     padding:
    //                 //         const EdgeInsets.only(bottom: 12, right: 40, left: 40),
    //                 //     child: Align(
    //                 //       alignment: Alignment.bottomCenter,
    //                 //       child: Row(
    //                 //         children: [
    //                 //           Expanded(
    //                 //             child: GestureDetector(
    //                 //               onTap: () {
    //                 //                 Appnavigation().pop(context);
    //                 //               },
    //                 //               child: Container(
    //                 //                 decoration: BoxDecoration(
    //                 //                     borderRadius: BorderRadius.circular(2),
    //                 //                     border: Border.all(
    //                 //                       width: 1,
    //                 //                       color: Colors.white,
    //                 //                     ),
    //                 //                     color: Colors.black),
    //                 //                 padding: EdgeInsets.all(2),
    //                 //                 child: const Text(
    //                 //                   'Cancel Booking',
    //                 //                   textAlign: TextAlign.center,
    //                 //                   style: TextStyle(
    //                 //                     fontSize: 14,
    //                 //                     color: Colors.white,
    //                 //                     fontWeight: FontWeight.w400,
    //                 //                   ),
    //                 //                 ),
    //                 //               ),
    //                 //             ),
    //                 //           ),
    //                 //           SizedBox(
    //                 //             width: 20,
    //                 //           ),
    //                 //           Expanded(
    //                 //             child: Container(
    //                 //               decoration: BoxDecoration(
    //                 //                   borderRadius: BorderRadius.circular(2),
    //                 //                   border: Border.all(
    //                 //                     width: 1,
    //                 //                     color: Colors.white,
    //                 //                   ),
    //                 //                   color: AppColors.yellowColors),
    //                 //               padding: EdgeInsets.all(2),
    //                 //               child: const Text(
    //                 //                 'Stylist Info',
    //                 //                 textAlign: TextAlign.center,
    //                 //                 style: TextStyle(
    //                 //                   fontSize: 14,
    //                 //                   fontWeight: FontWeight.w400,
    //                 //                 ),
    //                 //               ),
    //                 //             ),
    //                 //           )
    //                 //         ],
    //                 //       ),
    //                 //     ),
    //                 //   ),
    //                 //   decoration: BoxDecoration(
    //                 //     image: DecorationImage(
    //                 //         image: AssetImage(AppImages.bottomBarberDetail),
    //                 //         fit: BoxFit.fill),
    //                 //   ),
    //                 // )
    //               ],
    //             ),
    //           ),
    //         ),
    //
    //         /// DragableScrollSheet
    //         DraggableScrollableSheet(
    //           initialChildSize: 0.35,
    //           minChildSize: 0.35,
    //           maxChildSize: 0.95,
    //           builder: (
    //             BuildContext context,
    //             ScrollController scrollController,
    //           ) {
    //             return Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Center(
    //                   child: Container(
    //                     height: 6,
    //                     width: 50,
    //                     decoration: BoxDecoration(
    //                       color: Colors.black,
    //                       borderRadius: BorderRadius.circular(20),
    //                     ),
    //                   ),
    //                 ),
    //                 const SizedBox(height: 10),
    //                 _buildTabBar(),
    //                 const SizedBox(height: 10),
    //                 _currentPage == 0
    //                     ? _buildList(itemCount: 32, scrollController: scrollController)
    //                     : _buildList(itemCount: 10, scrollController: scrollController),
    //               ],
    //             );
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      body: GoogleMap(

        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: Text('Mt Seat'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Widget _buildList({required int itemCount, required scrollController}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.black54, //Does not wor)k),
          ),
          child: Scrollbar(
            isAlwaysShown: true,
            radius: const Radius.circular(10),
            thickness: 10,
            child: ListView.separated(
             /// physics: const NeverScrollableScrollPhysics(),

              controller: scrollController,
              padding: const EdgeInsets.all(7),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onDoubleTap: () {
                    // Appnavigation().push(CheckInPage(), context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:
                          selected == i ? AppColors.yellowColors : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
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
                                    i % 2 == 0
                                        ? 'Steve’s Barbershop'
                                        : 'Jim’s Cutz',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Spacer(),
                                  Align(
                                    child: Text(
                                      i % 2 == 0 ? '0.7 KM' : '',
                                      style: const TextStyle(fontSize: 7),
                                    ),
                                    alignment: Alignment.topRight,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'George Lee Court, King St., Piddin...',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Opens at 12:00 PM - Closes at 3PM',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Join',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Image.asset(
                                      AppImages.join,
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  for (int i = 0; i < 4; i++)
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Image.asset(
                                        AppImages.starFill,
                                        width: 12,
                                        height: 12,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  Image.asset(
                                    AppImages.starUnFill,
                                    width: 12,
                                    height: 12,
                                    fit: BoxFit.cover,
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      Image.asset(
                                        AppImages.walk,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${i + 3} M',
                                        style: const TextStyle(fontSize: 7),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        AppImages.car,
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${i + 1} M',
                                        style: const TextStyle(fontSize: 7),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    selected = i;
                    setState(() {});
                  },
                );
              },
              separatorBuilder: (context, j) {
                return const SizedBox(height: 10);
              },
              itemCount: itemCount,
            ),
          ),
        ),
      ),
    );
  }

  var selected = -1;
  int _currentPage = 0;

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              _currentPage = 0;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  color:
                      _currentPage == 0 ? AppColors.yellowColors : Colors.black,
                  border: Border.all(color: Colors.white)),
              child: Text(
                'Home Visit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: _currentPage == 0 ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 1,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _currentPage = 1;
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  color:
                      _currentPage == 1 ? AppColors.yellowColors : Colors.black,
                  border: Border.all(color: Colors.white)),
              child: Text(
                'In-Shop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: _currentPage == 1 ? Colors.black : Colors.white,
                  // fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleImageRow() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.yellowColors)),
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              AppImages.whiteMan,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(color: AppColors.yellowColors)),
            width: 60,
            height: 60,
            child: const Center(
              child: Text(
                '15\nMIN',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ))
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
