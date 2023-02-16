import 'package:barber_app/src/utils/color.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> list;
  final String? select;
  final String? hint;
  final Function(String) onChanged;

  const DropDownWidget({
    Key? key,
    required this.onChanged,
    required this.list,
    this.hint,
    required this.select,
  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? select;

  @override
  void initState() {
    super.initState();
    select = widget.select;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: AppColors.yellowColors,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        hint: Text(
          widget.hint ?? 'Check-In',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        underline: const SizedBox(),
        value: select,
        style: const TextStyle(color: Colors.black),
        // dropdownColor: Colors.grey,
        dropdownColor: Colors.black54,
        items: widget.list.map((String value) {
          return DropdownMenuItem<String>(
        onTap: (){EdgeInsets.zero;},    value: value,
            child: Text(
              value,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
        onChanged: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScope.of(context).requestFocus(FocusNode());

          setState(() {
            select = _!;
          });
          widget.onChanged(select!);
        },
      ),
    );
  }
}

class DropDownWidgetForMonths extends StatefulWidget {
  final List<String> list;
  final String? select;
  final String? hint;
  final Function(String) onChanged;

  const DropDownWidgetForMonths({
    Key? key,
    required this.onChanged,
    required this.list,
    this.hint,
    required this.select,
  }) : super(key: key);

  @override
  _DropDownWidgetForMonthsState createState() =>
      _DropDownWidgetForMonthsState();
}

class _DropDownWidgetForMonthsState extends State<DropDownWidgetForMonths> {
  String? select;

  @override
  void initState() {
    super.initState();
    select = widget.select;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 120,
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          widget.hint ?? 'Select Months',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        underline: const SizedBox(),
        value: select,
        style: const TextStyle(color: Colors.white),
        dropdownColor: Colors.black,
        focusColor: Colors.white,
        items: widget.list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        onChanged: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScope.of(context).requestFocus(FocusNode());

          setState(() {
            select = _!;
          });
          widget.onChanged(select!);
        },
      ),
    );
  }
}
