import 'package:barber_app/src/ui/auth/login/login_screen.dart';
import 'package:barber_app/src/ui/home_page.dart';
import 'package:barber_app/src/ui/pages/current_future_booking.dart';
import 'package:barber_app/src/ui/pages/map_page.dart';
import 'package:barber_app/src/ui/views/bottom_home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey =
      "pk_test_51L6DRDAoSLyMNyjeyJVMPzZ6z73idcQGBf39v0CQYNEUzNnOEZrEY1gfi361SAidrouV6vmtVLJx1QqZDjLQXCy400lx6I31Hy";
  Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(dividerColor: Colors.transparent),
      // home: const BottomHomeView(),
      // //home: CurrentAndFutureBooking(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
