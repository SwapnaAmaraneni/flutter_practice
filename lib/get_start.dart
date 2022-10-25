import 'package:flutter/material.dart';
import 'package:my_first_project/routers/app_routes.dart';

import 'login_page.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetStart")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
               Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
              width: 200,
              alignment: Alignment.topCenter,
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Text(
                'Get Start',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
         /*  MaterialButton(
            onPressed: () {
              //validateInputs();
            },
            child: Container(
              margin: EdgeInsets.only(top: 30),
              width: 200,
              alignment: Alignment.topCenter,
              color: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Text(
                'Signup',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ) */
        ],
      )),
    );
  }
}
