import 'dart:convert';

import 'package:barber_app/constants.dart';
import 'package:barber_app/model/chekOutModel.dart';
import 'package:barber_app/src/ui/pages/check_in.dart';
import 'package:barber_app/src/ui/pages/current_future_booking.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/images.dart';
import '../auth/login/controller/login_controller.dart';

class AddNewCustomer extends StatefulWidget {
  const AddNewCustomer({Key? key}) : super(key: key);

  @override
  _AddNewCustomerState createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {
  bool addAnotherBooking = false;
  final _auth =FirebaseAuth.instance;
  LoginController loginController = Get.find();


  Future<void> initPayment({required String email,required double amount, required BuildContext context}) async{
    try{
      //create a payment intent
      final response = await http.post(Uri.parse('https://us-central1-mtseat.cloudfunctions.net/stripePaymentIntentRequest'),

          body: {
            'email': email,
            'amount': amount.toString(),
          }
      );
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      //initialize the paymentsheet
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: "Fire doors",
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          testEnv: true,
          merchantCountryCode: 'UK'
      ));

      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Payment is Successful")));
      for(int i = 0; i < checkouts.length; i ++){
        // if(selectedSlot1 !='-1'){
        //   _postToFireStore1(context, i);
        // }
        // if(selectedSlot2 != '-1'){
        //   _postToFireStore2(context, i);
        // }if(selectedSlot3 != '-1'){
        //   _postToFireStore3(context, i);
        // }if(selectedSlot4 != '-1'){
        //   _postToFireStore4(context, i);
        // }if(selectedSlot5 != '-1'){
        //   _postToFireStore5(context, i);
        // }if(selectedSlot6 != '-1'){
        //   _postToFireStore6(context, i);
        // }if(selectedSlot7 != '-1'){
        //   _postToFireStore7(context, i);
        // }if(selectedSlot8 != '-1'){
        //   _postToFireStore8(context, i);
        // }
        _postToFireStore(context, i);
      }
    }catch(error){
      if(error is StripeException){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An Error occurred ${error.error.localizedMessage}")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("An Error occurred $error")));

      }
    }
  }



  Future<void> _getData() async {
    checkouts.clear();
    totalPrice = 0;
    for(int i =0; i < selectedServices.length; i ++){
      CheckoutModel checkoutModel = CheckoutModel();
      checkoutModel.id = '${_auth.currentUser?.uid}${DateTime.now().millisecondsSinceEpoch}';
      checkoutModel.uid = _auth.currentUser?.uid;
      checkoutModel.userName = userName;
      checkoutModel.email = _auth.currentUser?.email;
      checkoutModel.stylistId = selectedStylistId;
      checkoutModel.stylistId = selectedServices[i].serviceId;
      checkoutModel.style = selectedServices[i].serviceName;
      checkoutModel.slot = selectedSlot;
      checkoutModel.day = selectedDate;
      checkoutModel.month = selectedMonth;
      checkoutModel.mon = mon;
      checkoutModel.year = DateTime.now().year.toString();
      checkoutModel.shop = selectedShop;
      checkoutModel.contactNumber = contactNumber;
      checkoutModel.price = selectedServices[i].price;

      totalPrice = totalPrice +  int.parse( checkoutModel.price.toString());

      checkouts.add(checkoutModel);

    }

    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _getData();
    });

  }

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
          child: Column(
        children: [
          _buildProfileTop(),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < checkouts.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    checkouts[i].style.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  /*const SizedBox(
                                    width: 20,
                                  ),*/
                                 MyTooltip(
                                    message: checkouts[i].style.toString(),
                                    child: const Icon(
                                      Icons.error_outline,
                                      color: Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                               Text(
                                '${checkouts[i].month.toString()}, ${checkouts[i].day.toString()} ${checkouts[i].year.toString()}\n'
                                    '${checkouts[i].userName.toString()}, ${checkouts[i].contactNumber.toString()}'
                                    ,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),
                              ),

                              if(checkouts[i].note != null)
                              Text('Note: ${checkouts[i].note.toString()}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white),),
                              const SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addNote = i;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AddNoteDialog();
                                      });
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Add Note',
                                      style: TextStyle(
                                          color: AppColors.yellowColors,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                            child: const Text(
                              "Change Provider",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 10,
                              ),
                            ),
                            // style: TextButton.styleFrom(
                            //   backgroundColor: AppColors.yellowColors,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            // ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext c) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, bottom: 15),
                                                child: Text(
                                                  'Henry Cut',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .yellowColors,
                                                      fontSize: 18),
                                                ),
                                              ),
                                              alignment: Alignment.topLeft,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 20),
                                              height: 140,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (c, i) {
                                                    return Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 5,
                                                                  bottom: 5),
                                                          height: 60,
                                                          width: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        120),
                                                            border: Border.all(
                                                                width: 2,
                                                                color: AppColors
                                                                    .yellowColors),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          120),
                                                              child:
                                                                  Image.asset(
                                                                i % 2 == 0
                                                                    ? AppImages
                                                                        .whiteMan
                                                                    : AppImages
                                                                        .girl,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            i % 2 == 0
                                                                ? 'Mick'
                                                                : 'Nanny',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 25,
                                                        ),
                                                        Center(
                                                          child: Text(
                                                            i == 0
                                                                ? 'Available \n '
                                                                : 'Available \nat 2:00 pm',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder: (c, i) {
                                                    return const SizedBox(
                                                      width: 5,
                                                    );
                                                  },
                                                  itemCount: 30),
                                            ),
                                            TextButton(
                                              child: const Text(
                                                "Change Barber",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.yellowColors,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: () {
                                                Appnavigation().pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.blue, width: 1)),
                              height: 42,
                              width: 42,
                              padding: const EdgeInsets.all(2),
                              child: ClipRRect(
                                child: Image.asset(
                                  AppImages.whiteMan,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(120),
                              ),
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            const Text(
                              'John Doe',
                              style:
                                  TextStyle(color: Colors.white38, fontSize: 6),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2, bottom: 40),
                  child: Row(
                    children: [
                      const Text(
                        'Promo Code',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          style: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Colors.white38,
                                fontStyle: FontStyle.italic),
                            hintText: 'Enter Code',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white38),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                          child: Text(
                            'Claim',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white70),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.yellowColors),
                      )
                    ],
                  ),
                ),
                _buildPayment(text: 'Subtotal', price : totalPrice.toString()),
                _buildPayment(text: 'Discount', price : "0.0"),
                _buildPayment(text: 'Booking Fee', price : "0.0"),
                _buildPayment(text: 'Total', price : totalPrice.toString()),
                // _buildHorizontalListView(),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 70, bottom: 5, top: 40, right: 70),
                    child: Center(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.yellowColors,
                        ),
                        onPressed: () async {
                          await initPayment(
                              email: loginController.emailController.text,
                              amount: totalPrice * 100,
                              context: context);

                          // for(int i = 0; i < checkouts.length; i ++){
                          //   if(selectedSlot1 != '-1'){
                          //     _postToFireStore1(context, i);
                          //   }
                          //   if(selectedSlot2 != '-1'){
                          //     _postToFireStore2(context, i);
                          //   }if(selectedSlot3 != '-1'){
                          //     _postToFireStore3(context, i);
                          //   }if(selectedSlot4 != '-1'){
                          //     _postToFireStore4(context, i);
                          //   }if(selectedSlot5 != '-1'){
                          //     _postToFireStore5(context, i);
                          //   }if(selectedSlot6 != '-1'){
                          //     _postToFireStore6(context, i);
                          //   }if(selectedSlot7 != '-1'){
                          //     _postToFireStore7(context, i);
                          //   }if(selectedSlot8 != '-1'){
                          //     _postToFireStore8(context, i);
                          //   }
                          //   _postToFireStore(context, i);
                          // }


                        },
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            'Checkout Now',
                            style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    )))
              ],
            ),
          ))
        ],
      )
          // ),
          ),
    ));





  }

  _postToFireStore(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = checkouts[i].id;
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedTimeFrom;
    document.slotTo = selectedTimeTo1;
    document.time = serviceTime.toString();
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = checkouts[i].note;
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));
    Fluttertoast.showToast(msg: "Added successful");
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CurrentAndFutureBooking()));
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ReportScreen()), (route) => false);

  }

  _postToFireStore1(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}1';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot1;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore2(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}2';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot2;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore3(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}3';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot3;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore4(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}4';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot4;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }
    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore5(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}5';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot5;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore6(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}6';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot6;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore7(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}7';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot7;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }
  _postToFireStore8(BuildContext context,int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}8';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId =checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = selectedSlot8;
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon=  checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = joinQueue;
    document.note = "childElement";
    document.shopName = shopName;
    if(joinQueue =="yes"){
      document.day = DateTime.now().day;
      document.month=  thisMonth;
    }

    await firebaseFirestore.collection("bookings").doc(document.id).set(document.toMap(), SetOptions(merge: true));

  }


  Widget _buildHorizontalListView() {
    return Container(
      height: 150,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                addAnotherBooking = true;
              });
            },
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Add Another Booking',
                  style: TextStyle(color: AppColors.yellowColors, fontSize: 18),
                )
              ],
            ),
          ),
          addAnotherBooking
              ? Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, top: 5, bottom: 5),
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(120),
                                border: Border.all(
                                    width: 2, color: AppColors.yellowColors),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(120),
                                  child: Image.asset(
                                    i % 2 == 0
                                        ? AppImages.whiteMan
                                        : AppImages.girl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                i % 2 == 0 ? 'Mick' : 'Nanny',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (c, i) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: 30),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildPayment({required String text, required String price,FontWeight? fontWeight}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.w700,
                color: Colors.white,
                fontSize: 14),
          )),
          const SizedBox(
            width: 100,
          ),
          Expanded(
              child: Text(
            price,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: fontWeight ?? FontWeight.w700,
                color: Colors.white,
                fontSize: 14),
          )),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Widget _buildProfileTop() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Image.asset(
              AppImages.backArrow,
              fit: BoxFit.fill,
              width: 18,
              height: 18,
            ),
            onTap: () {
              Appnavigation().pop(context);
            },
          ),
          const Spacer(),
          const Text(
            'Check Out',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Image.asset(
            AppImages.bell,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class AddNoteDialog extends StatefulWidget {
  const AddNoteDialog({Key? key}) : super(key: key);

  @override
  _AddNoteDialogState createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)), //this right here
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: TextStyle(color: AppColors.yellowColors),
                      maxLines: 5,
                      controller: noteController,
                      decoration: InputDecoration(
                        hintText: 'Add Note',
                        hintStyle: TextStyle(
                            color: AppColors.yellowColors, fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: AppColors.yellowColors)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: AppColors.yellowColors)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
                          checkouts[addNote].note = noteController.text;
                          setState((){});
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.yellowColors,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Color color = AppColors.yellowColors;
  int selected = -1;

  bool isTrue = true;
  bool isTrue1 = true;
  bool isTrue2 = true;
}
