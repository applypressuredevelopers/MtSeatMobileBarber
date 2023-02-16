import 'package:barber_app/src/ui/widgets/bottom_sheet.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class FavouriteShops extends StatefulWidget {
  const FavouriteShops({Key? key}) : super(key: key);

  @override
  _FavouriteShopsState createState() => _FavouriteShopsState();
}

class _FavouriteShopsState extends State<FavouriteShops> {
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
          child: Column(
            children: [
        SizedBox(height: 40,),  _buildProfileTop(),
          Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      i % 2 == 0
                                          ? 'Steve’s Barbershop'
                                          : 'Jim’s Cutz',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    const Spacer(),
                                    for (int i = 0; i < 4; i++)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 4),
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
                                    // Align(
                                    //           child: Text(
                                    //             i % 2 == 0 ? '0.7 KM' : '',
                                    //             style: const TextStyle(fontSize: 7),
                                    //           ),
                                    //           alignment: Alignment.topRight)
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
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  'Opens at 12:00 PM - Closes at 3PM',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 10),
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
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
                                      child: Image.asset(AppImages.join,
                                          width: 18,
                                          height: 18,
                                          fit: BoxFit.cover),
                                    ),
                                    // for (int i = 0; i < 4; i++)
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(right: 4),
                                    //   child: Image.asset(
                                    //     AppImages.starFill,
                                    //     width: 16,
                                    //     height: 16,
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    // ),
                                    // Image.asset(
                                    //   AppImages.starUnFill,
                                    //   width: 16,
                                    //   height: 16,
                                    //   fit: BoxFit.cover,
                                    // ),
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
                                          style:
                                              const TextStyle(fontSize: 7),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          style:
                                              const TextStyle(fontSize: 7),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, j) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 30))
            ],
          ),
        ));
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
            'Favourite Shops',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const Spacer(),
          Image.asset(
            AppImages.cart,
            color: Colors.transparent,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
