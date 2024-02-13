import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String userName = "";
  String userEmail = "";
  String userPhoneNumber = "";

  @override
  void initState() {
    super.initState();
    getvalue();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 18,top:40),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.person_rounded),
                title: Text("Name",style: TextStyle(fontSize: 15),),
                subtitle: Text(userName,style: TextStyle(fontSize: 22,color: Colors.black),),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email",style: TextStyle(fontSize: 15),),
                subtitle: Text(userEmail,style: TextStyle(fontSize: 22,color: Colors.black),),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone",style: TextStyle(fontSize: 15),),
                subtitle: Text(userPhoneNumber,style: TextStyle(fontSize: 22,color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getvalue() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    userName = pref.getString("name")!;
    userEmail = pref.getString("email")!;
    setState(() {

    });
  }
}
