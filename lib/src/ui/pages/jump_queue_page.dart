
import 'package:barber_app/src/ui/pages/check_out_jump_queue_page.dart';
import 'package:barber_app/src/utils/color.dart';
import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';

import '../../utils/images.dart';
import '../widgets/bottom_sheet.dart';

class JumpQueue extends StatefulWidget {
  const JumpQueue({Key? key}) : super(key: key);

  @override
  _JumpQueueState createState() => _JumpQueueState();
}

class _JumpQueueState extends State<JumpQueue> {
  int customerName = 0;
  String? question1;

  // List<String> questionList = <String>[
  //   "Check-In",
  //   "Reviews",
  //   "Portfolio",
  //   "Detail",
  // ];
  // late Timer _timer;
  // int _start = 10000000;
  //
  // Task timerStart(int seconds) {
  //   int days = seconds ~/ 86400;
  //   seconds = seconds % 86400;
  //   int hours = seconds ~/ 3600;
  //   seconds = seconds % 3600;
  //   int minutes = seconds ~/ 60;
  //   seconds = seconds % 60;
  //   var task =
  //       Task(day: days, hours: hours, minutes: minutes, seconds: seconds);
  //   return task;
  // }

  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  ScrollController scrollController = ScrollController();

  int selected = -1;
  int selectedContainer = -1;

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
          'Jump Queue',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          _buildCartAndBell(url: AppImages.bell, context: context),
          _buildCartAndBell(url: AppImages.cart, context: context),
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
            padding: const EdgeInsets.only(bottom: 100),
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(AppImages.shop,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height: 120),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(AppImages.shop1,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height: 120),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(AppImages.shop2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height: 120),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(AppImages.shop3,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height: 120),
                        ),
                      ],
                    ),
                  ),
                ),
                // TabBarView(children: [],physics: ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
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
                              'Available \nQueue Slots',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 8,
                              ),
                            ),
                          ),
                        ),
                        const Text(
                          'Select a stylist below to jump to an earlier position in the queue.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1, color: Colors.white, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Row(
                      children: const [
                        Text("Henry's Cuts",
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        SizedBox(
                          width: 50,
                        ),
                        Text('Select A Service Provider',
                            style: TextStyle(fontSize: 8, color: Colors.white)),
                      ],
                    )),
                _buildHorizontalList(),
                for (int i = 0; i < 30; i++)
                  GestureDetector(
                    onDoubleTap: () {
                      selected = i;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      margin: const EdgeInsets.only(
                        left: 60,
                        right: 60,
                        bottom: 15,
                      ),
                      decoration: BoxDecoration(
                        color: selected == i
                            ? AppColors.yellowColors
                            : Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 2,
                          color: i == 0 ? Colors.green : AppColors.yellowColors,
                        ),
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.yellowColors),
                                  borderRadius: BorderRadius.circular(120),
                                  image: DecorationImage(
                                    image: AssetImage(i % 2 == 0
                                        ? AppImages.whiteMan
                                        : AppImages.girl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                i % 2 == 0 ? 'Henry' : 'Tasha',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          _buildColumn(url: AppImages.yellowCalender, i: i),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          )),
    );
  }

  Widget _buildColumn({String? url, required int i}) {
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
          'Empty Seat',
          style: TextStyle(
            fontSize: 13,
            color: selected == i ? Colors.black : Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'Available in 20min',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: selected == i ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${i + 0} customer in queue',
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
          text: 'Join Now',
          color: Colors.green,
          onTap: () {},
        ),
        const SizedBox(
          height: 5,
        ),
        _buildButton(
          text: 'View All Slots',
          color: selected == i ? Colors.black : AppColors.yellowColors,
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext c) {
                  return const Dialog(
                    backgroundColor: Colors.transparent,
                    child: ViewAllSlotsDialog(),
                  );
                });
          },
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

  Widget _buildButton(
      {required String text,
      required Color color,
      required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: color),
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontStyle: FontStyle.italic),
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) {
            return _buildColorContainer(
              color: i % 2 == 0 ? Colors.green : AppColors.yellowColors,
              image: i % 2 == 0 ? AppImages.whiteMan : AppImages.girl,
              name: i % 2 == 0 ? 'Henry' : 'Tasha',
              onTap: i % 2 == 0
                  ? () {
                      scrollController.animateTo(800,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      selected = 4;
                      setState(() {});
                    }
                  : () {
                      scrollController.animateTo(900,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                      selected = 5;
                      setState(() {});
                    },
            );
          },
        ));
  }
}

class ViewAllSlotsDialog extends StatefulWidget {
  const ViewAllSlotsDialog({Key? key}) : super(key: key);

  @override
  _ViewAllSlotsDialogState createState() => _ViewAllSlotsDialogState();
}

class _ViewAllSlotsDialogState extends State<ViewAllSlotsDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100, bottom: 30),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
                label: Text(
                  '          Request a slot',
                  style: TextStyle(
                      color: AppColors.yellowColors,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                children: [
                  _buildTimeSlots(
                    slot: '16:30',
                    i: 0,
                  ),
                  _buildTimeSlots(
                    slot: '16:45',
                    i: 1,
                  ),
                  _buildTimeSlots(
                    slot: '17:00',
                    i: 2,
                  ),
                  _buildTimeSlots(
                    slot: '17:15',
                    i: 3,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Row(
                children: [
                  _buildTimeSlots(
                    slot: '17:30',
                    i: 4,
                  ),
                  _buildTimeSlots(
                    slot: '17:45',
                    i: 5,
                  ),
                  _buildTimeSlots(
                    slot: '18:00',
                    i: 6,
                  ),
                  _buildTimeSlots(
                    slot: '18:15',
                    i: 7,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Row(
                children: [
                  _buildTimeSlots(
                    slot: '18:30',
                    i: 8,
                  ),
                  _buildTimeSlots(
                    slot: '18:45',
                    i: 9,
                  ),
                  _buildTimeSlots(
                    slot: '19:00',
                    i: 10,
                  ),
                  _buildTimeSlots(
                    slot: '19:15',
                    i: 11,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Row(
                children: [
                  _buildTimeSlots(
                    slot: '19:30',
                    i: 12,
                  ),
                  _buildTimeSlots(
                    slot: '19:45',
                    i: 13,
                  ),
                  _buildTimeSlots(
                    slot: '20:00',
                    i: 14,
                  ),
                  _buildTimeSlots(
                    slot: '20:15',
                    i: 15,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
            ,  Row(
                children: [
                  _buildTimeSlots(
                    slot: '20:30',
                    i: 16,
                  ),
                  _buildTimeSlots(
                    slot: '20:45',
                    i: 17,
                  ),
                  _buildTimeSlots(
                    slot: '21:00',
                    i: 18,
                  ),
                  _buildTimeSlots(
                    slot: '21:15',
                    i: 19,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
            ],
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Appnavigation().push(const CheckOutJumpQueuePage(), context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.white),
            ),
          ),
          style: TextButton.styleFrom(backgroundColor: AppColors.yellowColors),
        )
      ],
    );
  }

  int selectedTime = -1;

  Widget _buildTimeSlots({
    required String slot,
    required int i,
    // required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        selectedTime = i;
        setState(() {});
        // scrollController.animateTo(800,
        //     duration: const Duration(seconds: 2), curve: Curves.easeIn);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 4),
        decoration: BoxDecoration(
          color:
              selectedTime == i ? AppColors.yellowColors : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
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
}
