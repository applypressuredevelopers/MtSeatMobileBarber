import 'package:barber_app/src/ui/auth/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
// import 'package:mt_seat_app/res/exports.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


import '../../../utils/app_textstyles.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../model/AccountModel.dart';
import '../../widgets/backgroud_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';
import 'controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;
  final SignupController signupController = Get.put(SignupController());





  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        /// app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 70.0,
          leading: IconButton(
            onPressed: (){
              Get.back();
            },
            icon: SvgPicture.asset(AppImages.appLogo),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(AppImages.backImage),
          ),
          actions: [
            // IconButton(
            //     onPressed: (){},
            //     padding: const EdgeInsets.all(5.0),
            //     icon: SvgPicture.asset(AppImages.notificationIcon),
            // ),
            // IconButton(
            //   onPressed: (){},
            //   padding: const EdgeInsets.all(5.0),
            //   icon: SvgPicture.asset(AppImages.buyIcon),
            // ),
          ],
        ),

        /// body
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Center(
                  child: Text('Barber Sign-Up',
                  style: AppTextStyles.ubuntuRegular.copyWith(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  ),
                ),

                /// fullName field
                const SizedBox(height: 12.0),
                CustomField(
                  controller: signupController.fullNameController,
                  keyboardType: TextInputType.name,
                  headingText: 'Full Name',
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: 'Enter Customer Name',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),

                /// email field
                const SizedBox(height: 24.0),
                CustomField(
                  controller: signupController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  headingText: 'Email',
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: 'Enter email address',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),

                /// password
                const SizedBox(height: 24.0),
                CustomField(
                  controller: signupController.passwordController,
                  keyboardType: TextInputType.text,
                  headingText: 'Password',
                  obscureText: true,
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: 'Enter password',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),

                /// confirm password
                const SizedBox(height: 24.0),
                CustomField(
                  controller: signupController.confirmPasswordController,
                  keyboardType: TextInputType.text,
                  headingText: 'Confirm Password',
                  obscureText: true,
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: 'Confirm password',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),

                /// contact number field
                const SizedBox(height: 24.0),
                CustomField(
                  controller: signupController.contactNumberController,
                  keyboardType: TextInputType.number,
                  headingText: 'Contact Number',
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: '+44 XXXXXXXXXX',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),

                /// location field
                const SizedBox(height: 24.0),
                CustomField(
                  controller: signupController.locationController,
                  keyboardType: TextInputType.streetAddress,
                  headingText: 'Location',
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: 'St. Peter’s',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),


                /// Gender field
                const SizedBox(height: 24.0),
                CustomField(
                  controller: signupController.genderController,
                  keyboardType: TextInputType.text,
                  headingText: 'Gender',
                  headingFontStyle: FontStyle.normal,
                  hintTextColor: AppColors.whiteColor.withOpacity(0.5),
                  hintText: 'Male / Female / Other',
                  headingTextColor: AppColors.whiteColor,
                  headingTextPadding: const EdgeInsets.only(left: 8.0),
                  borderColor: AppColors.orangeMainColor,
                  fieldTextColor: AppColors.whiteColor,
                ),

                /// Continue Button
                const SizedBox(height: 24.0),
                Center(
                  child: CustomButton(
                    onTap: (){
                      // Get.to(ConfirmNumberScreen());
                      if(signupController.fullNameController.text ==""|| signupController.emailController.text==""
                      || signupController.passwordController.text=="" || signupController.passwordController.text==""
                      || signupController.confirmPasswordController.text ==""|| signupController.contactNumberController.text ==""
                      || signupController.locationController.text =="" || signupController.genderController.text ==""
                      ){

                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Sign up Error",
                          desc: "Enter all the details",
                          buttons: [
                            DialogButton(
                              child: const Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 120,
                            )
                          ],

                        ).show();

                      }else if(signupController.passwordController.text != signupController.confirmPasswordController.text){
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Sign up Error",
                          desc: "Password do not match",
                          buttons: [
                            DialogButton(
                              child: const Text(
                                "OK",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 120,
                            )
                          ],

                        ).show();

                      }else{
                        _signUp(signupController.emailController.text, signupController.passwordController.text, context);
                      }
                    },
                    width: width * 0.4,
                    height: 40.0,
                    btnColor: AppColors.orangeMainColor,
                    btnText: 'Continue',
                    btnFontColor: AppColors.blackDarkColor,
                    fontSize: 13.0,
                    radius: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(String email, String password, BuildContext context) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => postToFireStore(context)).then((value) => {Get.to(LoginScreen())}).catchError((e)
    {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postToFireStore( BuildContext context) async {

    FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    AccountModel accountModel = AccountModel();

    accountModel.email = user!.email;
    accountModel.uid = user.uid;
    accountModel.fullName = signupController.fullNameController.text;
    accountModel.password =signupController.passwordController.text;
    accountModel.contactNumber = signupController.contactNumberController.text;
    accountModel.location = signupController.locationController.text;
    accountModel.gender = signupController.genderController.text;
    accountModel.shop = "regular_user";
    try{
      await firebaseFirestore.collection("users")
          .doc(user.uid)
          .set(accountModel.toMap());
      await user.sendEmailVerification();
      Fluttertoast.showToast(msg: "Check verification email, if not found, check your spam folder");
      Alert(
        context: context,
        // style: alertStyle,
        type: AlertType.info,
        title: "Check verification",
        desc: "Check verification email, if not found, check your spam folder",
        buttons: [
          DialogButton(
            child: const Text(
              "ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            // color: const Color.fromRGBO(255, 255, 255, 255),
            color: Colors.black54,
            // radius: BorderRadius.circular(0.0),
          ),
        ],
      ).show();

    }catch (e){
      Fluttertoast.showToast(msg: "Error");
      print(e);
    }
          // Fluttertoast.showToast(msg: "Error");
      // print(e);
    }
  }


// }

