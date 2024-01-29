import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenproject/FilledCardExample.dart';
import 'package:screenproject/ListTemplate.dart';
import 'package:screenproject/addnote.dart';
import 'package:screenproject/homepage.dart';

var arrColor = [Colors.blue, Colors.red, Colors.green];

List<dynamic> noteData = ["Richard Dawkins","Title 1","Title 2","Title 3","Title 4"];
List<dynamic> noteSubData = ["The Richard Dawkins Award is an annual prize awarded by the Center for Inquiry (CFI), an American nonprofit organization. Established in 2003, it was initially awarded by the Atheist Alliance of America in coordination with Richard Dawkins and the Richard Dawkins Foundation for Reason and Science. The award was formally moved to CFI in 2019. The award was initially presented by the Atheist Alliance of America to honor an outstanding atheist who taught or advocated scientific knowledge and acceptance of nontheism, and raised public awareness. The award is currently presented by the Center for Inquiry to an individual associated with science, scholarship, education, or entertainment, and who publicly proclaims the values of secularism and rationalism, upholding scientific truth wherever it may lead. The recipient must be approved by Dawkins himself. The first Richard Dawkins Award was received by James Randi, a magician who investigated and debunked various paranormal claims. (Full list...)The Richard Dawkins Award is an annual prize awarded by the Center for Inquiry (CFI), an American nonprofit organization. Established in 2003, it was initially awarded by the Atheist Alliance of America in coordination with Richard Dawkins and the Richard Dawkins Foundation for Reason and Science. The award was formally moved to CFI in 2019. The award was initially presented by the Atheist Alliance of America to honor an outstanding atheist who taught or advocated scientific knowledge and acceptance of nontheism, and raised public awareness. The award is currently presented by the Center for Inquiry to an individual associated with science, scholarship, education, or entertainment, and who publicly proclaims the values of secularism and rationalism, upholding scientific truth wherever it may lead. The recipient must be approved by Dawkins himself. The first Richard Dawkins Award was received by James Randi, a magician who investigated and debunked various paranormal claims. (Full list...)","The body of the note...","The body of the note...","The body of the note...","The body of the note..."];

class allNote extends StatefulWidget {
  const allNote({super.key});

  @override
  State<allNote> createState() => _allNoteState();
}

class _allNoteState extends State<allNote> {


  @override
  void initState() {
    super.initState();
    // dynamic data = "";
    // dynamic subData = "";
    // noteData.add(data);
    // noteSubData.add(subData);
  }

  bool isGridView = true;

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
        body: Padding(
          padding: const EdgeInsets.only(top:9.0),
          child: Column(
              children: [
            Row(children: [
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addNote(),
                          )).then((value) {
                        setState(() {
                          noteData.add(value[0]);
                          noteSubData.add(value[1]);
                          print(noteData+noteSubData);
                        });
                      });;
                    },
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
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
            ]),
            Expanded(
              child: Container(
                height: 710,
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
                      margin: EdgeInsets.all(10),
                      child: SearchBar(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.blue)),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        leading: Icon(
                          Icons.search,
                          size: 35,
                          color: Colors.blue,
                        ),
                        hintText: "Search",
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                "All Notes",
                                style: TextStyle(
                                    fontSize: 23.5, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.filter_alt_outlined,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isGridView = !isGridView;
                              });
                              print("Change Grid To list");
                            },
                            icon: Icon(isGridView
                                ? Icons.grid_view_outlined
                                : Icons.list_outlined),
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: isGridView
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: FilledCardExample(index,context),
                                  );
                                },
                                itemCount: noteData.length,
                              )
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: listTemplate(index,context),
                                  );
                                },
                                itemCount: noteData.length,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
