import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileTop(),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildLabelText(label: 'Full Name'),
                _buildTextField(hintText: 'Enter Name'),
                _buildLabelText(label: 'Email'),
                _buildTextField(hintText: 'Enter email address'),
                _buildLabelText(label: 'Contact Number'),
                _buildTextField(hintText: '+44 XXXXXXX'),
                _buildLabelText(label: 'Location'),
                _buildTextField(hintText: 'St. Peter’s'),
                _buildLabelText(label: 'Gender'),
                _buildTextField(hintText: 'Male / Female / Other'),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: AppColors.yellowColors),
                    onPressed: () {
                      Appnavigation().pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hintText}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 25,
        right: 15,
      ),
      child: TextFormField(
        style: const TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.yellowColors),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.yellowColors),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.yellowColors),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  Widget _buildLabelText({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 3),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildProfileTop() {
    return Row(
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
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            AppImages.whiteMan,
            width: 85,
            height: 85,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(),
        Image.asset(
          AppImages.bell,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          AppImages.cart,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
