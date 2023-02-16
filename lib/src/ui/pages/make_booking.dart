// import 'package:barber_app/constants.dart';
// import 'package:barber_app/src/ui/pages/add_another_service_provider.dart';
// import 'package:barber_app/src/ui/pages/booking_done.dart';
// import 'package:barber_app/src/ui/pages/check_out_page.dart';
// import 'package:barber_app/src/ui/widgets/drop_down.dart';
// import 'package:barber_app/src/utils/color.dart';
// import 'package:barber_app/src/utils/nav.dart';
// import 'package:flutter/material.dart';
//
// import '../../utils/images.dart';
// import '../widgets/bottom_sheet.dart';
// import 'add_next_customer.dart';
//
// class MakeBookingPage extends StatefulWidget {
//   const MakeBookingPage({Key? key}) : super(key: key);
//
//   @override
//   _MakeBookingPageState createState() => _MakeBookingPageState();
// }
//
// class _MakeBookingPageState extends State<MakeBookingPage> {
//   String? monthName;
//   List<String> questionList = <String>[
//     "January",
//     "February",
//     "March",
//     "April",
//     "May",
//     "June",
//     "July",
//     "August",
//     "September",
//     "October",
//     "November",
//     "December",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       // bottomNavigationBar: CustomBottomSheet(),
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: AppColors.yellowColors,
//         ),
//         title: const Text(
//           "Make A Booking",
//           style: TextStyle(color: Colors.white,),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           _buildCartAndBell(url: AppImages.bell, context: context),
//           _buildCartAndBell(url: AppImages.cart, context: context),
//         ],
//       ),
//       backgroundColor: Colors.transparent,
//       extendBodyBehindAppBar: true,
//       body: Container(
//         padding: const EdgeInsets.only(top: 90),
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(AppImages.backGround),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           controller: scrollController,
//           padding: const EdgeInsets.only(
//             bottom: 50,
//             top: 10,
//             left: 10,
//             right: 10,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Appnavigation()
//                       .push(const AddAnotherServiceProvider(), context);
//                 },
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Service Provider',
//                       style: TextStyle(
//                           color: AppColors.yellowColors, fontSize: 18,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
//                     padding: const EdgeInsets.all(4),
//                     height: 70,
//                     width: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(120),
//                       border: Border.all(width: 2, color: Colors.green),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(120),
//                       child: Image.network(
//                         selectedStylistImage,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     selectedStylistName,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(color: Colors.white),
//                   )
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 margin: const EdgeInsets.symmetric(vertical: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.black54,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           monthName ?? 'January',
//                           style: TextStyle(
//                               color: AppColors.yellowColors, fontSize: 18),
//                         ),
//                         DropDownWidgetForMonths(
//                           onChanged: (_) {
//                             monthName = _;
//                             setState(() {});
//                           },
//                           list: questionList,
//                           select: monthName,
//                         ),
//
//                         // Container(
//                         //   padding: const EdgeInsets.symmetric(
//                         //       vertical: 2, horizontal: 10),
//                         //   decoration: BoxDecoration(
//                         //     border: Border.all(color: Colors.white, width: 1),
//                         //     borderRadius: BorderRadius.circular(16),
//                         //   ),
//                         //   child: Row(
//                         //     children: const [
//                         //       Text(
//                         //         'Show Month',
//                         //         style: TextStyle(
//                         //             color: Colors.white70, fontSize: 11),
//                         //       ),
//                         //       Icon(
//                         //         Icons.arrow_drop_down,
//                         //         color: Colors.white,
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//
//                         // Expanded(
//                         //   child: DropDownWidgetForMonths(
//                         //     onChanged: (_) {
//                         //       monthName = _;
//                         //     },
//                         //     list: questionList,
//                         //     select: monthName,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildDays(dayName: 'Mon', color: Colors.grey),
//                         _buildDays(dayName: 'Tue', color: Colors.grey),
//                         _buildDays(dayName: 'Wed', color: Colors.grey),
//                         _buildDays(dayName: 'Thr', color: Colors.grey),
//                         _buildDays(dayName: 'Fri', fontWeight: FontWeight.bold),
//                         _buildDays(dayName: 'Sat', fontWeight: FontWeight.bold),
//                         _buildDays(dayName: 'Sun', fontWeight: FontWeight.bold),
//                       ],
//                     ),
//
//                     /// day texts from 1 to 7
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildDate(
//                           date: '01',
//                           onTap: () {
//                             selectedDate = 1;
//                             setState(() {});
//                           },
//                           i: 1,
//                         ),
//                         _buildDate(
//                           date: '02',
//                           onTap: () {
//                             selectedDate = 2;
//                             setState(() {});
//                           },
//                           i: 2,
//                         ),
//                         _buildDate(
//                           date: '03',
//                           onTap: () {
//                             selectedDate = 3;
//                             setState(() {});
//                           },
//                           i: 3,
//                         ),
//                         _buildDate(
//                           date: '04',
//                           onTap: () {
//                             selectedDate = 4;
//                             setState(() {});
//                           },
//                           i: 4,
//                         ),
//                         _buildDate(
//                           date: '05',
//                           onTap: () {
//                             selectedDate = 5;
//                             setState(() {});
//                           },
//                           i: 5,
//                         ),
//                         _buildDate(
//                           date: '06',
//                           onTap: () {
//                             selectedDate = 6;
//                             setState(() {});
//                           },
//                           i: 6,
//                         ),
//                         _buildDate(
//                           date: '07',
//                           onTap: () {
//                             selectedDate = 7;
//                             setState(() {});
//                           },
//                           i: 7,
//                         ),
//                       ],
//                     ),
//
//                     /// day texts from 8 to 14
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildDate(
//                           date: '08',
//                           onTap: () {
//                             selectedDate = 8;
//                             setState(() {});
//                           },
//                           i: 8,
//                         ),
//                         _buildDate(
//                           date: '09',
//                           onTap: () {
//                             selectedDate = 9;
//                             setState(() {});
//                           },
//                           i: 9,
//                         ),
//                         _buildDate(
//                           date: '10',
//                           onTap: () {
//                             selectedDate = 10;
//                             setState(() {});
//                           },
//                           i: 10,
//                         ),
//                         _buildDate(
//                           date: '11',
//                           onTap: () {
//                             selectedDate = 11;
//                             setState(() {});
//                           },
//                           i: 11,
//                         ),
//                         _buildDate(
//                           date: '12',
//                           onTap: () {
//                             selectedDate = 12;
//                             setState(() {});
//                           },
//                           i: 12,
//                         ),
//                         _buildDate(
//                           date: '13',
//                           onTap: () {
//                             selectedDate = 13;
//                             setState(() {});
//                           },
//                           i: 13,
//                         ),
//                         _buildDate(
//                           date: '14',
//                           onTap: () {
//                             selectedDate = 14;
//                             setState(() {});
//                           },
//                           i: 14,
//                         ),
//                       ],
//                     ),
//
//                     /// day texts from 15 to 21
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildDate(
//                           date: '15',
//                           onTap: () {
//                             selectedDate = 15;
//                             setState(() {});
//                           },
//                           i: 15,
//                         ),
//                         _buildDate(
//                           date: '16',
//                           onTap: () {
//                             selectedDate = 16;
//                             setState(() {});
//                           },
//                           i: 16,
//                         ),
//                         _buildDate(
//                           date: '17',
//                           onTap: () {
//                             selectedDate = 17;
//                             setState(() {});
//                           },
//                           i: 17,
//                         ),
//                         _buildDate(
//                           date: '18',
//                           onTap: () {
//                             selectedDate = 18;
//                             setState(() {});
//                           },
//                           i: 18,
//                         ),
//                         _buildDate(
//                           date: '19',
//                           onTap: () {
//                             selectedDate = 19;
//                             setState(() {});
//                           },
//                           i: 19,
//                         ),
//                         _buildDate(
//                           date: '20',
//                           onTap: () {
//                             selectedDate = 20;
//                             setState(() {});
//                           },
//                           i: 20,
//                         ),
//                         _buildDate(
//                           date: '21',
//                           onTap: () {
//                             selectedDate = 21;
//                             setState(() {});
//                           },
//                           i: 21,
//                         ),
//                       ],
//                     ),
//
//                     /// day texts from 22 to 31
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         _buildDate(
//                           date: '29',
//                           onTap: () {
//                             selectedDate = 29;
//                             setState(() {});
//                           },
//                           i: 29,
//                         ),
//                         _buildDate(
//                           date: '30',
//                           onTap: () {
//                             selectedDate = 30;
//                             setState(() {});
//                           },
//                           i: 30,
//                         ),
//                         _buildDate(
//                           date: '31',
//                           onTap: () {
//                             selectedDate = 31;
//                             setState(() {});
//                           },
//                           i: 31,
//                         ),
//                         _buildDate(date: '', i: 32, onTap: () {}),
//                         _buildDate(date: '', i: 32, onTap: () {}),
//                         _buildDate(date: '', i: 32, onTap: () {}),
//                         _buildDate(date: '', i: 32, onTap: () {}),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const Divider(
//                 thickness: 3,
//                 color: Colors.grey,
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.add,
//                       color: Colors.white,
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'Available Time Slot',
//                       style: TextStyle(
//                           color: AppColors.yellowColors, fontSize: 18,),
//                     ),
//                   ],
//                 ),
//               ),
//
//               /// first time slot
//               Row(
//                 children: [
//                   _buildTimeSlots(
//                     slot: '16:30',
//                     i: 0,
//                   ),
//                   _buildTimeSlots(
//                     slot: '16:45',
//                     i: 1,
//                   ),
//                   _buildTimeSlots(
//                     slot: '17:00',
//                     i: 2,
//                   ),
//                   _buildTimeSlots(
//                     slot: '17:15',
//                     i: 3,
//                   ),
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               ),
//
//               /// second time slot
//               Row(
//                 children: [
//                   _buildTimeSlots(
//                     slot: '17:30',
//                     i: 4,
//                   ),
//                   _buildTimeSlots(
//                     slot: '17:45',
//                     i: 5,
//                   ),
//                   _buildTimeSlots(
//                     slot: '18:00',
//                     i: 6,
//                   ),
//                   _buildTimeSlots(
//                     slot: '18:15',
//                     i: 7,
//                   ),
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               ),
//
//               /// Third time slot
//               Row(
//                 children: [
//                   _buildTimeSlots(
//                     slot: '18:30',
//                     i: 8,
//                   ),
//                   _buildTimeSlots(
//                     slot: '18:45',
//                     i: 9,
//                   ),
//                   _buildTimeSlots(
//                     slot: '19:00',
//                     i: 10,
//                   ),
//                   _buildTimeSlots(
//                     slot: '19:15',
//                     i: 11,
//                   ),
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 60, bottom: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: const [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         'Finish at',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         '4:05 pm',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                 ),
//               ),
//               _buildButtonContinue(
//                 text: 'Add Another Service Provider',
//                 onTap: () {
//                   Appnavigation().push(const AddAnotherServiceProvider(), context);
//                   // Navigator.of(context).push(MaterialPageRoute(
//                   //     builder: (context) => const BookingDonePage()));
//                 },
//               ),
//               selectedTime >= 0
//                   ? _buildButtonContinue(
//                       text: 'Continue',
//                       onTap: () {
//                         Appnavigation().push(const AddNewCustomer(), context);
//                         // Navigator.of(context).pop();
//                         // Navigator.of(context).pop();
//                         // Navigator.of(context).pushReplacement(
//                         //     MaterialPageRoute(builder: (context) => CheckInPage()));
//                       },
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//         ),
//         height: MediaQuery.of(context).size.height,
//       ),
//     );
//   }
//
//   Widget _buildButtonContinue({
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 70, bottom: 5, top: 0, right: 70),
//       child: Center(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: TextButton(
//             style: TextButton.styleFrom(
//               backgroundColor: AppColors.yellowColors,
//             ),
//             onPressed: onTap,
//             child: Padding(
//               padding: const EdgeInsets.all(4),
//               child: Text(
//                 text,
//                 style: const TextStyle(color: Colors.black),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   int selectedTime = -1;
//   ScrollController scrollController = ScrollController();
//
//   Widget _buildTimeSlots({
//     required String slot,
//     required int i,
//     // required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         selectedTime = i;
//         setState(() {});
//         scrollController.animateTo(
//           800,
//           duration: const Duration(seconds: 2),
//           curve: Curves.easeIn,
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//         decoration: BoxDecoration(
//           color:
//               selectedTime == i ? AppColors.yellowColors : Colors.transparent,
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(color: AppColors.yellowColors, width: 2),
//         ),
//         child: Text(
//           slot,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//           ),
//         ),
//         margin: const EdgeInsets.only(bottom: 10),
//       ),
//     );
//   }
//
//   Widget _buildDays({
//     required String dayName,
//     FontWeight? fontWeight,
//     Color? color,
//   }) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 20, bottom: 15),
//         child: Text(
//           dayName,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: color ?? Colors.white70,
//               fontSize: 15,
//               fontWeight: fontWeight),
//         ),
//       ),
//     );
//   }
//
//   int selectedDate = 13;
//
//   Widget _buildDate({
//     String? date,
//     required int i,
//     required VoidCallback onTap,
//   }) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Padding(
//           padding: const EdgeInsets.only(bottom: 15),
//           child: selectedDate == i
//               ? Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                         color: AppColors.yellowColors,
//                       ),
//                       shape: BoxShape.circle),
//                   child: Center(
//                     child: Text(
//                       date ?? '',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: AppColors.yellowColors,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(4),
//                 )
//               : Text(
//                   date ?? '',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.white70,
//                     fontSize: 13,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCartAndBell({
//     required String url,
//     required BuildContext context,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         right: 10,
//       ),
//       child: GestureDetector(
//         child: Image.asset(url),
//         onTap: () {},
//       ),
//     );
//   }
// }

import 'package:barber_app/constants.dart';
import 'package:barber_app/model/chekOutModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:barber_app/src/ui/pages/check_out_page.dart';
import 'package:barber_app/src/ui/widgets/drop_down.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';
import '../../utils/images.dart';


class MakeBookingPage extends StatefulWidget {
  const MakeBookingPage({Key? key}) : super(key: key);

  @override
  _MakeBookingPageState createState() => _MakeBookingPageState();
}

class _MakeBookingPageState extends State<MakeBookingPage> {
  TimeOfDay selectedTime=  TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  TimeOfDay selectedTimeTo=  TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  String selectedTime1 = '08:00';
  List<String> slots= [];
  bool isVisible = false;

   List<String> finalSlots = ['08:00','08:15','08:30','08:45',
     '09:00',
     '09:15',
     '09:30',
     '09:45',
     '10:00',
     '10:15',
     '10:30',
     '10:45',
     '11:00',
     '11:15',
     '11:30',
     '11:45',
     '12:00',
     '12:15',
     '12:30',
     '12:45',
     '13:00',
     '13:15',
     '13:30',
     '13:45',
     '14:00',
     '14:15',
     '14:30',
     '14:45',
     '15:00',
     '15:15',
     '15:30',
     '15:45',
     '16:00',
     '16:15',
     '16:30',
     '16:45',
     '17:00',
     '17:15',
     '17:30',
     '17:45',
     '18:00',
     '18:15',
     '18:30',
     '18:45',
   ];

  List<String> questionList = <String>[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  String slot1="";
  String slot2="";
  String slot3="";
  String slot4="";
  String slot5="";
  String slot6="";
  String slot7="";
  String slot8="";
  String slot9="";
  String slot10="";
  String slot11="";
  String slot12="";
  String slot13="";
  String slot14="";
  String slot15="";
  String slot16="";
  String slot17="";
  String slot18="";
  String slot19="";
  String slot20="";
  String slot21="";
  String slot22="";
  String slot23="";
  String slot24="";
  String slot25="";
  String slot26="";
  String slot27="";
  String slot28="";
  String slot29="";
  String slot30="";
  String slot31="";
  String slot32="";
  String slot33="";
  String slot34="";
  String slot35="";
  String slot36="";
  String slot37="";
  String slot38="";
  String slot39="";
  String slot40="";
  String slot41="";
  String slot42="";
  String slot43="";
  String slot44="";


  List<String> booked = [
    "", "", "", "", "", "", "", "", "", "", "", "","","","","","","","","","","","","","","","","","","","","","","","","","", "", "", "", "", "", "", "","booked"
  ];

  String? _monthName;

  final _auth =FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  List<CheckoutModel> bookings =[];
  //this year bookings
  List<CheckoutModel> bookings1 =[];


  //Bookings today
  List<CheckoutModel> bookings2 =[];
  List<CheckoutModel> allBookings =[];
  Future<void> _getData() async {
    try{
      QuerySnapshot querySnapshot = await _fireStore.collection("bookings").where("stylistId", isEqualTo: selectedStylistId,).get();
      bookings = List.from(querySnapshot.docs.map((doc)=>CheckoutModel.fromSnapshot(doc),));
      // inspection = List.from(querySnapshot.docs.map((doc)=>InspectionModel.fromSnapshot(doc),));
      allBookings = bookings;
      for(int i =0; i<allBookings.length; i ++){
        if(allBookings[i].year == DateTime.now().year.toString()){
          bookings1.add(allBookings[i]);
        }
      }
      get();
      setState((){});

    }catch(e){
      print("Error");
      print(e);
    }
  }

  void get(){
    slots.clear();
    bookings2.clear();
    for(int i=0; i<bookings1.length; i++){
      if(bookings1[i].month == _monthName){
        if(bookings1[i].day ==DateTime.now().day){
          bookings2.add(bookings1[i]);
          slots.add(bookings1[i].slot.toString());

        }
      }
    }
    for(int j =0; j<bookings2.length; j++){
      if(bookings2[j].slot == "08:00"){
        slot1 = "booked";
        booked[0] = "booked";
      }
      if(bookings2[j].slot == "08:15"){
        slot2 = "booked";
        booked[1] = "booked";
      }
      if(bookings2[j].slot == "08:30"){
        slot3 = "booked";
        booked[2] = "booked";
      }
      if(bookings2[j].slot == "08:45"){
        slot4 = "booked";
        booked[3] = "booked";
      }
      if(bookings2[j].slot == "09:00"){
        slot5 = "booked";
        booked[4] = "booked";
      }
      if(bookings2[j].slot == "09:15"){
        slot6 = "booked";
        booked[5] = "booked";
      }
      if(bookings2[j].slot == "09:30"){
        slot7 = "booked";
        booked[6] = "booked";
      }
      if(bookings2[j].slot == "09:45"){
        slot8 = "booked";
        booked[7] = "booked";
      }
      if(bookings2[j].slot == "10:00"){
        slot9 = "booked";
        booked[8] = "booked";
      }
      if(bookings2[j].slot == "10:15"){
        slot10 = "booked";
        booked[9] = "booked";
      }
      if(bookings2[j].slot == "10:30"){
        slot11 = "booked";
        booked[10] = "booked";
      }
      if(bookings2[j].slot == "10:45"){
        slot12 = "booked";
        booked[11] = "booked";
      }
      if(bookings2[j].slot == "11:00"){
        slot13 = "booked";
        booked[12] = "booked";
      }
      if(bookings2[j].slot == "11:15"){
        slot14 = "booked";
        booked[13] = "booked";
      }
      if(bookings2[j].slot == "11:30"){
        slot15 = "booked";
        booked[14] = "booked";
      }
      if(bookings2[j].slot == "11:45"){
        slot16 = "booked";
        booked[15] = "booked";
      }
      if(bookings2[j].slot == "12:00"){
        slot17 = "booked";
        booked[16] = "booked";
      }
      if(bookings2[j].slot == "12:15"){
        slot18 = "booked";
        booked[17] = "booked";
      }
      if(bookings2[j].slot == "12:30"){
        slot19 = "booked";
        booked[18] = "booked";
      }
      if(bookings2[j].slot == "12:45"){
        slot20 = "booked";
        booked[19] = "booked";
      }
      if(bookings2[j].slot == "13:00"){
        slot21 = "booked";
        booked[20] = "booked";
      }
      if(bookings2[j].slot == "13:15"){
        slot22 = "booked";
        booked[21] = "booked";
      }
      if(bookings2[j].slot == "13:30"){
        slot23 = "booked";
        booked[22] = "booked";
      }
      if(bookings2[j].slot == "13:45"){
        slot24 = "booked";
        booked[23] = "booked";
      }
      if(bookings2[j].slot == "14:00"){
        slot25 = "booked";
        booked[24] = "booked";
      }
      if(bookings2[j].slot == "14:15"){
        slot26 = "booked";
        booked[25] = "booked";
      }
      if(bookings2[j].slot == "14:30"){
        slot27 = "booked";
        booked[26] = "booked";
      }
      if(bookings2[j].slot == "14:45"){
        slot28 = "booked";
        booked[27] = "booked";

      }
      if(bookings2[j].slot == "15:00"){
        slot29 = "booked";
        booked[28] = "booked";

      }
      if(bookings2[j].slot == "15:15"){
        slot30 = "booked";
        booked[29] = "booked";

      }
      if(bookings2[j].slot == "15:30"){
        slot31 = "booked";
        booked[30] = "booked";

      }
      if(bookings2[j].slot == "15:45"){
        slot32 = "booked";
        booked[31] = "booked";

      }

      if(bookings2[j].slot == "16:00"){
        slot33 = "booked";
        booked[32] = "booked";

      }
      if(bookings2[j].slot == "16:15"){
        slot34 = "booked";
        booked[33] = "booked";
      }
      if(bookings2[j].slot == "16:30"){
        slot35 = "booked";
        booked[34] = "booked";

      }
      if(bookings2[j].slot == "16:45"){
        slot36 = "booked";
        booked[35] = "booked";

      }
      if(bookings2[j].slot == "17:00"){
        slot37 = "booked";
        booked[36] = "booked";

      }
      if(bookings2[j].slot == "17:15"){
        slot38 = "booked";
        booked[37] = "booked";

      }
      if(bookings2[j].slot == "17:30"){
        slot39 = "booked";
        booked[38] = "booked";

      }
      if(bookings2[j].slot == "17:45"){
        slot40 = "booked";
        booked[39] = "booked";

      }
      if(bookings2[j].slot == "18:00"){
        slot41 = "booked";
        booked[40] = "booked";

      }
      if(bookings2[j].slot == "18:15"){
        slot42 = "booked";
        booked[41] = "booked";
      }
      if(bookings2[j].slot == "18:30"){
        slot43 = "booked";
        booked[42] = "booked";
      }
      if(bookings2[j].slot == "18:45"){
        slot44 = "booked";
        booked[43] = "booked";
      }
    }

    if(bookings2.isEmpty){
      slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
          slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
    }
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mon = DateTime.now().month;
    _monthName = questionList[DateTime.now().month -1];
    _selectedDate = DateTime.now().day;
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // bottomNavigationBar: CustomBottomSheet(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.yellowColors,
        ),
        title: const Text(
          "Make A Booking",
          style: TextStyle(color: Colors.white,),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          // _buildCartAndBell(url: AppImages.bell, context: context),
          // _buildCartAndBell(url: AppImages.cart, context: context),
        ],
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        padding: const EdgeInsets.only(top: 90),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGround),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.only(
            bottom: 50,
            top: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                    padding: const EdgeInsets.all(4),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(120),
                      border: Border.all(width: 2, color: Colors.green),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.network(
                        selectedStylistImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    selectedStylistName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _monthName ?? 'January',
                          style: TextStyle(
                              color: AppColors.yellowColors, fontSize: 18),
                        ),
                        DropDownWidgetForMonths(
                          onChanged: (_) {
                            _monthName = _;
                            if(_monthName =="January"){
                              mon= 1;
                            }
                            if(_monthName =="February") {
                              mon = 2;
                            }
                            if(_monthName =="March"){
                              mon= 3;
                            }
                            if(_monthName =="April"){
                              mon= 4;
                            }
                            if(_monthName =="May"){
                              mon= 5;
                            }
                            if(_monthName =="June"){
                              mon= 6;
                            }
                            if(_monthName =="July"){
                              mon= 7;
                            }
                            if(_monthName =="August"){
                              mon= 8;
                            }
                            if(_monthName =="September"){
                              mon= 9;
                            }
                            if(_monthName =="October"){
                              mon= 10;
                            }
                            if(_monthName =="November"){
                              mon= 11;
                            }
                            if(_monthName =="December"){
                              mon= 12;
                            }
                            get();
                            setState(() {

                            });
                          },
                          list: questionList,
                          select: _monthName,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDays(dayName: 'Mon', color: Colors.grey),
                        _buildDays(dayName: 'Tue', color: Colors.grey),
                        _buildDays(dayName: 'Wed', color: Colors.grey),
                        _buildDays(dayName: 'Thr', color: Colors.grey),
                        _buildDays(dayName: 'Fri', fontWeight: FontWeight.bold),
                        _buildDays(dayName: 'Sat', fontWeight: FontWeight.bold),
                        _buildDays(dayName: 'Sun', fontWeight: FontWeight.bold),
                      ],
                    ),

                    /// day texts from 1 to 7
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        _buildDate(
                          date: '01',
                          onTap: () {
                            selectedDate = 1;
                            _selectedDate = 1;
                            slots.clear();
                            bookings2.clear();
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==1){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());

                                }
                              }
                            }
                            for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }

                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 1,
                        ),
                        _buildDate(
                          date: '02',
                          onTap: () {
                            selectedDate = 2;
                            slots.clear();
                            bookings2.clear();
                            _selectedDate = 2;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==2){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                            for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }

                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 2,
                        ),
                        _buildDate(
                          date: '03',
                          onTap: () {
                            selectedDate = 3;
                            slots.clear();
                            bookings2.clear();
                            _selectedDate = 3;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==3){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                            for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 3,
                        ),
                        _buildDate(
                          date: '04',
                          onTap: () {
                            selectedDate = 4;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 4;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==4){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 4,
                        ),
                        _buildDate(
                          date: '05',
                          onTap: () {
                            selectedDate = 5;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 5;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==5){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 5,
                        ),
                        _buildDate(
                          date: '06',
                          onTap: () {
                            selectedDate = 6;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 6;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==6){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 6,
                        ),
                        _buildDate(
                          date: '07',
                          onTap: () {
                            selectedDate = 7;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 7;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==7){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 7,
                        ),
                      ],
                    ),

                    /// day texts from 8 to 14
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        _buildDate(
                          date: '08',
                          onTap: () {
                            selectedDate = 8;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 8;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==8){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 8,
                        ),
                        _buildDate(
                          date: '09',
                          onTap: () {
                            selectedDate = 9;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 9;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==9){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                            for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                                print(slot1);
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "13:00"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "15:00"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "16:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot20 = "booked";
                              }
                            }
                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = "";
                            }
                            setState(() {});
                          },
                          i: 9,
                        ),
                        _buildDate(
                          date: '10',
                          onTap: () {
                            selectedDate = 10;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 10;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==10){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 10,
                        ),
                        _buildDate(
                          date: '11',
                          onTap: () {
                            selectedDate = 11;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 11;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==11){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 11,
                        ),
                        _buildDate(
                          date: '12',
                          onTap: () {
                            selectedDate = 12;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 12;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==12){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 12,
                        ),
                        _buildDate(
                          date: '13',
                          onTap: () {
                            selectedDate = 13;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 13;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==13){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 13,
                        ),
                        _buildDate(
                          date: '14',
                          onTap: () {
                            selectedDate = 14;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 14;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==14){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 14,
                        ),
                      ],
                    ),

                    /// day texts from 15 to 21
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDate(
                          date: '15',
                          onTap: () {
                            selectedDate = 15;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 15;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==15){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 15,
                        ),
                        _buildDate(
                          date: '16',
                          onTap: () {
                            selectedDate = 16;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 16;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==16){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 16,
                        ),
                        _buildDate(
                          date: '17',
                          onTap: () {
                            selectedDate = 17;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 17;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==17){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 17,
                        ),
                        _buildDate(
                          date: '18',
                          onTap: () {
                            selectedDate = 18;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 18;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==18){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 18,
                        ),
                        _buildDate(
                          date: '19',
                          onTap: () {
                            selectedDate = 19;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 19;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==19){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                            for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }else{
                                slot1 = "";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot2 = "booked";
                              }else{
                                slot2 = "";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot3 = "booked";
                              }else{
                                slot3 = "";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot4 = "booked";
                              }else{
                                slot4="";}
                              if(bookings2[j].slot == "10:00"){
                                slot5 = "booked";
                              }else{
                                slot5 ="";}
                              if(bookings2[j].slot == "10:30"){
                                slot6 = "booked";
                              }else{
                                slot6 = "";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot7 = "booked";
                              }else{
                                slot7 = "";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot8 = "booked";
                              }else{
                                slot8 = "";}
                              if(bookings2[j].slot == "12:00"){
                                slot9 = "booked";
                              }else{
                                slot9 = "";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot10 = "booked";
                              }else{
                                slot10 ="";
                              }
                              if(bookings2[j].slot == "13:00"){
                                slot11 = "booked";
                              }else{
                                slot11 = "";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot12 = "booked";
                              }else{
                                slot12 = "";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot13 = "booked";
                              }else{
                                slot13 = "";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot14 = "booked";
                              }else{
                                slot14 = "";
                              }
                              if(bookings2[j].slot == "15:00"){
                                slot15 = "booked";
                              }else{
                                slot15 = "";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot16 = "booked";
                              }else{
                                slot16 = "";
                              }
                              if(bookings2[j].slot == "16:00"){
                                slot17 = "booked";
                              }else{
                                slot17 = "";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot18 = "booked";
                              }else{
                                slot18 = "";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot19 = "booked";
                              }else{
                                slot19 = "";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot20 = "booked";
                              }else{
                                slot20 = "";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = "";
                            }
                            setState(() {});
                          },
                          i: 19,
                        ),
                        _buildDate(
                          date: '20',
                          onTap: () {
                            selectedDate = 20;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 20;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==20){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 20,
                        ),
                        _buildDate(
                          date: '21',
                          onTap: () {
                            selectedDate = 21;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 21;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==21){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 21,
                        ),
                      ],
                    ),

                    /// day texts from 22 to 31
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDate(
                          date: '22',
                          onTap: () {
                            selectedDate = 22;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 22;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==22){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 22,
                        ),
                        _buildDate(
                          date: '23',
                          onTap: () {
                            selectedDate = 23;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 23;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==23){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i: 23,
                        ),
                        _buildDate(
                          date: '24',
                          onTap: () {
                            selectedDate = 24;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 24;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==24){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:24,
                        ),
                        _buildDate(
                          date: '25',
                          onTap: () {
                            selectedDate = 25;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 25;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==25){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:25,
                        ),
                        _buildDate(
                          date: '26',
                          onTap: () {
                            selectedDate = 26;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 26;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==26){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:26,
                        ),
                        _buildDate(
                          date: '27',
                          onTap: () {
                            selectedDate = 27;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 27;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==27){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:27,
                        ),
                        _buildDate(
                          date: '28',
                          onTap: () {
                            selectedDate = 28;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 28;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==28){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:28,
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDate(
                          date: '29',
                          onTap: () {
                            selectedDate = 29;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 29;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==29){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:29,
                        ),
                        _buildDate(
                          date: '30',
                          onTap: () {
                            selectedDate = 30;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 30;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==30){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:30,
                        ),
                        _buildDate(
                          date: '31',
                          onTap: () {
                            selectedDate = 31;
                            bookings2.clear();
                            slots.clear();
                            _selectedDate = 31;
                            for(int i=0; i<bookings1.length; i++){
                              if(bookings1[i].month == _monthName){
                                if(bookings1[i].day ==31){
                                  bookings2.add(bookings1[i]);
                                  slots.add(bookings1[i].slot.toString());
                                }
                              }
                            }
                             for(int j =0; j<bookings2.length; j++){
                              if(bookings2[j].slot == "08:00"){
                                slot1 = "booked";
                              }
                              if(bookings2[j].slot == "08:15"){
                                slot2 = "booked";
                              }
                              if(bookings2[j].slot == "08:30"){
                                slot3 = "booked";
                              }
                              if(bookings2[j].slot == "08:45"){
                                slot4 = "booked";
                              }
                              if(bookings2[j].slot == "09:00"){
                                slot5 = "booked";
                              }
                              if(bookings2[j].slot == "09:15"){
                                slot6 = "booked";
                              }
                              if(bookings2[j].slot == "09:30"){
                                slot7 = "booked";
                              }
                              if(bookings2[j].slot == "09:45"){
                                slot8 = "booked";
                              }
                              if(bookings2[j].slot == "10:00"){
                                slot9 = "booked";
                              }
                              if(bookings2[j].slot == "10:15"){
                                slot10 = "booked";
                              }
                              if(bookings2[j].slot == "10:30"){
                                slot11 = "booked";
                              }
                              if(bookings2[j].slot == "10:45"){
                                slot12 = "booked";
                              }
                              if(bookings2[j].slot == "11:00"){
                                slot13 = "booked";
                              }
                              if(bookings2[j].slot == "11:15"){
                                slot14 = "booked";
                              }
                              if(bookings2[j].slot == "11:30"){
                                slot15 = "booked";
                              }
                              if(bookings2[j].slot == "11:45"){
                                slot16 = "booked";
                              }
                              if(bookings2[j].slot == "12:00"){
                                slot17 = "booked";
                              }
                              if(bookings2[j].slot == "12:15"){
                                slot18 = "booked";
                              }
                              if(bookings2[j].slot == "12:30"){
                                slot19 = "booked";
                              }
                              if(bookings2[j].slot == "12:45"){
                                slot20 = "booked";
                              }

                              if(bookings2[j].slot == "13:00"){
                                slot21 = "booked";
                              }
                              if(bookings2[j].slot == "13:15"){
                                slot22 = "booked";
                              }
                              if(bookings2[j].slot == "13:30"){
                                slot23 = "booked";
                              }
                              if(bookings2[j].slot == "13:45"){
                                slot24 = "booked";
                              }
                              if(bookings2[j].slot == "14:00"){
                                slot25 = "booked";
                              }
                              if(bookings2[j].slot == "14:15"){
                                slot26 = "booked";
                              }
                              if(bookings2[j].slot == "14:30"){
                                slot27 = "booked";
                              }
                              if(bookings2[j].slot == "14:45"){
                                slot28 = "booked";
                              }

                              if(bookings2[j].slot == "15:00"){
                                slot29 = "booked";
                              }
                              if(bookings2[j].slot == "15:15"){
                                slot30 = "booked";
                              }
                              if(bookings2[j].slot == "15:30"){
                                slot31 = "booked";
                              }
                              if(bookings2[j].slot == "15:45"){
                                slot32 = "booked";
                              }

                              if(bookings2[j].slot == "16:00"){
                                slot33 = "booked";
                              }
                              if(bookings2[j].slot == "16:15"){
                                slot34 = "booked";
                              }
                              if(bookings2[j].slot == "16:30"){
                                slot35 = "booked";
                              }
                              if(bookings2[j].slot == "16:45"){
                                slot36 = "booked";
                              }
                              if(bookings2[j].slot == "17:00"){
                                slot37 = "booked";
                              }
                              if(bookings2[j].slot == "17:15"){
                                slot38 = "booked";
                              }
                              if(bookings2[j].slot == "17:30"){
                                slot39 = "booked";
                              }
                              if(bookings2[j].slot == "17:45"){
                                slot40 = "booked";
                              }

                              if(bookings2[j].slot == "18:00"){
                                slot41 = "booked";
                              }
                              if(bookings2[j].slot == "18:15"){
                                slot42 = "booked";
                              }
                              if(bookings2[j].slot == "18:30"){
                                slot43 = "booked";
                              }
                              if(bookings2[j].slot == "18:45"){
                                slot44 = "booked";
                              }
                            }

                            if(bookings2.isEmpty){
                              slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 = slot10 = slot11 = slot12 = slot13 = slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = slot21 = slot22 =
                                  slot23 = slot24 = slot25 =slot26 =slot27 =slot28 =slot29 =slot30 =slot31 =slot32 =slot33 =slot34 =slot35 = slot36 =slot37 =slot38 = slot39 = slot40 =slot41 =slot42 =slot43 =slot44 ="";
                            }
                            setState(() {});
                          },
                          i:31,
                        ),
                        _buildDate(date: '', i: 32, onTap: () {}),
                        _buildDate(date: '', i: 32, onTap: () {}),
                        _buildDate(date: '', i: 32, onTap: () {}),
                        _buildDate(date: '', i: 32, onTap: () {}),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 3,
                color: Colors.grey,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    // const Icon(
                    //   Icons.add,
                    //   color: Colors.white,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Booked Time Slot',
                      style: TextStyle(
                        color: AppColors.yellowColors, fontSize: 18,),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width *0.9,
                child: Center(
                  child: GridView.count(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    crossAxisCount: 4,
                    children: <Widget>[
                      for(int i =0; i < bookings2.length; i ++)
                         Text('${bookings2[i].slot.toString()} - ${bookings2[i].slotTo.toString()}', style: const TextStyle(color: Colors.white),)

                    ],
                  ),
                ),
              ),



              Text('Selected Time: $selectedTimeFrom', style: TextStyle(color: Colors.white),),
              Text('Selected TimeTo: $selectedTimeTo1', style: TextStyle(color: Colors.white),),



              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(
                     onPressed: (){
                       _showTimePicker();
                     }, child: const Text("Change time"))
               ],
             ),


             Visibility(
               visible: isVisible,
               child: _buildButtonContinue(
                  text: 'Continue',
                  onTap: () {
                    selectedDate = _selectedDate;
                    selectedSlot = _selectedSlot;
                    selectedSlot1 = _selectedSlot1;
                    selectedSlot2 = _selectedSlot2;
                    selectedSlot3 = _selectedSlot3;
                    selectedSlot4 = _selectedSlot4;
                    selectedSlot5 = _selectedSlot5;
                    selectedSlot6 = _selectedSlot6;
                    selectedSlot7 = _selectedSlot7;
                    selectedSlot8 = _selectedSlot8;

                    selectedMonth = _monthName!;
                    Appnavigation().push(const AddNewCustomer(), context);
                  },
                ),
             )
                  // : const SizedBox(),
            ],
          ),
        ),
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

  Widget _buildButtonContinue({
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, bottom: 5, top: 0, right: 70),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.yellowColors,
            ),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<int> _selectedTime = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
  String _selectedSlot = "-1";
  String _selectedSlot1 = "-1";
  String _selectedSlot2 = "-1";
  String _selectedSlot3 = "-1";
  String _selectedSlot4 = "-1";
  String _selectedSlot5 = "-1";
  String _selectedSlot6 = "-1";
  String _selectedSlot7 = "-1";
  String _selectedSlot8 = "-1";

  ScrollController scrollController = ScrollController();

  Widget _buildTimeSlots({
    // required bool booked,
    required String slot,
    required int i,
    // required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {

        _selectedSlot1 = _selectedSlot2 = _selectedSlot3 = _selectedSlot4 = _selectedSlot5 = _selectedSlot6 = _selectedSlot7 = _selectedSlot8 = '-1';
        for(int i =0; i < _selectedTime.length; i ++){
          _selectedTime[i] = -1;
        }
        _selectedSlot = slot;
        _selectedTime[i] = i;
        // setState(() {});
        if(serviceTime>15){
          ///Commented the line below to not select other time slots
          // _selectedTime[i+1] = i +1;
          if(i != 43) {
            _selectedSlot1 = finalSlots[i + 1];
            // Fluttertoast.showToast(msg: _selectedSlot1);
          }
          if(booked[i+1] == "booked"){
            Get.defaultDialog(
              title: "Error",
              content: Column(
                children:  [
                  const Center(child: Text("Slot not available")),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(onPressed: (){
                        Get.back();
                      }, child: Text("Ok")),
                    ],
                  )
                ],
              )
            );
          }
        }
        if(serviceTime>30){
          // _selectedTime[i+2] = i +2;

          if(i != 42 || i!=43) {
            _selectedSlot2 = finalSlots[i + 2];
          }

          if(booked[i+2] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        if(serviceTime>45){
          // _selectedTime[i+3] = i +3;
          if(i!= 41|| i != 42 || i!=43) {
            _selectedSlot3 = finalSlots[i + 3];
          }
          if(booked[i+3] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        if(serviceTime>60){
          // _selectedTime[i+4] = i +4;
          if(i!= 40||i!= 41|| i != 42 || i!=43) {
            _selectedSlot4 = finalSlots[i + 4];
          }

          if(booked[i+4] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        if(serviceTime>75){
          // _selectedTime[i+5] = i +5;

          if(i!= 39||i!= 40||i!= 41|| i != 42 || i!=43) {
            _selectedSlot5 = finalSlots[i + 5];
          }

          if(booked[i+5] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        if(serviceTime>90){
          // _selectedTime[i+6] = i +6;

          if(i!= 38||i!= 39||i!= 40||i!= 41|| i != 42 || i!=43) {
            _selectedSlot6 = finalSlots[i + 6];
          }

          if(booked[i+6] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        if(serviceTime>105){
          // _selectedTime[i+7] = i +7;
          if(i!= 37||i!= 38||i!= 39||i!= 40||i!= 41|| i != 42 || i!=43) {
            _selectedSlot7 = finalSlots[i + 7];
          }
          if(booked[i+7] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        if(serviceTime>120){
          // _selectedTime[i+8] = i +8;
          if(i!= 36||i!= 37||i!= 38||i!= 39||i!= 40||i!= 41|| i != 42 || i!=43) {
            _selectedSlot8 = finalSlots[i + 8];
          }

          if(booked[i+8] == "booked"){
            Get.defaultDialog(
                title: "Error",
                content: Column(
                  children:  [
                    const Center(child: Text("Slot not available")),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Ok")),
                      ],
                    )
                  ],
                )
            );
          }
        }
        setState(() {});
        scrollController.animateTo(
          800,
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: BoxDecoration(
          color:
          _selectedTime[i] == i ? AppColors.yellowColors : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.yellowColors, width: 2),
        ),
        child: Text(
          slot,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        margin: const EdgeInsets.only(bottom: 10),
      ),
    );
  }

  Widget _booked(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color:
        Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.transparent, width: 2),
      ),
      child: const Text(
        "0000:",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.transparent,
          fontSize: 14,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 10),
    );
  }

  Widget _buildDays({
    required String dayName,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 15),
        child: Text(
          dayName,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color ?? Colors.white70,
              fontSize: 15,
              fontWeight: fontWeight),
        ),
      ),
    );
  }

  int _selectedDate = 13;

  Widget _buildDate({
    String? date,
    required int i,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: _selectedDate == i
              ? Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.yellowColors,
                ),
                shape: BoxShape.circle),
            child: Center(
              child: Text(
                date ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.yellowColors,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            padding: const EdgeInsets.all(4),
          )
              : Text(
            date ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartAndBell({
    required String url,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: GestureDetector(
        child: Image.asset(url),
        onTap: () {},
      ),
    );
  }



  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? Container(),
        );
      },
    ).then((value) {
      setState(() {
        selectedTime = value!;
        String hour = "09";
        String minute = "09";
        var replacingTime = selectedTime!.replacing(
            hour: selectedTime!.hour,
            minute: selectedTime!.minute);

        if(replacingTime.hour<10){
          hour = "0${replacingTime.hour.toString()}";
        }else{
          hour = replacingTime.hour.toString();
        }

        if(replacingTime.minute<10){
          minute = "0${replacingTime.minute.toString()}";
        }else{
          minute = replacingTime.minute.toString();
        }


        String formattedTime = hour +
            ":" +
            minute;

        selectedTime1 = formattedTime;

        final now = DateTime.now();

        DateTime newT = DateTime(now.year, mon, selectedDate, selectedTime.hour, selectedTime.minute);
        DateTime h = newT.add(Duration(minutes: serviceTime));

        selectedTimeTo = TimeOfDay(hour: h.hour, minute: h.minute);

       int hour1 = selectedTimeTo.hour;
       int minute1 = selectedTimeTo.minute;

       int hour2 = selectedTime.hour;
        int minute2 = selectedTime.minute;


        selectedTimeTo1  = "${hour1<10?0:''}$hour1:${minute1<10?0:''}$minute1";
        selectedTimeFrom = "${hour2<10?0:''}$hour2:${minute2<10?0:''}$minute2";
        String validBooking = "yes";

        if(newT.compareTo(DateTime.now())<0){
          isVisible = false;
          validBooking = "no";
        }

        for(int i =0; i < bookings2.length; i ++){
          String startTime = bookings2[i].slot.toString();
          String endTime = bookings2[i].slotTo.toString();

          if(newT.compareTo(DateTime.now())<0){
            isVisible = false;
            validBooking = "no";
          }



        }

        if(validBooking !="yes") {
          Get.defaultDialog(
            title: "Error",
            content: Column(
              children:  [
                const Text("You can not book this Slot"),
                const SizedBox(height: 10,),
                const Text("This usually happens when you selected a Time slot that is already booked", textAlign: TextAlign.center,),
                ElevatedButton(onPressed: (){
                  isVisible = false;
                  Get.back();
                }, child: const Text("Ok"))
              ],
            )
          );
        }else{
          isVisible = true;
        }



      });
    });
  }
}




