import 'package:barber_app/src/ui/auth/login/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';




import '../../../utils/app_textstyles.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../model/AccountModel.dart';
import '../../views/bottom_home_view.dart';
import '../../widgets/backgroud_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';
import '../login/controller/login_controller.dart';
import '../signup/signup_screen.dart';
// import 'controller/login_controller.dart';


class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
  final _auth =FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final user =FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor.withOpacity(0.5),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// logo image
                SizedBox(height: height * 0.09),
                Center(child: Image.asset(AppImages.appLogo)),

                /// email field
                const SizedBox(height: 24.0),
                CustomField(
                  controller: loginController.emailController,
                  hintText: 'Enter your Email',
                  headingText: 'Email',
                  hintTextColor: AppColors.blackTextColor.withOpacity(0.21),
                ),




                /// login button
                const SizedBox(height: 24.0),
                CustomButton(
                  onTap: () async {
                    if(loginController.emailController.text ==""){
                      Fluttertoast.showToast(msg: "Enter the email field");
                    }else{
                        try{
                          await FirebaseAuth.instance.sendPasswordResetEmail(email: loginController.emailController.text)
                              .then((value) => {
                            Fluttertoast.showToast(msg: "Reset Password sent. If not found, Check your Spam folder"),
                            Get.to(LoginScreen())
                          }).catchError((e){
                            Fluttertoast.showToast(msg: e!.message);
                          });
                        }catch(e){
                          print(e);
                        }

                    }
                  },
                  btnText: 'Reset Password',
                ),

                /// reset password
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 28.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text('Did you forget your Password',
                      // style: AppTextStyles.ubuntuRegular.copyWith(
                      //   color: AppColors.blackTextColor,
                      //   fontSize: 10.0,
                      // ),
                      // ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text('Back to Login',
                          style: AppTextStyles.ubuntuRegular.copyWith(
                            color: AppColors.orangeDarkColor,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// register button
                const SizedBox(height: 16.0),
                Center(
                  child: TextButton(
                    onPressed: (){
                      // Get.to(SignupScreen());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    child: Text('Sign Up',
                    style: AppTextStyles.ubuntuRegular.copyWith(
                      color: AppColors.blackTextColor,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3.0,
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






}
