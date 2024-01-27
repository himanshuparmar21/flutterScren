import 'package:flutter/material.dart';
import 'package:screenproject/CurrentDateWidget.dart';
import 'package:screenproject/allnote.dart';

Widget dataShow(index,context){
  return SafeArea(
    child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        title: Container(
            alignment: Alignment.topCenter,
            child: Text(
              "Logo",
              style: TextStyle(color: Colors.white),
            )),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            alignment: Alignment.topLeft,
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () {
                    Navigator.pop(context,);
                    },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      // noteData.removeAt(index);
                      // noteSubData.removeAt(index);
                      // Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.save_alt_outlined,
                      color: Colors.white,
                    )),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 720,
            width: 410,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 24, right: 12, top: 22),
                    child: Text(
                      noteData[index],
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 24, right: 12, top: 10),
                    child: CurrentDateWidget(FontWeight.w300),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 24, right: 12, top: 14),
                    child: Text(
                      noteSubData[index],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
