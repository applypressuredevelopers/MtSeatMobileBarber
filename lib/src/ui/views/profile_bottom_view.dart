import 'package:barber_app/src/ui/pages/current_future_booking.dart';
import 'package:barber_app/src/ui/pages/profile/edit_profile.dart';
import 'package:barber_app/src/ui/pages/profile/favourite_shops.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/const.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../widgets/bottom_sheet.dart';

class ProfileBottomView extends StatefulWidget {
  const ProfileBottomView({Key? key}) : super(key: key);

  @override
  _ProfileBottomViewState createState() => _ProfileBottomViewState();
}

class _ProfileBottomViewState extends State<ProfileBottomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: const CustomBottomSheet(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGround),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              _buildProfileTop(),
              const SizedBox(
                height: 60,
              ),
              _buildListTile(
                  title: 'Current & Future Bookings',
                  onTap: () {
                    Appnavigation()
                        .push(const CurrentAndFutureBooking(), context);
                  }),
              _buildListTile(
                  title: 'Favourite Shops',
                  onTap: () {
                    Appnavigation().push(const FavouriteShops(), context);
                  }),
              _buildListTile(title: 'Payment Method', onTap: () {}),
              _buildListTile(title: 'Change Password', onTap: () {}),
              _buildListTile(title: 'Support', onTap: () {}),
              _buildListTile(title: 'Share', onTap: () {}),
              _buildListTile(title: 'Contact Us', onTap: () {}),
              _buildListTile(title: 'Privacy Policy', onTap: () {}),
              _buildListTile(title: 'GDPR', onTap: () {}),
              _buildListTile(title: 'Terms and Conditions', onTap: () {}),
              _buildListTile(title: 'Language', onTap: () {}),
              _buildListTile(
                  title: 'About Us',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext c) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white),
                                  color: Colors.black),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(AppImages.logoApp),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      lorem,
                                      style: TextStyle(
                                          color: AppColors.yellowColors,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppImages.whiteMan,
            width: 85,
            height: 85,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Hi Charles!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Relax Feel great,look comfident!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 9,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: AppColors.yellowColors)),
          ),
          onPressed: () {
            Appnavigation().push(const EditProfilePage(), context);
          },
          child: const Text(
            'Edit Profile',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 9,
                fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 10,
      color: Colors.white24,
    );
  }

  Widget _buildListTile({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListTile(
            dense: true,
            onTap: onTap,
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.yellowColors,
              size: 18,
            ),
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  fontStyle: FontStyle.italic),
            ),
          ),
          _buildDivider(),
        ],
      ),
    );
  }
}
