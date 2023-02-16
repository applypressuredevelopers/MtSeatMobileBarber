import 'package:barber_app/src/utils/color.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_sheet.dart';

class SearchBottomView extends StatefulWidget {
  const SearchBottomView({Key? key}) : super(key: key);

  @override
  State<SearchBottomView> createState() => _SearchBottomViewState();
}

class _SearchBottomViewState extends State<SearchBottomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,        bottomNavigationBar: const CustomBottomSheet(),

      body: Center(
        child: Text(
          '....................................',
          style: TextStyle(fontSize: 50, color: AppColors.yellowColors,),
        ),
      ),
    );
  }
}
