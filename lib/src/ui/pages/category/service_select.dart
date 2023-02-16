import 'package:barber_app/constants.dart';
import 'package:barber_app/src/ui/model/ShopModel.dart';
import 'package:barber_app/src/ui/model/serviceModel.dart';
import 'package:barber_app/src/ui/pages/map_page.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/images.dart';
import '../../model/AccountModel.dart';
import '../../views/bottom_home_view.dart';
import '../check_in.dart';

class ServiceSelection extends StatefulWidget {
  const ServiceSelection({Key? key}) : super(key: key);

  @override
  _ServiceSelectionState createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> {
  int _currentPage = 0;
  final _fireStore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  String loadingText = "Loading...";
  List<ShopModel> services = [];

  // List<ServiceModel> finalServices = [];

  Future<void> _getData() async {
    try {
      QuerySnapshot querySnapshot = await _fireStore.collection('shops').get();
      services = List.from(querySnapshot.docs.map(
        (doc) => ShopModel.fromSnapshot(doc),
      ));
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to load");
    }

    setState(() {
      loadingText = "There are no Services";
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _getData();
    });
  }

  Future<bool> _onClose() async {
    Get.to(() => const BottomHomeView());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onClose,
      child: Scaffold(
          extendBody: true,
          // extendBodyBehindAppBar: true,
          floatingActionButton: GestureDetector(
            onTap: () {
              Appnavigation().push(MapPage(), context);
            },
            child: Image.asset(
              AppImages.mapBottomIcon,
              height: 50,
              width: 50,
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.backGround),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 65, vertical: 10),
                    child: SizedBox(
                      height: 55,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Center(
                          child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white38,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white38,
                              ),
                              suffixIcon: const Icon(
                                Icons.filter_list,
                                color: Colors.white38,
                              ),
                              fillColor: Colors.black,
                              hintStyle: const TextStyle(
                                  color: Colors.white38,
                                  fontStyle: FontStyle.italic),
                              hintText: 'Search',
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
                        ),
                      ),
                    ),
                  ),

                  // // _buildProfileTop(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           _currentPage = 0;
                  //           setState(() {});
                  //         },
                  //         child: Container(
                  //           padding: const EdgeInsets.symmetric(vertical: 5),
                  //           width: MediaQuery.of(context).size.width,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(5),
                  //             color: _currentPage == 0
                  //                 ? AppColors.yellowColors
                  //                 : Colors.grey,
                  //           ),
                  //           child: Text(
                  //             'In-Shop',
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.w400,
                  //               fontSize: 17,
                  //               color: _currentPage == 0
                  //                   ? Colors.white
                  //                   : Colors.black,
                  //               fontStyle: FontStyle.italic,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(
                  //         child: GestureDetector(
                  //       onTap: () {
                  //         _currentPage = 1;
                  //         setState(() {});
                  //       },
                  //       child: Container(
                  //         padding: const EdgeInsets.symmetric(vertical: 5),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: _currentPage == 1
                  //               ? AppColors.yellowColors
                  //               : Colors.grey,
                  //         ),
                  //         child: Text(
                  //           'Home Visit',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 17,
                  //             color: _currentPage == 1
                  //                 ? Colors.white
                  //                 : Colors.black,
                  //           ),
                  //         ),
                  //       ),
                  //     ))
                  //   ],
                  // ),
                  _currentPage == 0
                      ? _buildList(itemCount: 3)
                      : _buildList(itemCount: 2),
                ],
              ),
            )
                // ),
                ),
          )),
    );
  }

  var selected = -1;

  Widget _buildList({required int itemCount}) {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  shopName = services[i].shopName.toString();
                  selectedShop = services[i].uid.toString();
                  print(selectedShop);
                  Appnavigation().push(CheckInPage(), context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color:
                          selected == i ? AppColors.yellowColors : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)),
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
                            children: [
                              Spacer(),
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
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                services[i].shopName.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              const Spacer(),

                              // Align(
                              //     child: Text(
                              //       i % 2 == 0 ? '0.7 KM' : '',
                              //       style: const TextStyle(fontSize: 7),
                              //     ),
                              //     alignment: Alignment.topRight)
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'George Lee Court, King St., Piddin...',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Opens at 12:00 PM - Closes at 3PM',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Join',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 10),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.asset(
                                  AppImages.join,
                                  width: 18,
                                  height: 18,
                                  fit: BoxFit.cover,
                                ),
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
                      ))
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, j) {
              return const SizedBox(
                height: 20,
              );
            },
            itemCount: services.length));
  }
}
