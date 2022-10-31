import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _profileState();
}

class _profileState extends State<Profilepage> {
  dynamic profileResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Profile'))),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(profileResult["imageurl"]),
                backgroundColor: Colors.transparent,
              ),
            )),
            row_component('Name', profileResult["name"]),
            row_component('Employee Id', profileResult["empId"]),
            row_component('Designation', profileResult["designation"])
           
          ])),
    );
  }

  Row row_component(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
        
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Text(value, style: TextStyle(color: Colors.purple, fontSize: 20)),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  fetchProfileData() async {
    String data = await rootBundle.loadString('assets/profile.json');

    setState(() {
      profileResult = json.decode(data);
      print("photo is $profileResult['imageurl']");
    });
  }
}