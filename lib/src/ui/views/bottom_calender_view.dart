import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../widgets/bottom_sheet.dart';

class CalenderBottomView extends StatefulWidget {
  const CalenderBottomView({Key? key}) : super(key: key);

  @override
  State<CalenderBottomView> createState() => _CalenderBottomViewState();
}

class _CalenderBottomViewState extends State<CalenderBottomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      bottomNavigationBar: const CustomBottomSheet(),
      body: Center(
        child: Text(
          '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!bjkbkjbkbjkb!',
          style: TextStyle(fontSize: 50, color: AppColors.yellowColors),
        ),
      ),
    );
  }
}
