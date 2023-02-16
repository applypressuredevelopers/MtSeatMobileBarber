import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPostController extends GetxController {

  TextEditingController writeMsgController = TextEditingController();

  RxBool isLiked = true.obs;
  RxBool isLikedOne = true.obs;

  void isLikedFun() {
    isLiked.value =! isLiked.value;
  }

  void isLikedOneFun() {
    isLikedOne.value =! isLikedOne.value;
  }

}