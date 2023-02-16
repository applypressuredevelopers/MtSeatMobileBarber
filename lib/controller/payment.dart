import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController validUntilController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController holderNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();


  RxBool paypal = false.obs;
  RxBool creditCard = true.obs;
  RxBool isSaved = true.obs;


  void isPayPal() {
    paypal.value = true;
    creditCard.value = false;
  }

  void isCreditCard() {
    paypal.value = false;
    creditCard.value = true;
  }



}