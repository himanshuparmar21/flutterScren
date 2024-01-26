import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:screenproject/FilledCardExample.dart';
import 'package:screenproject/allnote.dart';
import 'package:screenproject/addnote.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

TextEditingController urlController = TextEditingController();

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Recents Notes",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => addNote(),
                //     )).then((value) {
                //       setState(() {
                //         build(context);
                //         print(value);
                //       });
                //     },);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => addNote(),
                )).then((value) {
                  setState(() {
                    noteData.add(value[0]);
                    noteSubData.add(value[1]);
                  });
                }).then((value) => Navigator.pushNamed(context, '/allNote'));
              },
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: Colors.blue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_outlined,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 87),
              child: Text(
                'Here are your recently viewed or added notes',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 17.0, vertical: 15),
              height: 155.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    child: FilledCardExample(index, context),
                  );
                },
                itemCount: (noteData.length),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                print("See All");
              },
              child: Center(
                child: Container(
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => allNote()),
                      // );
                      Navigator.pushNamed(context, '/allNote');
                    },
                    child: Text(
                      "See All Notes >",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 18),
                    child: Text(
                      "Media",
                      style: TextStyle(
                          fontSize: 21.5, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.more_horiz_outlined)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 17),
              child: Text("Quickly add media to a new note."),
            ),
            SizedBox(
              height: 25,
            ),
            DottedBorder(
              color: Colors.blue,
              strokeWidth: 1,
              child: Container(
                height: 200,
                width: 360,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset("assets/images/uploadImgae.jpg"),
                    ),
                    Container(
                      child:
                      Text("Upload a document or image from your computer"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 21),
                  height: 1,
                  width: 165,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Or"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 18),
                  height: 1,
                  width: 165,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 17),
              child: Text(
                "Paste a URL and save to a new note.",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 17, top: 10, right: 10),
              child: TextField(
                readOnly: true,
                controller: urlController,
                decoration: InputDecoration(
                  icon: Container(
                    child: Icon(Icons.public, color: Colors.blue),
                  ),
                  labelText: "Your URL...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(42.0),
                  ),
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
