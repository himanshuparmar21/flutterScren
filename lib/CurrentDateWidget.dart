import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDateWidget extends StatelessWidget {
  FontWeight? weight = FontWeight.normal;
  CurrentDateWidget([FontWeight? weight]){
    this.weight=weight;
  }
  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Format the date using intl package
    String formattedDate = DateFormat('d MMM y').format(currentDate);

    return Text(
      '$formattedDate',
      style: TextStyle(fontSize: 11,fontWeight: weight),
    );
  }
}
