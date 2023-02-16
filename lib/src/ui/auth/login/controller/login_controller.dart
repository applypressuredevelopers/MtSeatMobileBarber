import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../controller/secure_storage.dart';
import '../../../views/bottom_home_view.dart';

class LoginController extends GetxController {
  final _auth =FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool value = false.obs;








  Future<void> checkEmailVerified() async{
    User user1;
    user1 = _auth.currentUser!;
    await user1.reload();
    // if(user1.emailVerified){
    // Get.to(const BottomHomeView());
    Fluttertoast.showToast(msg: "Authenticated");
    Get.to(const BottomHomeView());


  }


}