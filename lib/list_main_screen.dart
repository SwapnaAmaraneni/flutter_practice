import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_project/routers/app_routes.dart';

import 'AddDetailsScreen.dart';
import 'list_items.dart';

void main() {
  runApp(MaterialApp(
    home: ListMainScreen(),
  ));
}

class ListMainScreen extends StatefulWidget {
  const ListMainScreen({super.key});

  @override
  State<ListMainScreen> createState() => ListMainScreenState();
}

class ListMainScreenState extends State<ListMainScreen> {
//empty list
  List<UserDetails> userDetailsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Dynamic ListView"),
      ),
      body: ListView.builder(
        itemCount: userDetailsList.length,
        itemBuilder: (context, index) {
          final userData = userDetailsList[index];

          return Users(
            userDetails: userData,
            //Implement the call back
            callBackValue: (userData) {
              showAlert(userData);
            },
          );
        },
      ),
      /*   floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            // Create the SelectionScreen in the next step.
            MaterialPageRoute(builder: (context) => const AddDetailsScreen()),
          );

          setState(() {
            userDetailsList.add(result);
          }
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
     */
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, AppRoutes.listviewdemo);
        
      },
       backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      
    );
  }

  showAlert(UserDetails userDetails) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${userDetails.email} ${userDetails.password}"),
            actions: [
              TextButton(
                onPressed: () {
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
                //style: ButtonStyle(backgroundColor:),
              )
            ],
          );
        });
  }
}
