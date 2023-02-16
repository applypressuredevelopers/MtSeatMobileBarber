import 'package:barber_app/src/ui/pages/bookin_page.dart';
import 'package:barber_app/src/ui/pages/category/categories_page.dart';
import 'package:barber_app/src/ui/pages/map_page.dart';
import 'package:barber_app/src/ui/pages/my_post/my_post_screen.dart';
import 'package:barber_app/src/ui/pages/profile/favourite_shops.dart';
import 'package:barber_app/src/ui/views/bottom_calender_view.dart';
import 'package:barber_app/src/ui/views/bottom_home_view.dart';
import 'package:barber_app/src/ui/views/bottom_search_view.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/images.dart';
import '../pages/current_future_booking.dart';
import '../views/profile_bottom_view.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 90),
        height: 45,
        child: GestureDetector(
          child: Image.asset(
            AppImages.grid,
            height: 30,
            width: 30,
          ),
          onTap: () {
            showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.yellow,
                      width: 1,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 90, left: 40, right: 40,),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          _buildContainer(
                            url: AppImages.personYellow,
                            onTap: () {
                              Appnavigation().push(const ProfileBottomView(), context);
                            },
                            text: 'Profile',
                          ),
                          const SizedBox(width: 10),
                          _buildContainer(
                            url: AppImages.calenderYellow,
                            onTap: () {
                             /// Appnavigation().push(const BookingPage(), context);
                              Appnavigation().push(const CurrentAndFutureBooking(), context);
                            },
                            text: 'Bookings',
                          ),
                          _buildContainer(
                            url: AppImages.searchYellow,
                            onTap: () {
                              Appnavigation().push(MyPostScreen(), context);
                            },
                            text: 'Social Post',
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          _buildContainer(
                            url: AppImages.homeYellow,
                            onTap: () {
                              Appnavigation()
                                  .push(const BottomHomeView(), context);
                            },
                            text: 'Home',
                          ),
                          const SizedBox(width: 10),
                          _buildContainer(
                            url: AppImages.bellBottomIcon,
                            onTap: () {
                              // Appnavigation().pushReplacement(
                              //     const BottomHomeView(), context);
                            },
                            text: 'Notifications',
                          ),
                          const SizedBox(width: 10),
                          _buildContainer(
                            url: AppImages.sendBottomIcon,
                            onTap: () {
                              // Appnavigation().pushReplacement(
                              //     const BottomHomeView(), context);
                            },
                            text: 'Share',
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          _buildContainer(
                            url: AppImages.fileBottomIcon,
                            onTap: () {
                              Appnavigation()
                                  .push(const CategoriesListPage(), context);
                            },
                            text: 'Category',
                          ),
                          const SizedBox(width: 10),
                          _buildContainer(
                            url: AppImages.favouriteBottomIcon,
                            onTap: () {
                              Appnavigation()
                                  .push(const FavouriteShops(), context);
                            },
                            text: 'Favourites',
                          ),
                          const SizedBox(width: 10),
                          _buildContainer(
                            url: AppImages.mapBottomIcon,
                            onTap: () {
                              Appnavigation().push(const MapPage(), context);
                            },
                            text: 'Map',
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          // onTap: () {
          //   showDialog(
          //       context: context,
          //       builder: (BuildContext c) {
          //         return Dialog(
          //           backgroundColor: Colors.transparent,
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 25, vertical: 35),
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(20),
          //                 border: Border.all(color: Colors.white),
          //                 color: Colors.black),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 TextButton(
          //                   onPressed: () {},
          //                   child: const Padding(
          //                     padding: EdgeInsets.symmetric(
          //                       horizontal: 50,
          //                     ),
          //                     child: Text(
          //                       'HomePage',
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontStyle: FontStyle.italic),
          //                     ),
          //                   ),
          //                   style: TextButton.styleFrom(
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(20),
          //                       ),
          //                       backgroundColor: AppColors.yellowColors),
          //                 ),
          //                 const SizedBox(
          //                   height: 20,
          //                 ),
          //                 TextButton(
          //                   onPressed: () {},
          //                   child: const Padding(
          //                     padding: EdgeInsets.symmetric(
          //                       horizontal: 50,
          //                     ),
          //                     child: Text(
          //                       'Profile Page',
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontStyle: FontStyle.italic),
          //                     ),
          //                   ),
          //                   style: TextButton.styleFrom(
          //                       shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(20),
          //                       ),
          //                       backgroundColor: AppColors.yellowColors),
          //                 )
          //               ],
          //             ),
          //           ),
          //         );
          //       });
          // },
        ),
        decoration: BoxDecoration(
          color: AppColors.yellowColors,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget _buildContainer(
      {required String url,
      required VoidCallback onTap,
      required String text}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              url,
              height: 35,
              width: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
