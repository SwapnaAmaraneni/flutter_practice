import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_myghmc/models/crickers_model.dart';

import '../db/database_helper.dart';
import 'display_cricketdb_details.dart';

class UserRetrieveComponent extends StatefulWidget {
  const UserRetrieveComponent({super.key});

  @override
  State<UserRetrieveComponent> createState() => _UserRetrieveComponentState();
}

class _UserRetrieveComponentState extends State<UserRetrieveComponent> {

  List<CrickertModel> userData = [];
  //late CrickertModel? _CrickertModel;

  @override
  void initState() {
    super.initState();

    DatabaseHelper.instance.queryAllRows("Cricketers").then((value) {
      setState(() {
        value.forEach((element) {
          userData.add(CrickertModel(
            userId: element["userId"],
            name: element['name'],
            dob: element["dob"],
            gender: element["gender"],
            country: element["country"]
             ));
          print(userData);
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller1'),
      ),
      body: userData.isEmpty
          ? Center(child: Text('No Data !!!'),)
          :Container(
        child: ListView.builder(
        itemCount: userData.length,
        
        itemBuilder: (context, index) {
          final CricketerData = userData[index];
          print(userData[index].gender);
            return CricketerListItem(details: CricketerData);
            
        },
      )),
          
    );
  }
}