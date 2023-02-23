

import 'package:barber_app/src/ui/model/serviceModel.dart';

import 'model/chekOutModel.dart';

String selectedShop = "";
String shopAddress = "";
String shopCity = "";
String shopCountry = "";
String selectedStylistName = "";
String selectedStylistId = "";
String selectedStylistImage = "";
String selectedSlot = "";
String selectedSlot1 = "";
String selectedSlot2 = "";
String selectedSlot3 = "";
String selectedSlot4 = "";
String selectedSlot5 = "";
String selectedSlot6 = "";
String selectedSlot7 = "";
String selectedSlot8 = "";
String userName = "";
String contactNumber = "";
String selectedMonth = "";
int mon =DateTime.now().month;
int selectedDate = DateTime.now().day;
String stylistId = "";
String selectedServiceId = "";
String selectedServiceName = "";
String selectedCategory = "";
double price = 0;
int serviceTime = 0;//Duration of the service
String selectedTimeFrom = "";//Time the service is starting
String selectedTimeTo1 = "";// Time, the service is ending
String groupBooking = "0";//is it group booking or individual bookings
List<ServiceModel> selectedServices = [];
List<CheckoutModel> checkouts = [];
double totalPrice=  0;
int addNote= -1;
String shopName = "";
String joinQueue = '0';
String nextAvailableSlot = "";
List<String> freeSlots = [];
String thisMonth = "";
bool joinNow = true;// Checks to add 15 min lead time

CheckoutModel documentQ = CheckoutModel();