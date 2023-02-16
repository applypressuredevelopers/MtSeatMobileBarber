import 'package:barber_app/constants.dart';
import 'package:barber_app/src/ui/auth/reset_password/reset_password.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';




import '../../../../controller/secure_storage.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../model/AccountModel.dart';
import '../../views/bottom_home_view.dart';
import '../../widgets/backgroud_image.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_field.dart';
import '../signup/signup_screen.dart';
import 'controller/login_controller.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  final _auth =FirebaseAuth.instance;

  final _fireStore = FirebaseFirestore.instance;

  final user =FirebaseAuth.instance.currentUser;

  List<AccountModel> jobs =[];

  bool _passwordVisible= true;

  Future<void> _getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore.collection('users').where("uid", isEqualTo: _auth.currentUser?.uid ).get();
    List<AccountModel> _documents = List.from(querySnapshot.docs.map((doc)=>AccountModel.fromSnapshot(doc),));
    // setState((){
    // print("here");
      jobs = _documents;
      userName = _documents[0].fullName.toString();
      contactNumber = _documents[0].contactNumber.toString();
      // print(jobs[0].uid);
      // allJobs = jobs;
    // });
  }

  Future<void> _getData1() async {
    try {
      loginController.emailController.text = await UserSecureStorage.getUserName() ?? "";
      loginController.passwordController.text = await UserSecureStorage.getPassword() ?? "";
      if (loginController.emailController.text.isNotEmpty ||
          loginController.passwordController.text.isNotEmpty) {
        _signIn(loginController.emailController.text, loginController.passwordController.text, context);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error");
      print(e);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData1();
  }

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

                /// password field
                const SizedBox(height: 24.0),
                // CustomField(
                //   controller: loginController.passwordController,
                //   hintText: 'Enter your Password',
                //   headingText: 'Password',
                //   hintTextColor: AppColors.blackTextColor.withOpacity(0.21),
                //   obscureText: true,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  const EdgeInsets.all(0.0),
                        child: Align(
                          alignment:  Alignment.centerLeft,
                          child: Text("Password",
                            style: AppTextStyles.ubuntuRegular.copyWith(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 48.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                            color: AppColors.blackDarkColor,
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: loginController.passwordController,
                          obscureText: _passwordVisible,//This will obscure text dynamically


                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 8.0, top: 10.0),
                            // contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                            hintText: 'Enter your password',
                            hintStyle: AppTextStyles.ubuntuRegular.copyWith(
                              color: Colors.black12,
                              fontSize: 12.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// always remember
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     Obx(() =>  Checkbox(
                       activeColor: AppColors.orangeMainColor,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(3.0),
                       ),
                       value: loginController.value.value,
                       onChanged: (value){
                         loginController.value.value = value!;
                       },
                     ),),
                      Text('Always Remember Me',
                      style: AppTextStyles.ubuntuRegular.copyWith(
                        color: AppColors.blackTextColor,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                      ),
                    ],
                  ),
                ),

                /// login button
                const SizedBox(height: 24.0),
                CustomButton(
                  onTap: () async {
                    if(loginController.emailController.text =="" || loginController.emailController.text==""){
                      Fluttertoast.showToast(msg: "Enter all the values");
                    }else{
                      // Fluttertoast.showToast(msg: loginController.value.toString());
                      if (loginController.value.value == true) {
                        await UserSecureStorage.setUseName(
                            loginController.emailController.text);
                        await UserSecureStorage.setPassword(
                            loginController.passwordController.text);
                      } else {

                        await UserSecureStorage.delete();
                      }
                      _signIn(loginController.emailController.text, loginController.passwordController.text, context);
                      // userId =user?.uid;

                      // print(userId);
                    }
                  },
                  btnText: 'Log In',
                ),

                /// reset password
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 28.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Did you forget your Password',
                      style: AppTextStyles.ubuntuRegular.copyWith(
                        color: AppColors.blackTextColor,
                        fontSize: 10.0,
                      ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResetPassword()),
                          );
                        },
                        child: Text('Reset Password',
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

  void _signIn(String email, String password, BuildContext context) async{
    // if(_formKey.currentState!.validate()){
    await _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((value) async => {
     await _getData(),
     //
     //  if(jobs[0].shopOwner == "regular_user"){
        checkEmailVerified(context),
     //  }else{
     //    Fluttertoast.showToast(msg: "You are not the shop owner"),
     //  }

    }).catchError((e){
      Fluttertoast.showToast(msg: e!.message );
    });


    // }
  }

  Future<void> checkEmailVerified( BuildContext context) async{
    User user1;
    user1 = _auth.currentUser!;
    await user1.reload();
    // if(user1.emailVerified){
      // Get.to(const BottomHomeView());
      Fluttertoast.showToast(msg: "Authenticated");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomHomeView()),
      );
    // }else{
    //   Fluttertoast.showToast(msg: "You are not verified");
    // }

  }
}
