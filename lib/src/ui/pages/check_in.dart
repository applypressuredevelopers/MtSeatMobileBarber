import 'dart:async';

import 'package:barber_app/constants.dart';
import 'package:barber_app/src/ui/model/AccountModel.dart';
import 'package:barber_app/src/ui/model/serviceModel.dart';
import 'package:barber_app/src/ui/pages/add_next_customer.dart';
import 'package:barber_app/src/ui/pages/booking_done.dart';
import 'package:barber_app/src/ui/pages/make_booking.dart';
import 'package:barber_app/src/ui/pages/profile/wierdBorder.dart';
import 'package:barber_app/src/ui/widgets/custom_button.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../model/chekOutModel.dart';
import '../../utils/images.dart';
import '../widgets/drop_down.dart';
import 'category/categories_page.dart';
import 'category/service_select.dart';
import 'check_out_page.dart';
import 'current_future_booking.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({Key? key}) : super(key: key);

  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  List<String> finalSlots = [
    '08:00',
    '08:15',
    '08:30',
    '08:45',
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

  int customerName = 0;
  String? question1;
  List<String> questionList = <String>[
    "Check-In",
    "Reviews",
    "Portfolio",
    "Detail",
  ];

  late Timer _timer;

  Task timerStart(int seconds) {
    int days = seconds ~/ 86400;
    seconds = seconds % 86400;
    int hours = seconds ~/ 3600;
    seconds = seconds % 3600;
    int minutes = seconds ~/ 60;
    seconds = seconds % 60;
    var task =
        Task(day: days, hours: hours, minutes: minutes, seconds: seconds);
    return task;
  }

  void startTimer() {
    const oneSec = Duration(seconds: 60);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        // process();
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  ScrollController scrollController = ScrollController();

  int selected = -1;
  int selectedContainer = -1;

  List<String> slots = [];

  final _fireStore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  List<AccountModel> stylist = [];
  List<AccountModel> homeVisitstylist = [];

  String freeSlot = "null";

  List<String> queueCount = [];
  List<String> freeSlots1 = [];
  List<String> freeSlots2 = [];
  bool inShop = true;
  bool homeVisit = false;

  String slot1 = "";
  String slot2 = "";
  String slot3 = "";
  String slot4 = "";
  String slot5 = "";
  String slot6 = "";
  String slot7 = "";
  String slot8 = "";
  String slot9 = "";
  String slot10 = "";
  String slot11 = "";
  String slot12 = "";
  String slot13 = "";
  String slot14 = "";
  String slot15 = "";
  String slot16 = "";
  String slot17 = "";
  String slot18 = "";
  String slot19 = "";
  String slot20 = "";
  String slot21 = "";
  String slot22 = "";
  String slot23 = "";
  String slot24 = "";
  String slot25 = "";
  String slot26 = "";
  String slot27 = "";
  String slot28 = "";
  String slot29 = "";
  String slot30 = "";
  String slot31 = "";
  String slot32 = "";
  String slot33 = "";
  String slot34 = "";
  String slot35 = "";
  String slot36 = "";
  String slot37 = "";
  String slot38 = "";
  String slot39 = "";
  String slot40 = "";
  String slot41 = "";
  String slot42 = "";
  String slot43 = "";
  String slot44 = "";

  String? _monthName;

  Future<void> _getMonth() async {
    if (DateTime.now().month == 1) {
      _monthName = "January";
    }
    if (DateTime.now().month == 2) {
      _monthName = "February";
    }
    if (DateTime.now().month == 3) {
      _monthName = "March";
    }
    if (DateTime.now().month == 4) {
      _monthName = "April";
    }
    if (DateTime.now().month == 5) {
      _monthName = "May";
    }
    if (DateTime.now().month == 6) {
      _monthName = "June";
    }
    if (DateTime.now().month == 7) {
      _monthName = "July";
    }
    if (DateTime.now().month == 8) {
      _monthName = "August";
    }
    if (DateTime.now().month == 9) {
      _monthName = "September";
    }
    if (DateTime.now().month == 10) {
      _monthName = "October";
    }
    if (DateTime.now().month == 11) {
      _monthName = "November";
    }
    if (DateTime.now().month == 12) {
      _monthName = "December";
    }
    thisMonth = _monthName!;
  }

  List<CheckoutModel> bookings = [];
  List<CheckoutModel> bookingsThisYear = [];
  List<CheckoutModel> bookingsToday = [];
  List<CheckoutModel> allBookings = [];
  List<List<CheckoutModel>> masterBookings = [];
  List<String> ques = [];
  List<String> quesFinal = [];
  List<String> minutesLeft = [];
  List<String> minutesLeft2 = [];

  ///Get all bookings for the stylist
  Future<void> _getData1(String stylist, q) async {
    bookings.clear();
    allBookings.clear();
    bookingsThisYear.clear();

    try {
      QuerySnapshot querySnapshot = await _fireStore
          .collection("bookings")
          .where(
            "stylistId",
            isEqualTo: stylist,
          )
          .get();
      bookings = List.from(querySnapshot.docs.map(
        (doc) => CheckoutModel.fromSnapshot(doc),
      ));
      // inspection = List.from(querySnapshot.docs.map((doc)=>InspectionModel.fromSnapshot(doc),));
      allBookings = bookings;
      masterBookings.add(allBookings);

      for (int i = 0; i < allBookings.length; i++) {
        if (allBookings[i].year == DateTime.now().year.toString()) {
          bookingsThisYear.add(allBookings[i]);
        }
      }

      get(q);
      // setState((){});
    } catch (e) {
      print("Error1112");
      print(e);
    }
  }

  ///Find booked slots
  void get(q) {
    slots.clear();
    bookingsToday.clear();
    int count = 0;
    int qcount = 0;
    int q1 = 0;
    for (int i = 0; i < bookingsThisYear.length; i++) {
      if (bookingsThisYear[i].month == _monthName) {
        if (bookingsThisYear[i].day == DateTime.now().day) {
          bookingsToday.add(bookingsThisYear[i]);
          slots.add(bookingsThisYear[i].slot.toString());

          if (bookingsThisYear[i].queue.toString() == "yes") {
            count++;
          }
        }
      }
    }

    for (int i = 0; i < bookingsToday.length; i++) {
      //counting all the bookings for the day
      if (bookingsToday[i].note.toString() != "childElement") {

        String s  = bookingsToday[i].slotTo.toString();
        TimeOfDay sloTime = TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));
        TimeOfDay timeOfDay = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

        print(s);
        print(timeOfDay);
        int slotTimeMinutes = sloTime.hour* 60 + sloTime.minute;
        int timeOfDayMinutes = timeOfDay.hour*60 + timeOfDay.minute;

        print(slotTimeMinutes);
        print(timeOfDayMinutes);

        if(slotTimeMinutes>timeOfDayMinutes) {
          q1++;
        }
      }
      //counting people joined the queue
      if (bookingsToday[i].queue == "yes") {
        // if(bookingsToday[i].slotTo ==)
        qcount++;
      }
    }

    // ques.add(qcount.toString());
    quesFinal.add(q1.toString());
    // queueCount.add(count.toString());

    bookingsToday
        .sort((a, b) => a.slot.toString().compareTo(b.slot.toString()));

    TimeOfDay _nowTime = TimeOfDay.now();

    if (bookingsToday.isEmpty) {
      freeSlots1.add('0');
      freeSlots2.add('0');
    }

    for (int i = 0; i < bookingsToday.length; i++) {
      if (i == 0) {
        TimeOfDay _startTime = TimeOfDay(
            hour: int.parse(bookingsToday[i].slot.toString().split(":")[0]),
            minute: int.parse(bookingsToday[i].slot.toString().split(":")[1]));
        TimeOfDay _endTime = TimeOfDay(
            hour: int.parse(bookingsToday[i].slotTo.toString().split(":")[0]),
            minute:
                int.parse(bookingsToday[i].slotTo.toString().split(":")[1]));

        int _start = _startTime.hour * 60 + _startTime.minute;
        int _end = _endTime.hour * 60 + _endTime.minute;
        int _now = _nowTime.hour * 60 + _nowTime.minute;

        if (_now < _start) {
          freeSlots1.add('0');
          freeSlots2.add('0');
          break;
        } else {
          int n = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;
          if (_now < _end) {
            _nowTime = TimeOfDay(
                hour:
                    int.parse(bookingsToday[i].slotTo.toString().split(":")[0]),
                minute: int.parse(
                        bookingsToday[i].slotTo.toString().split(":")[1]) +
                    1);
          }
        }
      }

      if (i != 0 && i != bookingsToday.length - 1) {
        TimeOfDay _startTime = TimeOfDay(
            hour: int.parse(bookingsToday[i].slot.toString().split(":")[0]),
            minute: int.parse(bookingsToday[i].slot.toString().split(":")[1]));
        TimeOfDay _endTime = TimeOfDay(
            hour: int.parse(bookingsToday[i].slotTo.toString().split(":")[0]),
            minute:
                int.parse(bookingsToday[i].slotTo.toString().split(":")[1]));
        int _now = _nowTime.hour * 60 + _nowTime.minute;
        int _start = _startTime.hour * 60 + _startTime.minute;
        int _end = _endTime.hour * 60 + _endTime.minute;
        if (_now < _start) {
          freeSlots1.add('${_nowTime.hour}:${_nowTime.minute}');
          freeSlots2.add('${_nowTime.hour}:${_nowTime.minute}');
          break;
        } else {
          int n = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;
          if (_end > _now) {
            _nowTime = TimeOfDay(
                hour:
                    int.parse(bookingsToday[i].slotTo.toString().split(":")[0]),
                minute: int.parse(
                        bookingsToday[i].slotTo.toString().split(":")[1]) +
                    1);
          }
        }
      }

      if (i == bookingsToday.length - 1) {
        TimeOfDay _startTime = TimeOfDay(
            hour: int.parse(bookingsToday[i].slot.toString().split(":")[0]),
            minute: int.parse(bookingsToday[i].slot.toString().split(":")[1]));

        int _now = _nowTime.hour * 60 + _nowTime.minute;
        int _start = _startTime.hour * 60 + _startTime.minute;
        if (_now < _start) {
          print("hereee");
          freeSlots1.add('${_nowTime.hour}:${_nowTime.minute} ');
          freeSlots2.add('${_nowTime.hour}:${_nowTime.minute} ');
          break;
        } else {
          print("hereee2");
          _nowTime = TimeOfDay(
              hour: int.parse(bookingsToday[i].slotTo.toString().split(":")[0]),
              minute:
                  int.parse(bookingsToday[i].slotTo.toString().split(":")[1]) +
                      1);
          freeSlots1.add('${_nowTime.hour}:${_nowTime.minute}');
          freeSlots2.add('${_nowTime.hour}:${_nowTime.minute}');
        }
      }
    }

    // String frr = "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}";
    // //for each booked slot
    //
    //       for(int j =0; j<bookingsToday.length; j++){
    //         TimeOfDay _startTime = TimeOfDay(hour:int.parse(bookingsToday[j].slot.toString().split(":")[0]),minute: int.parse(bookingsToday[j].slot.toString().split(":")[1]));
    //         TimeOfDay _endTime = TimeOfDay(hour:int.parse(bookingsToday[j].slotTo.toString().split(":")[0]),minute: int.parse(bookingsToday[j].slotTo.toString().split(":")[1]));
    //         TimeOfDay _now = TimeOfDay(hour:int.parse(frr.toString().split(":")[0]),minute: int.parse(frr.toString().split(":")[1]));
    //
    //         int start = _startTime.hour *60 + _startTime.minute;
    //         int end = _endTime.hour *60 + _endTime.minute;
    //         int now = _now.hour *60 + _now.minute;
    //
    //         if(now>start && now<end){
    //           frr =="${_endTime.hour}: ${_endTime.minute +1}";
    //           break;
    //         }
    //       }

    if (slots.isEmpty) {
      slot1 = slot2 = slot3 = slot4 = slot5 = slot6 = slot7 = slot8 = slot9 =
          slot10 = slot11 = slot12 = slot13 =
              slot14 = slot15 = slot16 = slot17 = slot18 = slot19 = slot20 = "";
    }

    //
    // if(DateTime.now().hour< 8 && slot1 != "booked"){
    //   // freeSlots[q] = "08:00";
    //   freeSlots.add("08:00");
    // }else{
    //   if(DateTime.now().hour< 8 && slot2 != "booked"){
    //     freeSlots.add("08:30");
    //   }else if(DateTime.now().hour>= 8 && DateTime.now().hour <9 && DateTime.now().minute<30 && slot2 != "booked"){
    //     freeSlots.add("08:30");
    //   }else{
    //     if(DateTime.now().hour< 9 && DateTime.now().hour>= 8  && slot3 != "booked"){
    //       freeSlots.add("09:00");
    //     }else{
    //       if(DateTime.now().hour< 9 && slot4 != "booked"){
    //         freeSlots[q] = "09:30";
    //       }else
    //
    //       if(DateTime.now().hour>= 9 && DateTime.now().hour< 10 && DateTime.now().minute<30   && slot4 != "booked"){
    //         freeSlots[q] = "09:30";
    //       } else{
    //         if(DateTime.now().hour< 10  && slot5 != "booked"){
    //           freeSlots[q] = "10:00";
    //         }else{
    //           if(DateTime.now().hour< 10 && slot6 != "booked"){
    //             freeSlots[q] = "10:30";
    //           }else
    //
    //           if(DateTime.now().hour>= 10 && DateTime.now().hour< 11 && DateTime.now().minute<30   && slot6 != "booked"){
    //             freeSlots[q] = "10:30";
    //           }else{
    //
    //             if(DateTime.now().hour< 11  && slot7 != "booked"){
    //               freeSlots[q] = "11:00";
    //               print('11:30');
    //             }else{
    //               if(DateTime.now().hour< 11 && slot8 != "booked"){
    //                 freeSlots.add("11:30");
    //               }else
    //
    //               if(DateTime.now().hour>= 11 && DateTime.now().hour< 12 && DateTime.now().minute<30  && slot8 != "booked"){
    //                 print('****');
    //                 freeSlots.add("11:30");
    //                 // freeSlots[q] = "11:30";
    //
    //               }else{
    //                 if(DateTime.now().hour< 12  && slot9 != "booked"){
    //                   freeSlots.add("12:00");
    //                   freeSlots[q] = "12:00";
    //                 }else{
    //
    //                   if(DateTime.now().hour< 12 && slot10 != "booked"){
    //                     freeSlots.add("12:30");
    //                   }else
    //                   if(DateTime.now().hour>= 12 && DateTime.now().hour< 13 && DateTime.now().minute<30   && slot10 != "booked"){
    //                     freeSlots[q] = "12:30";
    //                   }else{
    //                     if(DateTime.now().hour< 13  && slot11 != "booked"){
    //                       freeSlots[q] = "13:00";
    //                     }else{
    //                       if(DateTime.now().hour< 13 && slot12 != "booked"){
    //                         freeSlots[q] = "13:30";
    //
    //                       }else
    //                       if(DateTime.now().hour>= 13 && DateTime.now().hour< 14 && DateTime.now().minute<30   && slot12 != "booked"){
    //                         Fluttertoast.showToast(msg: '1330');
    //                         freeSlots.add("13:30");
    //                       }else{
    //                         if(DateTime.now().hour< 14  && slot13 != "booked"){
    //                           freeSlots.add("14:00");
    //
    //                         }else{
    //                           if(DateTime.now().hour< 14 && slot14 != "booked"){
    //                             freeSlots.add("14:30");
    //                           }else
    //                           if(DateTime.now().hour>= 14 && DateTime.now().hour< 15 && DateTime.now().minute<30   && slot14 != "booked"){
    //                             freeSlots.add("14:30");
    //                           }else{
    //                             if(DateTime.now().hour< 15  && slot15 != "booked"){
    //                               freeSlots.add("15:00");
    //                             }else{
    //                               if(DateTime.now().hour< 15 && slot16 != "booked"){
    //                                 freeSlots.add("15:30");
    //                               }else
    //                               if(DateTime.now().hour>= 15 && DateTime.now().hour< 16 && DateTime.now().minute<30  && slot16 != "booked"){
    //                                 freeSlots.add("15:30");
    //                               }else{
    //                                 if(DateTime.now().hour< 16  && slot17 != "booked"){
    //                                   freeSlots.add("16:00");
    //                                 }else{
    //                                   if(DateTime.now().hour< 16 && slot18 != "booked"){
    //                                   freeSlots.add("16:30");
    //                                 }else
    //                                   if(DateTime.now().hour>= 16 && DateTime.now().hour< 17 && DateTime.now().minute<30 &&  slot18 != "booked"){
    //                                     freeSlots.add("16:30");
    //                                   }else{
    //                                     if(DateTime.now().hour< 17  && slot19 != "booked"){
    //                                       freeSlots.add("17:00");
    //                                     }else{
    //                                       if(DateTime.now().hour< 17 && slot20 != "booked"){
    //                                         freeSlots.add("17:30");
    //                                       }else
    //                                       if(DateTime.now().hour>= 17 &&DateTime.now().hour< 18  && DateTime.now().minute<30  && slot20 != "booked"){
    //                                         freeSlots.add("17:30");
    //                                       }else{
    //                                         freeSlots.add("null");
    //                                       }
    //                                     }
    //                                   }
    //                                 }
    //                               }
    //                             }
    //                           }
    //                         }
    //                       }
    //                     }
    //                   }
    //                 }
    //               }
    //             }
    //
    //           }
    //         }
    //       }
    //     }
    //   }
    // }

    if (DateTime.now().hour < 8 && slot1 != "booked") {
      freeSlots.add("08:00");
    } else {
      if (DateTime.now().hour < 8 && slot2 != "booked") {
        freeSlots.add("08:15");
      } else {
        if (DateTime.now().hour < 8 && slot3 != "booked") {
          freeSlots.add("08:30");
        } else {
          if (DateTime.now().hour < 8 && slot4 != "booked") {
            freeSlots.add("08:45");
          } else {
            if (DateTime.now().hour >= 8 &&
                DateTime.now().hour < 9 &&
                DateTime.now().minute < 15 &&
                slot2 != "booked") {
              freeSlots.add("08:15");
            } else {
              if (DateTime.now().hour >= 8 &&
                  DateTime.now().hour < 9 &&
                  DateTime.now().minute < 30 &&
                  slot3 != "booked") {
                freeSlots.add("08:30");
              } else {
                if (DateTime.now().hour >= 8 &&
                    DateTime.now().hour < 9 &&
                    DateTime.now().minute < 45 &&
                    slot4 != "booked") {
                  freeSlots.add("08:45");
                } else {
                  ///************************************************
                  if (DateTime.now().hour < 9 && slot5 != "booked") {
                    freeSlots.add("09:00");
                  } else {
                    if (DateTime.now().hour < 9 && slot6 != "booked") {
                      freeSlots.add("09:15");
                    } else {
                      if (DateTime.now().hour < 9 && slot7 != "booked") {
                        freeSlots.add("09:30");
                      } else {
                        if (DateTime.now().hour < 9 && slot8 != "booked") {
                          freeSlots.add("09:45");
                        } else {
                          if (DateTime.now().hour >= 9 &&
                              DateTime.now().hour < 10 &&
                              DateTime.now().minute < 15 &&
                              slot6 != "booked") {
                            freeSlots.add("09:15");
                          } else {
                            if (DateTime.now().hour >= 9 &&
                                DateTime.now().hour < 10 &&
                                DateTime.now().minute < 30 &&
                                slot7 != "booked") {
                              freeSlots.add("09:30");
                            } else {
                              if (DateTime.now().hour >= 9 &&
                                  DateTime.now().hour < 10 &&
                                  DateTime.now().minute < 45 &&
                                  slot8 != "booked") {
                                freeSlots.add("09:45");
                              } else {
                                ///**********************************************************

                                if (DateTime.now().hour < 10 &&
                                    slot9 != "booked") {
                                  freeSlots.add("10:00");
                                } else {
                                  if (DateTime.now().hour < 10 &&
                                      slot10 != "booked") {
                                    freeSlots.add("10:15");
                                  } else {
                                    if (DateTime.now().hour < 10 &&
                                        slot11 != "booked") {
                                      freeSlots.add("10:30");
                                    } else {
                                      if (DateTime.now().hour < 10 &&
                                          slot12 != "booked") {
                                        freeSlots.add("10:45");
                                      } else {
                                        if (DateTime.now().hour >= 10 &&
                                            DateTime.now().hour < 11 &&
                                            DateTime.now().minute < 15 &&
                                            slot10 != "booked") {
                                          freeSlots.add("10:15");
                                        } else {
                                          if (DateTime.now().hour >= 10 &&
                                              DateTime.now().hour < 11 &&
                                              DateTime.now().minute < 30 &&
                                              slot11 != "booked") {
                                            freeSlots.add("10:30");
                                          } else {
                                            if (DateTime.now().hour >= 10 &&
                                                DateTime.now().hour < 11 &&
                                                DateTime.now().minute < 45 &&
                                                slot12 != "booked") {
                                              freeSlots.add("10:45");
                                            } else {
                                              ///*************************************************
                                              if (DateTime.now().hour < 11 &&
                                                  slot13 != "booked") {
                                                freeSlots.add("11:00");
                                              } else {
                                                if (DateTime.now().hour < 11 &&
                                                    slot14 != "booked") {
                                                  freeSlots.add("11:15");
                                                } else {
                                                  if (DateTime.now().hour <
                                                          11 &&
                                                      slot15 != "booked") {
                                                    freeSlots.add("11:30");
                                                  } else {
                                                    if (DateTime.now().hour <
                                                            11 &&
                                                        slot16 != "booked") {
                                                      freeSlots.add("11:45");
                                                    } else {
                                                      if (DateTime.now()
                                                                  .hour >=
                                                              11 &&
                                                          DateTime.now()
                                                                  .hour <
                                                              12 &&
                                                          DateTime.now()
                                                                  .minute <
                                                              15 &&
                                                          slot14 != "booked") {
                                                        freeSlots.add("11:15");
                                                      } else {
                                                        if (DateTime.now()
                                                                    .hour >=
                                                                11 &&
                                                            DateTime.now()
                                                                    .hour <
                                                                12 &&
                                                            DateTime.now()
                                                                    .minute <
                                                                30 &&
                                                            slot15 !=
                                                                "booked") {
                                                          freeSlots
                                                              .add("11:30");
                                                        } else {
                                                          if (DateTime.now()
                                                                      .hour >=
                                                                  11 &&
                                                              DateTime.now()
                                                                      .hour <
                                                                  12 &&
                                                              DateTime.now()
                                                                      .minute <
                                                                  45 &&
                                                              slot16 !=
                                                                  "booked") {
                                                            freeSlots
                                                                .add("11:45");
                                                          } else {
                                                            ///*************************************************
                                                            if (DateTime.now()
                                                                        .hour <
                                                                    12 &&
                                                                slot17 !=
                                                                    "booked") {
                                                              freeSlots
                                                                  .add("12:00");
                                                            } else {
                                                              if (DateTime.now()
                                                                          .hour <
                                                                      12 &&
                                                                  slot18 !=
                                                                      "booked") {
                                                                freeSlots.add(
                                                                    "12:15");
                                                              } else {
                                                                if (DateTime.now()
                                                                            .hour <
                                                                        12 &&
                                                                    slot19 !=
                                                                        "booked") {
                                                                  freeSlots.add(
                                                                      "12:30");
                                                                } else {
                                                                  if (DateTime.now()
                                                                              .hour <
                                                                          12 &&
                                                                      slot20 !=
                                                                          "booked") {
                                                                    freeSlots.add(
                                                                        "12:45");
                                                                  } else {
                                                                    if (DateTime.now().hour >= 12 &&
                                                                        DateTime.now().hour <
                                                                            13 &&
                                                                        DateTime.now().minute <
                                                                            15 &&
                                                                        slot18 !=
                                                                            "booked") {
                                                                      freeSlots.add(
                                                                          "12:15");
                                                                    } else {
                                                                      if (DateTime.now().hour >= 12 &&
                                                                          DateTime.now().hour <
                                                                              13 &&
                                                                          DateTime.now().minute <
                                                                              30 &&
                                                                          slot19 !=
                                                                              "booked") {
                                                                        freeSlots
                                                                            .add("12:30");
                                                                      } else {
                                                                        if (DateTime.now().hour >= 12 &&
                                                                            DateTime.now().hour <
                                                                                13 &&
                                                                            DateTime.now().minute <
                                                                                45 &&
                                                                            slot20 !=
                                                                                "booked") {
                                                                          freeSlots
                                                                              .add("12:45");
                                                                        } else {
                                                                          ///*************************************************
                                                                          if (DateTime.now().hour < 13 &&
                                                                              slot21 != "booked") {
                                                                            freeSlots.add("13:00");
                                                                          } else {
                                                                            if (DateTime.now().hour < 13 &&
                                                                                slot22 != "booked") {
                                                                              freeSlots.add("13:15");
                                                                            } else {
                                                                              if (DateTime.now().hour < 13 && slot23 != "booked") {
                                                                                freeSlots.add("13:30");
                                                                              } else {
                                                                                if (DateTime.now().hour < 13 && slot24 != "booked") {
                                                                                  freeSlots.add("13:45");
                                                                                } else {
                                                                                  if (DateTime.now().hour >= 13 && DateTime.now().hour < 14 && DateTime.now().minute < 15 && slot22 != "booked") {
                                                                                    freeSlots.add("13:15");
                                                                                  } else {
                                                                                    if (DateTime.now().hour >= 13 && DateTime.now().hour < 14 && DateTime.now().minute < 30 && slot23 != "booked") {
                                                                                      freeSlots.add("13:30");
                                                                                    } else {
                                                                                      if (DateTime.now().hour >= 13 && DateTime.now().hour < 14 && DateTime.now().minute < 45 && slot24 != "booked") {
                                                                                        freeSlots.add("13:45");
                                                                                      } else {
                                                                                        ///*************************************************
                                                                                        if (DateTime.now().hour < 14 && slot25 != "booked") {
                                                                                          freeSlots.add("14:00");
                                                                                        } else {
                                                                                          if (DateTime.now().hour < 14 && slot26 != "booked") {
                                                                                            freeSlots.add("14:15");
                                                                                          } else {
                                                                                            if (DateTime.now().hour < 14 && slot27 != "booked") {
                                                                                              freeSlots.add("14:30");
                                                                                            } else {
                                                                                              if (DateTime.now().hour < 14 && slot28 != "booked") {
                                                                                                freeSlots.add("14:45");
                                                                                              } else {
                                                                                                if (DateTime.now().hour >= 14 && DateTime.now().hour < 15 && DateTime.now().minute < 15 && slot26 != "booked") {
                                                                                                  freeSlots.add("14:15");
                                                                                                } else {
                                                                                                  if (DateTime.now().hour >= 14 && DateTime.now().hour < 15 && DateTime.now().minute < 30 && slot27 != "booked") {
                                                                                                    freeSlots.add("14:30");
                                                                                                  } else {
                                                                                                    if (DateTime.now().hour >= 14 && DateTime.now().hour < 15 && DateTime.now().minute < 45 && slot28 != "booked") {
                                                                                                      freeSlots.add("14:45");
                                                                                                    } else {
                                                                                                      ///*************************************************
                                                                                                      if (DateTime.now().hour < 15 && slot29 != "booked") {
                                                                                                        freeSlots.add("15:00");
                                                                                                      } else {
                                                                                                        if (DateTime.now().hour < 15 && slot30 != "booked") {
                                                                                                          freeSlots.add("15:15");
                                                                                                        } else {
                                                                                                          if (DateTime.now().hour < 15 && slot31 != "booked") {
                                                                                                            freeSlots.add("15:30");
                                                                                                          } else {
                                                                                                            if (DateTime.now().hour < 15 && slot32 != "booked") {
                                                                                                              freeSlots.add("15:45");
                                                                                                            } else {
                                                                                                              if (DateTime.now().hour >= 15 && DateTime.now().hour < 16 && DateTime.now().minute < 15 && slot30 != "booked") {
                                                                                                                freeSlots.add("15:15");
                                                                                                              } else {
                                                                                                                if (DateTime.now().hour >= 15 && DateTime.now().hour < 16 && DateTime.now().minute < 30 && slot31 != "booked") {
                                                                                                                  freeSlots.add("15:30");
                                                                                                                } else {
                                                                                                                  if (DateTime.now().hour >= 15 && DateTime.now().hour < 16 && DateTime.now().minute < 45 && slot32 != "booked") {
                                                                                                                    freeSlots.add("15:45");
                                                                                                                  } else {
                                                                                                                    ///*************************************************
                                                                                                                    if (DateTime.now().hour < 16 && slot33 != "booked") {
                                                                                                                      freeSlots.add("16:00");
                                                                                                                    } else {
                                                                                                                      if (DateTime.now().hour < 16 && slot34 != "booked") {
                                                                                                                        freeSlots.add("16:15");
                                                                                                                      } else {
                                                                                                                        if (DateTime.now().hour < 16 && slot35 != "booked") {
                                                                                                                          freeSlots.add("16:30");
                                                                                                                        } else {
                                                                                                                          if (DateTime.now().hour < 16 && slot36 != "booked") {
                                                                                                                            freeSlots.add("16:45");
                                                                                                                          } else {
                                                                                                                            if (DateTime.now().hour >= 16 && DateTime.now().hour < 17 && DateTime.now().minute < 15 && slot34 != "booked") {
                                                                                                                              freeSlots.add("16:15");
                                                                                                                            } else {
                                                                                                                              if (DateTime.now().hour >= 16 && DateTime.now().hour < 17 && DateTime.now().minute < 30 && slot35 != "booked") {
                                                                                                                                freeSlots.add("16:30");
                                                                                                                              } else {
                                                                                                                                if (DateTime.now().hour >= 16 && DateTime.now().hour < 17 && DateTime.now().minute < 45 && slot36 != "booked") {
                                                                                                                                  freeSlots.add("16:45");
                                                                                                                                } else {
                                                                                                                                  ///*************************************************
                                                                                                                                  if (DateTime.now().hour < 17 && slot37 != "booked") {
                                                                                                                                    freeSlots.add("17:00");
                                                                                                                                  } else {
                                                                                                                                    if (DateTime.now().hour < 17 && slot38 != "booked") {
                                                                                                                                      freeSlots.add("17:15");
                                                                                                                                    } else {
                                                                                                                                      if (DateTime.now().hour < 17 && slot39 != "booked") {
                                                                                                                                        freeSlots.add("17:30");
                                                                                                                                      } else {
                                                                                                                                        if (DateTime.now().hour < 17 && slot40 != "booked") {
                                                                                                                                          freeSlots.add("17:45");
                                                                                                                                        } else {
                                                                                                                                          if (DateTime.now().hour >= 17 && DateTime.now().hour < 18 && DateTime.now().minute < 15 && slot38 != "booked") {
                                                                                                                                            freeSlots.add("17:15");
                                                                                                                                          } else {
                                                                                                                                            if (DateTime.now().hour >= 17 && DateTime.now().hour < 18 && DateTime.now().minute < 30 && slot39 != "booked") {
                                                                                                                                              freeSlots.add("17:30");
                                                                                                                                            } else {
                                                                                                                                              if (DateTime.now().hour >= 17 && DateTime.now().hour < 18 && DateTime.now().minute < 45 && slot40 != "booked") {
                                                                                                                                                freeSlots.add("17:45");
                                                                                                                                              } else {
                                                                                                                                                ///*************************************************
                                                                                                                                                if (DateTime.now().hour < 18 && slot41 != "booked") {
                                                                                                                                                  freeSlots.add("18:00");
                                                                                                                                                } else {
                                                                                                                                                  if (DateTime.now().hour < 18 && slot42 != "booked") {
                                                                                                                                                    freeSlots.add("18:15");
                                                                                                                                                  } else {
                                                                                                                                                    if (DateTime.now().hour < 18 && slot43 != "booked") {
                                                                                                                                                      freeSlots.add("18:30");
                                                                                                                                                    } else {
                                                                                                                                                      if (DateTime.now().hour < 18 && slot44 != "booked") {
                                                                                                                                                        freeSlots.add("18:45");
                                                                                                                                                      } else {
                                                                                                                                                        if (DateTime.now().hour >= 18 && DateTime.now().hour < 19 && DateTime.now().minute < 15 && slot42 != "booked") {
                                                                                                                                                          freeSlots.add("18:15");
                                                                                                                                                        } else {
                                                                                                                                                          if (DateTime.now().hour >= 18 && DateTime.now().hour < 18 && DateTime.now().minute < 30 && slot43 != "booked") {
                                                                                                                                                            freeSlots.add("18:30");
                                                                                                                                                          } else {
                                                                                                                                                            if (DateTime.now().hour >= 18 && DateTime.now().hour < 19 && DateTime.now().minute < 45 && slot44 != "booked") {
                                                                                                                                                              freeSlots.add("18:45");
                                                                                                                                                            } else {
                                                                                                                                                              ///*************************************************

                                                                                                                                                              ///*************************************************
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }

                                                                                                                                                ///*************************************************
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }

                                                                                                                                  ///*************************************************
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }

                                                                                                                    ///*************************************************
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }

                                                                                                      ///*************************************************
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }

                                                                                        ///*************************************************
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }

                                                                          ///*************************************************
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }

                                                            ///*************************************************
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }

                                              ///*************************************************
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }

                                ///**********************************************************
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    // setState(() {});
  }

  ///Get users for the shop
  Future<void> _getData() async {
    QuerySnapshot querySnapshot = await _fireStore
        .collection('users')
        .where("shop", isEqualTo: selectedShop)
        .get();
    List<AccountModel> _documents = List.from(querySnapshot.docs.map(
      (doc) => AccountModel.fromSnapshot(doc),
    ));
    stylist = _documents;
    freeSlots1.clear();
    freeSlots1.clear();
    print("stylist");

    for (int i = 0; i < stylist.length; i++) {
      await _getData1(stylist[i].uid.toString(), i);
    }

    for (int i = 0; i < freeSlots1.length; i++) {
      if (freeSlots1[i] != "0") {
        // Fluttertoast.showToast(msg: freeSlots1[i].toString());
        print(freeSlots1[i].toString());
        TimeOfDay n = TimeOfDay(
            hour: int.parse(freeSlots1[i].toString().split(":")[0]),
            minute: int.parse(freeSlots1[i].toString().split(":")[1]));
        int time = n.hour * 60 + n.minute;
        int now = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;

        freeSlots1[i] = (time - now).toString();
      }
    }
  }

  ///Get users for the shop
  Future<void> _getInShopData() async {
    QuerySnapshot querySnapshot = await _fireStore
        .collection('users')
        .where("shop", isEqualTo: selectedShop)
        .where("barberStatus", isEqualTo: "Home Visit")
        .get();
    List<AccountModel> _documents = List.from(querySnapshot.docs.map(
      (doc) => AccountModel.fromSnapshot(doc),
    ));
    homeVisitstylist = _documents;
    freeSlots1.clear();
    freeSlots1.clear();
    print("stylist");

    for (int i = 0; i < stylist.length; i++) {
      await _getData1(stylist[i].uid.toString(), i);
    }

    for (int i = 0; i < freeSlots1.length; i++) {
      if (freeSlots1[i] != "0") {
        // Fluttertoast.showToast(msg: freeSlots1[i].toString());
        print(freeSlots1[i].toString());
        TimeOfDay n = TimeOfDay(
            hour: int.parse(freeSlots1[i].toString().split(":")[0]),
            minute: int.parse(freeSlots1[i].toString().split(":")[1]));
        int time = n.hour * 60 + n.minute;
        int now = TimeOfDay.now().hour * 60 + TimeOfDay.now().minute;

        freeSlots1[i] = (time - now).toString();
      }
    }
  }

  Future<void> process() async {
    freeSlots.clear();
    await _getMonth();
    await _getData();
    if (freeSlots.isNotEmpty) {
      for (int i = 0; i < freeSlots.length; i++) {
        String s = freeSlots[i];

        TimeOfDay _startTime = TimeOfDay(
            hour: int.parse(s.split(":")[0]),
            minute: int.parse(s.split(":")[1]));
        // TimeOfDay _startTime2 = TimeOfDay(hour:int.parse(s2.split(":")[0]),minute: int.parse(s2.split(":")[1]));

        DateTime from = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, DateTime.now().hour, DateTime.now().minute);
        DateTime to = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, _startTime.hour, _startTime.minute);
        // DateTime to2 = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, _startTime2.hour, _startTime2.minute);

        String f = (to.difference(from).inSeconds / 60).round().toString();
        // String f2 = (to2.difference(from).inSeconds / 60).round().toString();
        minutesLeft.add(f);
        // minutesLeft2.add(f2);
      }
    }
    setState(() {});

    startTimer();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ///find current month name
      ///
      await process();
      setState(() {

      });
    });
  }

  Future<bool> _onClose() async {
    Get.to(() => const ServiceSelection());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onClose,
      child: Scaffold(
        extendBody: true,
        // bottomNavigationBar:const CustomBottomSheet(),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.yellowColors,
          ),
          title: const Text(
            'Check-In',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            _buildCartAndBell(url: AppImages.bell, context: context),
            IconButton(onPressed: () async {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
             // Get.to(()=>const CheckInPage());
            }, icon: const Icon(Icons.refresh,)),
            const SizedBox(width: 10,)
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
          child: SizedBox(
            height: 2000,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 20,
                                  ),
                                  child: Text(
                                    'Available \nTime Slot',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              // TextButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       customerName++;
                              //     });
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) {
                              //           return CustomDialog(
                              //             customerName: customerName,
                              //           );
                              //         });
                              //   },
                              //   child: Padding(
                              //     padding: const EdgeInsets.symmetric(
                              //         vertical: 2, horizontal: 20),
                              //     child: Text(
                              //       'Available \nTime Slot',
                              //       textAlign: TextAlign.center,
                              //       style: const TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 10,
                              //       ),
                              //     ),
                              //   ),
                              //   style: TextButton.styleFrom(
                              //     backgroundColor: Colors.green,
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(40),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Salon is Current \nopen',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Colors.green,
                                    ),
// Expa
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: Text(
                                      'Select a service provider below to check-in and join the live queue now.',
                                      style: TextStyle(
                                          height: 1,
                                          color: Colors.white,
                                          fontSize: 11),
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: Color(0xffFFDB58),
                                    ),
// Expa
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: Text(
                                      'Select Book a Slot and book available slot for todays or any other day',
                                      style: TextStyle(
                                          height: 1,
                                          color: Colors.white,
                                          fontSize: 11),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const MyTooltip(
                          message: 'Hey you can select one',
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DropDownWidget(
                            onChanged: (_) {
                              question1 = _;
                              setState(() {});
                              question1 == 'Detail'
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BookingDonePage()))
                                  : null;
                            },
                            list: questionList,
                            select: question1,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 20,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Text(
                          shopName,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Select A Service Provider',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // _buildHorizontalList(),
                  // for (int i = 0; i < stylist.length; i++)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [


                          CustomButton(onTap: (){
                            setState(() {
                              inShop = true;
                              homeVisit = false;
                            });
                          },
                            btnColor: inShop ?AppColors.yellowColors: AppColors.greyColor,
                            width: MediaQuery.of(context).size.width*0.4,
                            height: MediaQuery.of(context).size.height*0.04,
                            btnText: "In Shop",
                              btnPadding: EdgeInsets.zero,
                          ),

                          CustomButton(onTap: (){
                            setState(() {
                              inShop = false;
                              homeVisit = true;
                            });
                          },
                            btnColor: homeVisit? AppColors.yellowColors: AppColors.greyColor,
                            width: MediaQuery.of(context).size.width*0.4,
                            height: MediaQuery.of(context).size.height*0.04,
                            btnText: "Home Visit",
                            btnPadding: EdgeInsets.zero,
                          ),




                        ],
                      ),
                      for(int index = 0; index<stylist.length; index ++)

                      Column(
                        children: [
                          if(stylist[index].barberStatus.toString() =="In Shop" && inShop || stylist[index].barberStatus.toString() =="Both" && inShop)
                          InkWell(
                            onTap: () {
                              selected = index;
                              setState(() {});
                            },
                            child: Container(
                              padding:
                              const EdgeInsets
                                  .symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              margin:
                              const EdgeInsets
                                  .only(
                                left: 10,
                                right: 10,
                                bottom: 5,
                              ),
                              decoration:
                              BoxDecoration(
                                color: selected ==
                                    index
                                    ? AppColors
                                    .yellowColors
                                    : Colors
                                    .black26,
                                borderRadius:
                                BorderRadius
                                    .circular(
                                    20),
                                border:
                                Border.all(
                                  width: 2,
                                  color: index ==
                                      0
                                      ? Colors
                                      .green
                                      : AppColors
                                      .yellowColors,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        AppImages
                                            .yellowGrid,
                                        width: 18,
                                        height:
                                        18,
                                        color: selected ==
                                            index
                                            ? Colors
                                            .black
                                            : AppColors
                                            .yellowColors,
                                        fit: BoxFit
                                            .cover,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Available',
                                        style:
                                        TextStyle(
                                          fontSize:
                                          13,
                                          color: selected ==
                                              index
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Time Slots',
                                        style:
                                        TextStyle(
                                          fontSize:
                                          13,
                                          color: selected ==
                                              index
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'M , T , W , T , F , S , S',
                                        style:
                                        TextStyle(
                                          fontSize:
                                          8,
                                          color: selected ==
                                              index
                                              ? Colors.black
                                              : Colors.white,
                                          fontStyle:
                                          FontStyle.italic,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      InkWell(
                                        onTap:
                                            () {
                                          joinQueue =
                                          "no";
                                          selectedStylistName = stylist[index]
                                              .fullName
                                              .toString();
                                          selectedStylistId = stylist[index]
                                              .uid
                                              .toString();
                                          selectedStylistImage = stylist[index]
                                              .image
                                              .toString();
                                          print(
                                              selectedStylistName);
                                          setState(
                                                  () {
                                                customerName++;
                                              });
                                          showDialog(
                                            context:
                                            context,
                                            builder:
                                                (BuildContext context) {
                                              return CustomDialog(
                                                customerName: customerName,
                                              );
                                            },
                                          );
                                        },
                                        child:
                                        Container(
                                          decoration:
                                          BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(40),
                                            color: selected == index
                                                ? Colors.black
                                                : AppColors.yellowColors,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal:
                                              20,
                                              vertical:
                                              7.5),
                                          child:
                                          const Text(
                                            'Book a slot',
                                            textAlign:
                                            TextAlign.center,
                                            style:
                                            TextStyle(
                                              color:
                                              Colors.white,
                                              fontSize:
                                              12,
                                            ),
                                          ),
                                        ),
                                      )

                                      // ghjk
                                      // _buildButton(
                                      //
                                      //   text: 'Book A Slot',
                                      //   color: selected == i
                                      //       ? Colors.black
                                      //       : AppColors.yellowColors,
                                      //
                                      //   i: i,
                                      // )
                                    ],
                                  ),

                                  const Spacer(),
                                  Column(
                                    children: [
                                      if (stylist[index]
                                          .image
                                          .toString() !=
                                          'null')
                                        Container(
                                          height:
                                          65,
                                          width:
                                          65,
                                          decoration:
                                          BoxDecoration(
                                            border:
                                            Border.all(color: AppColors.yellowColors),
                                            borderRadius:
                                            BorderRadius.circular(120),
                                            image:
                                            DecorationImage(
                                              image:
                                              NetworkImage(
                                                stylist[index].image.toString(),
                                              ),
                                              fit:
                                              BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      const SizedBox(
                                        height:
                                        10,
                                      ),
                                      Text(
                                        stylist[index]
                                            .fullName
                                            .toString(),
                                        style:
                                        const TextStyle(
                                          color: Colors
                                              .white,
                                          fontSize:
                                          14,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),

                                  Column(
                                    children: [
                                      Image.asset(
                                        AppImages
                                            .yellowCalender,
                                        width: 18,
                                        height:
                                        18,
                                        color: selected ==
                                            index
                                            ? Colors
                                            .black
                                            : AppColors
                                            .yellowColors,
                                        fit: BoxFit
                                            .cover,
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      if (minutesLeft
                                          .isNotEmpty)
                                        Text(
                                          'Empty Seat',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            13,
                                            color: selected == index
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      // if(minutesLeft.isNotEmpty)
                                      if (int.parse(
                                          freeSlots1[index].toString()) >
                                          0)
                                        Text(
                                          'Available in ${freeSlots1[index].toString()} min',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            13,
                                            color: selected == index
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      if (int.parse(
                                          freeSlots1[index].toString()) <
                                          1)
                                        Text(
                                          'Available now',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            13,
                                            color: selected == index
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      if (quesFinal
                                          .isNotEmpty)
                                        Text(
                                          '${quesFinal[index].toString()} customers in queue',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            8,
                                            color: selected == index
                                                ? Colors.black
                                                : Colors.white,
                                            fontStyle:
                                            FontStyle.italic,
                                          ),
                                        ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      _buildButton(
                                        text:
                                        'Join Now',
                                        color: Colors
                                            .green,
                                        i: index,
                                      )
                                    ],
                                  )

                                  // _buildColumn(
                                  //   url: AppImages.yellowCalender,
                                  //   t1: 'Empty Seat',
                                  //   t2: 'Available in 20 min',
                                  //   t3: '${i + 0} customer in queue',
                                  //   btnColors: Colors.green,
                                  //   btnText: 'Join Now',
                                  //   i: i,
                                  // ),
                                ],
                              ),
                            ),
                          ),

                          if(stylist[index].barberStatus.toString() =="Home Visit" && homeVisit || stylist[index].barberStatus.toString() =="Both" && homeVisit)
                            InkWell(
                              onTap: () {
                                selected = index;
                                setState(() {});
                              },
                              child: Container(
                                padding:
                                const EdgeInsets
                                    .symmetric(
                                  horizontal: 10,
                                  vertical: 20,
                                ),
                                margin:
                                const EdgeInsets
                                    .only(
                                  left: 10,
                                  right: 10,
                                  bottom: 5,
                                ),
                                decoration:
                                BoxDecoration(
                                  color: selected ==
                                      index
                                      ? AppColors
                                      .yellowColors
                                      : Colors
                                      .black26,
                                  borderRadius:
                                  BorderRadius
                                      .circular(
                                      20),
                                  border:
                                  Border.all(
                                    width: 2,
                                    color: index ==
                                        0
                                        ? Colors
                                        .green
                                        : AppColors
                                        .yellowColors,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          AppImages
                                              .yellowGrid,
                                          width: 18,
                                          height:
                                          18,
                                          color: selected ==
                                              index
                                              ? Colors
                                              .black
                                              : AppColors
                                              .yellowColors,
                                          fit: BoxFit
                                              .cover,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'Available',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            13,
                                            color: selected ==
                                                index
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Time Slots',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            13,
                                            color: selected ==
                                                index
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'M , T , W , T , F , S , S',
                                          style:
                                          TextStyle(
                                            fontSize:
                                            8,
                                            color: selected ==
                                                index
                                                ? Colors.black
                                                : Colors.white,
                                            fontStyle:
                                            FontStyle.italic,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),

                                        InkWell(
                                          onTap:
                                              () {
                                            joinQueue =
                                            "no";
                                            selectedStylistName = stylist[index]
                                                .fullName
                                                .toString();
                                            selectedStylistId = stylist[index]
                                                .uid
                                                .toString();
                                            selectedStylistImage = stylist[index]
                                                .image
                                                .toString();
                                            print(
                                                selectedStylistName);
                                            setState(
                                                    () {
                                                  customerName++;
                                                });
                                            showDialog(
                                              context:
                                              context,
                                              builder:
                                                  (BuildContext context) {
                                                return CustomDialog(
                                                  customerName: customerName,
                                                );
                                              },
                                            );
                                          },
                                          child:
                                          Container(
                                            decoration:
                                            BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(40),
                                              color: selected == index
                                                  ? Colors.black
                                                  : AppColors.yellowColors,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal:
                                                20,
                                                vertical:
                                                7.5),
                                            child:
                                            const Text(
                                              'Book a slot',
                                              textAlign:
                                              TextAlign.center,
                                              style:
                                              TextStyle(
                                                color:
                                                Colors.white,
                                                fontSize:
                                                12,
                                              ),
                                            ),
                                          ),
                                        )

                                        // ghjk
                                        // _buildButton(
                                        //
                                        //   text: 'Book A Slot',
                                        //   color: selected == i
                                        //       ? Colors.black
                                        //       : AppColors.yellowColors,
                                        //
                                        //   i: i,
                                        // )
                                      ],
                                    ),

                                    const Spacer(),
                                    Column(
                                      children: [
                                        if (stylist[index]
                                            .image
                                            .toString() !=
                                            'null')
                                          Container(
                                            height:
                                            65,
                                            width:
                                            65,
                                            decoration:
                                            BoxDecoration(
                                              border:
                                              Border.all(color: AppColors.yellowColors),
                                              borderRadius:
                                              BorderRadius.circular(120),
                                              image:
                                              DecorationImage(
                                                image:
                                                NetworkImage(
                                                  stylist[index].image.toString(),
                                                ),
                                                fit:
                                                BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        const SizedBox(
                                          height:
                                          10,
                                        ),
                                        Text(
                                          stylist[index]
                                              .fullName
                                              .toString(),
                                          style:
                                          const TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize:
                                            14,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),

                                    Column(
                                      children: [
                                        Image.asset(
                                          AppImages
                                              .yellowCalender,
                                          width: 18,
                                          height:
                                          18,
                                          color: selected ==
                                              index
                                              ? Colors
                                              .black
                                              : AppColors
                                              .yellowColors,
                                          fit: BoxFit
                                              .cover,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        if (minutesLeft
                                            .isNotEmpty)
                                          Text(
                                            'Empty Seat',
                                            style:
                                            TextStyle(
                                              fontSize:
                                              13,
                                              color: selected == index
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        // if(minutesLeft.isNotEmpty)
                                        if (int.parse(
                                            freeSlots1[index].toString()) >
                                            0)
                                          Text(
                                            'Available in ${freeSlots1[index].toString()} min',
                                            style:
                                            TextStyle(
                                              fontSize:
                                              13,
                                              color: selected == index
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        if (int.parse(
                                            freeSlots1[index].toString()) <
                                            1)
                                          Text(
                                            'Available now',
                                            style:
                                            TextStyle(
                                              fontSize:
                                              13,
                                              color: selected == index
                                                  ? Colors.black
                                                  : Colors.white,
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        if (quesFinal
                                            .isNotEmpty)
                                          Text(
                                            '${quesFinal[index].toString()} customers in queue',
                                            style:
                                            TextStyle(
                                              fontSize:
                                              8,
                                              color: selected == index
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontStyle:
                                              FontStyle.italic,
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        _buildButton(
                                          text:
                                          'Join Now',
                                          color: Colors
                                              .green,
                                          i: index,
                                        )
                                      ],
                                    )

                                    // _buildColumn(
                                    //   url: AppImages.yellowCalender,
                                    //   t1: 'Empty Seat',
                                    //   t2: 'Available in 20 min',
                                    //   t3: '${i + 0} customer in queue',
                                    //   btnColors: Colors.green,
                                    //   btnText: 'Join Now',
                                    //   i: i,
                                    // ),
                                  ],
                                ),
                              ),
                            ),

                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn({
    String? t1,
    String? t2,
    String? t3,
    String? btnText,
    Color? btnColors,
    String? url,
    required int i,
  }) {
    return Column(
      children: [
        Image.asset(
          url ?? AppImages.yellowGrid,
          width: 18,
          height: 18,
          color: selected == i ? Colors.black : AppColors.yellowColors,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          t1 ?? 'Available',
          style: TextStyle(
            fontSize: 13,
            color: selected == i ? Colors.black : Colors.white,
          ),
        ),
        Text(
          t2 ?? 'Time Slots',
          style: TextStyle(
            fontSize: 13,
            color: selected == i ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          t3 ?? 'M , T , W , T , F , S , S',
          style: TextStyle(
            fontSize: 8,
            color: selected == i ? Colors.black : Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _buildButton(
          text: btnText ?? 'Book A Slot',
          color: btnColors ?? AppColors.yellowColors,
          i: i,
        )
      ],
    );
  }

  Widget _buildCartAndBell(
      {required String url, required BuildContext context}) {
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

  Widget _buildButton({
    required int i,
    required String text,
    required Color color,
  }) {
    return InkWell(
      onTap: () {

        if (minutesLeft.length < i) {
          Fluttertoast.showToast(msg: "You can not join a queue");
        } else {
          if (freeSlots2[i] == "0") {
            joinNow = true;
            DateTime now = DateTime.now();
            // now = now.add(const Duration(minutes: 15));
            selectedTimeFrom =
                "${now.hour < 10 ? '0' : ''}${now.hour}:${now.minute < 10 ? '0' : ''}${now.minute}";
          } else {
          joinNow = false;
            TimeOfDay _time = TimeOfDay(
                hour: int.parse(freeSlots2[i].split(":")[0]),
                minute: int.parse(freeSlots2[i].split(":")[1]));
            selectedTimeFrom =
                "${_time.hour < 10 ? 0 : ''}${_time.hour}:${_time.minute < 10 ? 0 : ''}${_time.minute}";

            DateTime sel = DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                _time.hour,
                _time.minute);

            if(sel.compareTo(DateTime.now())<0){
              selectedTimeFrom = "${DateTime.now().hour < 10 ? 0 : ''}${DateTime.now().hour}:${DateTime.now().minute < 10 ? 0 : ''}${DateTime.now().minute}";
              print("Tapinda");
            }else{
              print("uuu");
            }
          }
          Fluttertoast.showToast(msg: "free slot at $selectedTimeFrom");

          nextAvailableSlot = freeSlots[i];
          joinQueue = "yes";
          selectedStylistName = stylist[i].fullName.toString();
          selectedStylistId = stylist[i].uid.toString();
          selectedStylistImage = stylist[i].image.toString();
          print(selectedStylistName);
          setState(() {
            customerName++;
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                customerName: customerName,
              );
            },
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: color),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildColorContainer(
      {required Color color,
      required String image,
      required String name,
      required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(120),
                    border: Border.all(width: 2, color: color)),
                child: const SizedBox()),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHorizontalList() {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       customerName++;
            //     });
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return CustomDialog(
            //           customerName: customerName,
            //         );
            //       },
            //     );
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 15),
            //     child: Column(
            //       children: [
            //         Container(
            //             height: 60,
            //             width: 60,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey,
            //                 borderRadius: BorderRadius.circular(120),
            //                 border: Border.all(width: 2, color: Colors.white)),
            //             child: const Center(
            //               child: Text(
            //                 'Anybody',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 12,
            //                 ),
            //               ),
            //             )),
            //         const SizedBox(
            //           height: 5,
            //         ),
            //         const Center(
            //           child: Text(
            //             '',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontSize: 12,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            _buildColorContainer(
                color: Colors.green,
                image: AppImages.whiteMan,
                name: 'Henry',
                onTap: () {
                  scrollController.animateTo(800,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                  selected = 4;
                  setState(() {});
                }),
            _buildColorContainer(
              color: AppColors.yellowColors,
              image: AppImages.girl,
              name: 'Tasha',
              onTap: () {
                scrollController.animateTo(900,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                selected = 5;
                setState(() {});
              },
            ),
            _buildBlackCircle(),
            _buildBlackCircle(),
            _buildBlackCircle(),
            _buildBlackCircle(),
            _buildBlackCircle(),
            _buildBlackCircle(),
          ],
        ));
  }

  Widget _buildBlackCircle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                customerName++;
              });
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomDialog(
                    customerName: customerName,
                  );
                },
              );
            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.girl1),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                      Colors.black54,
                      BlendMode.colorBurn,
                    )),
                borderRadius: BorderRadius.circular(120),
              ),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: Text(
                      'Book a  Slot',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.yellowColors,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Center(
            child: Text(
              'Jack',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  final int customerName;

  const CustomDialog({
    Key? key,
    required this.customerName,
  }) : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), //this right here
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildDialogButton(
                    text: 'Individual Booking',
                    onTap: () {
                      groupBooking = "0";
                      selectedIndex = 0;
                      setState(() {});
                    },
                    i: 0,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildDialogButton(
                    text: 'Group Booking',
                    onTap: () {
                      groupBooking = "1";
                      selectedIndex = 1;
                      setState(() {});
                    },
                    i: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: selectedIndex == -1
                          ? () {}
                          : selectedIndex == 0
                              ? () {
                                  Navigator.of(context).pop();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CustomDialogTriming();
                                    },
                                  );
                                }
                              : () {
                                  Navigator.of(context).pop();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialogName(
                                          customerName: widget.customerName);
                                    },
                                  );
                                },
                      style: TextButton.styleFrom(
                        backgroundColor: selectedIndex == -1
                            ? Colors.grey
                            : AppColors.yellowColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int selectedIndex = -1;

  Widget _buildDialogButton(
      {required String text, required int i, required VoidCallback onTap}) {
    return SizedBox(
      width: 190,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor:
              selectedIndex == i ? AppColors.yellowColors : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}


class CustomDialogTriming extends StatefulWidget {
  const CustomDialogTriming({Key? key}) : super(key: key);

  @override
  _CustomDialogTrimingState createState() => _CustomDialogTrimingState();
}

class _CustomDialogTrimingState extends State<CustomDialogTriming> {
  var _page = 0;

  List<String> finalSlots = [
    '08:00',
    '08:15',
    '08:30',
    '08:45',
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

  late PageController pageController;

  String loadingText = "Loading...";
  final _fireStore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  List<ServiceModel> services = [];

  List<Color> colors = [];
  String queueMonth = "";

  Future<void> _getData() async {
    QuerySnapshot querySnapshot = await _fireStore
        .collection('service')
        .where("uid", isEqualTo: selectedStylistId)
        .get();
    services = List.from(querySnapshot.docs.map(
      (doc) => ServiceModel.fromSnapshot(doc),
    ));

    for (int i = 0; i < services.length; i++) {
      colors.add(AppColors.orangeMainColor);
    }
    if (DateTime.now().month == 1) {
      queueMonth = 'January';
    }
    if (DateTime.now().month == 2) {
      queueMonth = 'February';
    }
    if (DateTime.now().month == 3) {
      queueMonth = 'March';
    }
    if (DateTime.now().month == 4) {
      queueMonth = 'April';
    }
    if (DateTime.now().month == 5) {
      queueMonth = 'May';
    }
    if (DateTime.now().month == 6) {
      queueMonth = 'June';
    }
    if (DateTime.now().month == 7) {
      queueMonth = 'July';
    }
    if (DateTime.now().month == 8) {
      queueMonth = 'August';
    }
    if (DateTime.now().month == 9) {
      queueMonth = 'September';
    }
    if (DateTime.now().month == 10) {
      queueMonth = 'October';
    }
    if (DateTime.now().month == 11) {
      queueMonth = 'November';
    }
    if (DateTime.now().month == 12) {
      queueMonth = 'December';
    }

    setState(() {
      loadingText = "There are no services";
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    Future.delayed(Duration.zero, () async {
      await _getData();
    });
  }

  bool istrue = false;
  bool istrue1 = false;
  bool istrue2 = false;
  bool istrue3 = false;
  bool istrue4 = false;
  bool istrue5 = false;
  bool istrue6 = false;
  bool istrue7 = false;
  bool istrue8 = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        //this right here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.network(
                      selectedStylistImage,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    selectedStylistName,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      children: [
                        _buildAllCategoriesScrollPage(),
                        // _buildScrollPage(category: '1'),
                        // _buildScrollPage(category: '2'),
                        // _buildScrollPage(category: '3'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90, top: 10),
              child: Row(
                children: [
                  Visibility(
                    visible: _visible,
                    child: Expanded(
                        child: TextButton(
                      onPressed: () {
                        if (joinQueue == "yes") {
                          checkouts.clear();
                          CheckoutModel checkoutModel = CheckoutModel();
                          checkoutModel.id =
                              "${_auth.currentUser?.uid}${DateTime.now().millisecondsSinceEpoch}";
                          checkoutModel.uid = _auth.currentUser?.uid;
                          checkoutModel.userName = userName;
                          checkoutModel.email = _auth.currentUser?.email;
                          checkoutModel.stylistId = selectedStylistId;
                          checkoutModel.stylistId =
                              selectedServices[0].serviceId;
                          checkoutModel.style = selectedServices[0].serviceName;
                          checkoutModel.slot = nextAvailableSlot;
                          checkoutModel.day = DateTime.now().day;
                          checkoutModel.month = queueMonth;
                          checkoutModel.mon = DateTime.now().month;
                          checkoutModel.year = DateTime.now().year.toString();
                          checkoutModel.shop = selectedShop;
                          checkoutModel.contactNumber = contactNumber;
                          checkoutModel.price = selectedServices[0].price;
                          checkoutModel.queue = "yes";
                          checkoutModel.shopName = shopName;
                          checkouts.add(checkoutModel);
                          Get.to(() => const AddNewCustomer());

                          // if(selectedSlot1 != '-1'){
                          //   selectedSlot1 = '-1';
                          //   _postToFireStore1(context, 0);
                          // }
                          // if(selectedSlot2 != '-1'){
                          //   selectedSlot2 = '-1';
                          //   _postToFireStore2(context, 0);
                          // }if(selectedSlot3 != '-1'){
                          //   selectedSlot3 = '-1';
                          //   _postToFireStore3(context, 0);
                          // }if(selectedSlot4 != '-1'){
                          //   selectedSlot4 = '-1';
                          //   _postToFireStore4(context, 0);
                          // }if(selectedSlot5 != '-1'){
                          //   selectedSlot5 = '-1';
                          //   _postToFireStore5(context, 0);
                          // }if(selectedSlot6 != '-1'){
                          //   selectedSlot6 = '-1';
                          //   _postToFireStore6(context, 0);
                          // }if(selectedSlot7 != '-1'){
                          //   selectedSlot7 = '-1';
                          //   _postToFireStore7(context, 0);
                          // }if(selectedSlot8 != '-1'){
                          //   selectedSlot8 = '-1';
                          //   _postToFireStore8(context, 0);
                          // }
                          //
                          // _postToFireStore(context, 0);
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MakeBookingPage()));
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.yellowColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ),

            // Expanded(
            //   child: Container(
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(
            //           12,
            //         ),
            //         border: Border.all(color: Colors.white),
            //         color: Colors.black),
            //     child: SingleChildScrollView(
            //       padding: const EdgeInsets.all(20),
            //       child:
            //       Column(crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           _buildExpansionTile(
            //             title: 'Top Level Cat. 2',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Facil Hair Cut',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Top Level Cat. 1',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Top Level Cat. 2',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Top Level Cat. 3',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Top Level Cat. 4',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Spcial Service',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Hair Cuts',
            //           ),
            //           _buildExpansionTile(
            //             title: 'Hair Cuts',
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   'Select Another Barber',
            //   style: TextStyle(color: AppColors.yellowColors, fontSize: 18),
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            // SizedBox(
            //   height: 130,
            //   child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (c, i) {
            //         return _buildColorContainer();
            //       },
            //       separatorBuilder: (context, i) {
            //         return SizedBox(
            //           width: 30,
            //         );
            //       },
            //       itemCount: 6),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 90, right: 90, top: 10),
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: TextButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => const MakeBookingPage()));
            //         },
            //         child: const Padding(
            //           padding: EdgeInsets.symmetric(vertical: 2),
            //           child: Text(
            //             'Continue',
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //         style: TextButton.styleFrom(
            //           backgroundColor: AppColors.yellowColors,
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //         ),
            //       ))
            //     ],
            //   ),
            // ),
          ],
        ));
  }

  Widget _buildScrollPage({
    required String category,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Category $category',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _buildCon(
            isTrue: isTrue,
            onTap: () {
              isTrue = !isTrue;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue1,
            onTap: () {
              isTrue1 = !isTrue1;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue2,
            onTap: () {
              isTrue2 = !isTrue2;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue3,
            onTap: () {
              isTrue3 = !isTrue3;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue4,
            onTap: () {
              isTrue4 = !isTrue4;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue5,
            onTap: () {
              isTrue5 = !isTrue5;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue6,
            onTap: () {
              isTrue6 = !isTrue6;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue7,
            onTap: () {
              isTrue7 = !isTrue7;
              setState(() {});
            }),
        _buildCon(
            isTrue: isTrue8,
            onTap: () {
              isTrue8 = !isTrue8;
              setState(() {});
            }),
      ],
    );
  }

  Widget _buildAllCategoriesScrollPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Services",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          for (int i = 0; i < services.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white)),
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyTooltip(
                    message: services[i].serviceName.toString(),
                    child: const Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        services[i].serviceName.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${services[i].totalDuration.toString()} Minutes',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey,
                  ),
                  Text(
                    ' £ ${services[i].price.toString()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey,
                  ),
                  TextButton(
                    onPressed: () {
                      _visible = true;
                      DateTime end = DateTime.now();
                      serviceTime =
                          int.parse(services[i].totalDuration.toString());

                      ///Join queue slots
                      if (joinQueue == "yes") {
                        TimeOfDay _startTime = TimeOfDay(
                            hour: int.parse(selectedTimeFrom.split(":")[0]),
                            minute: int.parse(selectedTimeFrom.split(":")[1]));
                        DateTime start = DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                            _startTime.hour,
                            _startTime.minute);

                        // start.add(Duration(minutes: int.parse(services[i].totalDuration.toString())));
                        if(joinNow){
                          end = start.add(Duration(
                              minutes: int.parse(
                                  services[i].totalDuration.toString()) +15));
                        }else{
                          end = start.add(Duration(
                              minutes: int.parse(
                                  services[i].totalDuration.toString())));
                        }

                        selectedTimeTo1 =
                            "${end.hour < 10 ? 0 : ''}${end.hour}:${end.minute < 10 ? 0 : ''}${end.minute}";
                        serviceTime =
                            int.parse(services[i].totalDuration.toString());
                      }

                      ///Book a slot

                      if (joinQueue != "yes") {
                        if(joinNow) {
                          serviceTime =
                            int.parse(services[i].totalDuration.toString()) +15;
                        }else{
                          serviceTime =
                              int.parse(services[i].totalDuration.toString());
                        }
                        Fluttertoast.showToast(msg: serviceTime.toString());
                      }

                      if (groupBooking == "0") {
                        selectedServices.clear();
                        stylistId = services[i].uid.toString();
                        selectedServices.add(services[i]);
                        for (int i = 0; i < services.length; i++) {
                          colors[i] = AppColors.orangeMainColor;
                        }
                      }
                      if (colors[i] == AppColors.orangeMainColor) {
                        colors[i] = AppColors.greyColor;
                      } else {
                        colors[i] = AppColors.orangeMainColor;
                      }
                      setState(() {});
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: colors[i],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Select",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )

          // _buildCon(
          //     isTrue: isTrue,
          //     onTap: () {
          //       isTrue = !isTrue;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue1,
          //     onTap: () {
          //       isTrue1 = !isTrue1;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue2,
          //     onTap: () {
          //       isTrue2 = !isTrue2;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue3,
          //     onTap: () {
          //       isTrue3 = !isTrue3;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue4,
          //     onTap: () {
          //       isTrue4 = !isTrue4;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue5,
          //     onTap: () {
          //       isTrue5 = !isTrue5;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue6,
          //     onTap: () {
          //       isTrue6 = !isTrue6;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue7,
          //     onTap: () {
          //       isTrue7 = !isTrue7;
          //       setState(() {});
          //     }),
          // _buildCon(
          //     isTrue: isTrue8,
          //     onTap: () {
          //       isTrue8 = !isTrue8;
          //       setState(() {});
          //     }),
        ],
      ),
    );
  }

  Widget _buildCon({required bool isTrue, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white)),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Row(
        children: [
          const MyTooltip(
            message: 'Trimming',
            child: Icon(
              Icons.error_outline,
              color: Colors.grey,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Trimming',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '18 Minutes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
          const Text(
            ' £ 120',
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey,
          ),
          TextButton(
            onPressed: onTap,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Select",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: isTrue ? AppColors.yellowColors : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  // Widget _buildExpansionTile({required String title}) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 10),
  //     padding: EdgeInsets.zero,
  //     decoration: BoxDecoration(
  //         color: AppColors.yellowColors,
  //         borderRadius: BorderRadius.circular(10)),
  //     child: ExpansionTile(
  //       backgroundColor: Colors.black,
  //       childrenPadding: EdgeInsets.zero,
  //       title: Text(
  //         title,
  //         style: const TextStyle(color: Colors.white),
  //       ),
  //       children: [_buildContainer()],
  //     ),
  //   );
  // }
  //
  // Widget _buildContainer() {
  //   return Column(
  //     children: [
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 10),
  //         decoration: BoxDecoration(
  //             color: Colors.black54,
  //             borderRadius: BorderRadius.circular(8),
  //             border: Border.all(color: Colors.white)),
  //         padding: const EdgeInsets.symmetric(
  //           vertical: 5,
  //           horizontal: 10,
  //         ),
  //         child: Row(
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: const [
  //                 Text(
  //                   'Trimming',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Text(
  //                   '18',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 13,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 1,
  //               height: 40,
  //               color: Colors.grey,
  //             ),
  //             const Text(
  //               ' 120',
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 13,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             Container(
  //               width: 1,
  //               height: 40,
  //               color: Colors.grey,
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 isTrue = !isTrue;
  //                 setState(() {});
  //               },
  //               child: const Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 15),
  //                 child: Text(
  //                   "Select",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //               style: TextButton.styleFrom(
  //                 backgroundColor:
  //                     isTrue ? AppColors.yellowColors : Colors.grey,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //               ),
  //             ),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         ),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 20),
  //         decoration: BoxDecoration(
  //             color: Colors.black54,
  //             borderRadius: BorderRadius.circular(8),
  //             border: Border.all(color: Colors.white)),
  //         padding: const EdgeInsets.symmetric(
  //           vertical: 5,
  //           horizontal: 10,
  //         ),
  //         child: Row(
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: const [
  //                 Text(
  //                   'Trimming',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Text(
  //                   '18',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 13,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 1,
  //               height: 40,
  //               color: Colors.grey,
  //             ),
  //             const Text(
  //               ' 120',
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 13,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             Container(
  //               width: 1,
  //               height: 40,
  //               color: Colors.grey,
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 isTrue1 = !isTrue1;
  //                 setState(() {});
  //               },
  //               child: const Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 15),
  //                 child: Text(
  //                   "Select",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //               style: TextButton.styleFrom(
  //                 backgroundColor:
  //                     isTrue1 ? AppColors.yellowColors : Colors.grey,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //               ),
  //             ),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         ),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.only(bottom: 20),
  //         decoration: BoxDecoration(
  //             color: Colors.black54,
  //             borderRadius: BorderRadius.circular(8),
  //             border: Border.all(color: Colors.white)),
  //         padding: const EdgeInsets.symmetric(
  //           vertical: 5,
  //           horizontal: 10,
  //         ),
  //         child: Row(
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: const [
  //                 Text(
  //                   'Trimming',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 Text(
  //                   '18',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 13,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Container(
  //               width: 1,
  //               height: 40,
  //               color: Colors.grey,
  //             ),
  //             const Text(
  //               ' 120',
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 13,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             Container(
  //               width: 1,
  //               height: 40,
  //               color: Colors.grey,
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 isTrue2 = !isTrue2;
  //                 setState(() {});
  //               },
  //               child: const Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 15),
  //                 child: Text(
  //                   "Select",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //               style: TextButton.styleFrom(
  //                 backgroundColor:
  //                     isTrue2 ? AppColors.yellowColors : Colors.grey,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //               ),
  //             ),
  //           ],
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Color color = AppColors.yellowColors;
  int selected = -1;

  bool isTrue = true;
  bool isTrue1 = true;
  bool isTrue2 = true;
  bool isTrue3 = true;
  bool isTrue4 = true;
  bool isTrue5 = true;
  bool isTrue6 = true;
  bool isTrue7 = true;
  bool isTrue8 = true;

  _postToFireStore(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    documentQ.id = checkouts[i].id;
    documentQ.uid = checkouts[i].uid;
    documentQ.userName = checkouts[i].userName;
    documentQ.email = checkouts[i].email;
    documentQ.style = checkouts[i].style;
    documentQ.styleId = checkouts[i].stylistId;
    documentQ.stylistId = selectedStylistId;
    documentQ.slot = freeSlots[0];
    documentQ.day = checkouts[i].day;
    documentQ.month = checkouts[i].month;
    documentQ.year = checkouts[i].year;
    documentQ.shop = checkouts[i].shop;
    documentQ.contactNumber = checkouts[i].contactNumber;
    documentQ.mon = checkouts[i].mon;
    documentQ.price = checkouts[i].price;
    documentQ.note = checkouts[i].note;
    documentQ.shopName = shopName;
    documentQ.queue = "yes";

    await firebaseFirestore
        .collection("bookings")
        .doc(documentQ.id)
        .set(documentQ.toMap(), SetOptions(merge: true));
    Fluttertoast.showToast(msg: "Added successful");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CurrentAndFutureBooking()));
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ReportScreen()), (route) => false);
  }

  _postToFireStore1(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}1';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[1];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore2(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}2';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[2];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore3(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}3';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[3];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore4(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}4';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[4];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore5(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}5';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[5];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore6(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}6';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[6];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore7(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}7';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[7];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }

  _postToFireStore8(BuildContext context, int i) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    CheckoutModel document = CheckoutModel();
    document.id = '${checkouts[i].id}8';
    document.uid = checkouts[i].uid;
    document.userName = checkouts[i].userName;
    document.email = checkouts[i].email;
    document.style = checkouts[i].style;
    document.styleId = checkouts[i].stylistId;
    document.stylistId = selectedStylistId;
    document.slot = freeSlots[8];
    document.day = checkouts[i].day;
    document.month = checkouts[i].month;
    document.year = checkouts[i].year;
    document.shop = checkouts[i].shop;
    document.contactNumber = checkouts[i].contactNumber;
    document.mon = checkouts[i].mon;
    document.price = checkouts[i].price;
    document.queue = "no";
    document.note = "childElement";
    document.shopName = shopName;

    await firebaseFirestore
        .collection("bookings")
        .doc(document.id)
        .set(document.toMap(), SetOptions(merge: true));
  }
}

class CustomDialogName extends StatefulWidget {
  final int customerName;

  const CustomDialogName({
    Key? key,
    required this.customerName,
  }) : super(key: key);

  @override
  _CustomDialogNameState createState() => _CustomDialogNameState();
}

class _CustomDialogNameState extends State<CustomDialogName> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ), //this right here
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'How many in group?',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.yellowColors),
                            ),
                            SizedBox(
                              height: 40,
                              width: 42,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: AppColors.yellowColors),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  hintText: '_',
                                  hintStyle:
                                      TextStyle(color: AppColors.yellowColors),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: AppColors.yellowColors)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: AppColors.yellowColors)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'Enter Customer Name (${widget.customerName.toString()})',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: TextFormField(
                        style: TextStyle(color: AppColors.yellowColors),
                        decoration: InputDecoration(
                          hintText: 'Enter Full Name',
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
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialogTriming();
                            });
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.yellowColors,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ))
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

class MyTooltip extends StatelessWidget {
  final Widget child;
  final String message;

  const MyTooltip({Key? key, required this.message, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}

class Task {
  int day;

  int hours;
  int minutes;
  int seconds;

  Task({this.seconds = 0, this.minutes = 0, this.hours = 0, this.day = 0});
}
