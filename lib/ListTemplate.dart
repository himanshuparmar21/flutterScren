import 'package:flutter/material.dart';
import 'package:screenproject/CurrentDateWidget.dart';
import 'package:screenproject/allnote.dart';

import 'dataShow.dart';

List<Color> colors = [
  Colors.blue.shade200,
  Colors.red.shade200,
  Colors.green.shade200
];

Widget listTemplate(index,context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => dataShow(index,context),
        ),
      );
    },
    child: Container(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors[(index) % colors.length],
            width: 2.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  width: 20,
                  height: 62,
                  color: colors[(index) % colors.length],
                  child: Icon(
                    Icons.file_copy_outlined,
                    size: 30,
                  )),
            ),
            Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.topLeft,
                  child: Column(children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        noteData[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        noteSubData[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: CurrentDateWidget(),
                    )
                  ]),
                ))
          ],
        ),
      ),
    ),
  );
}
