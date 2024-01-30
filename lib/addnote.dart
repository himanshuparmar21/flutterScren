import 'package:flutter/material.dart';


class addNote extends StatefulWidget {
  const addNote({super.key});

  @override
  State<addNote> createState() => _addNoteState();
}

TextEditingController noteDataEntry = TextEditingController();
TextEditingController noteSubDataEntry = TextEditingController();

class _addNoteState extends State<addNote> {
  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: IconButton(
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {},
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
                        )),
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
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Untitled",
                          hintStyle: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        controller: noteDataEntry,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      // Wrap the second TextField with SingleChildScrollView
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Start Writing Your Note",
                          ),
                          controller: noteSubDataEntry,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 17, 7, 25),
                            child: Icon(Icons.tag_outlined,
                                color: Colors.blue.shade800),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 17, 17, 25),
                            child: Text("Add Tag"),
                          ),
                          SizedBox(
                            width: 210,
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 17, 17, 17),
                              child: FloatingActionButton(
                                onPressed: () {
                                  dynamic data = noteDataEntry.text.toString();
                                  dynamic subData = noteSubDataEntry.text.toString();
                                  List<dynamic> temp = [];
                                  temp.add(data);
                                  temp.add(subData);
                                  noteDataEntry.clear();
                                  noteSubDataEntry.clear();
                                  Navigator.of(context).pop(
                                    temp,
                                  );
                                },
                                child: Text("Add"),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
