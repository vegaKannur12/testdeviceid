import 'package:flutter/material.dart';
//this is an external package for formatting date and time
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  // const CustomDatePicker({Key? key}) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime currentDate = DateTime.now();
  String? formattedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: currentDate.subtract(Duration(days: 0)),
        lastDate: DateTime(2023));
    if (pickedDate != null) {
      setState(() {
        currentDate = pickedDate;
      });
    } else {
      print("please select date");
    }
    formattedDate = DateFormat('dd-MM-yyyy').format(currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        height: 100,
        child: Center(
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: Icon(Icons.calendar_today),
              ),
              Container(
                  child: formattedDate == null
                      ? Text("select date")
                      : Text(formattedDate.toString())),
            ],
          ),
        ),
      
    );
  }
}
//////////////////////////////