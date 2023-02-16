import 'package:flutter/material.dart';

class Appnavigation {
  push(Widget widget, BuildContext context)async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget));
  }
  pushReplacement(Widget widget, BuildContext context) {
    return Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => widget,
      ),
          (route) => false,//if you want to disable back feature set to false
    );
  }

  pop(BuildContext context,[dynamic data]) {
    return Navigator.of(context).pop(data);
  }
}
