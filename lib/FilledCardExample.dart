
import 'package:flutter/material.dart';
import 'package:screenproject/CurrentDateWidget.dart';
import 'package:screenproject/allnote.dart';
import 'package:screenproject/dataShow.dart';

//
List<Color> colors = [
  Colors.blue.shade200,
  Colors.red.shade200,
  Colors.green.shade200
];

Widget FilledCardExample(index,context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => dataShow(index,context),
        ),
      );
    },
    child: Center(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors[index % colors.length],
            width: 2.5,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
          ),
        ),
        elevation: 0,
        child: SizedBox(
          width: 115,
          height: 230,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 7, bottom: 6, left: 9),
                alignment: AlignmentDirectional.topStart,
                child: CurrentDateWidget(),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    noteData[index],
                    maxLines: 3,
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    noteSubData[index],
                    maxLines: 2,
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToLastDescent: false),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
