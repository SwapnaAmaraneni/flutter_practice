import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = [];
  final List<String> pwds = [];

  final List<int> msgCount = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      pwds.insert(0, pwdController.text);

      msgCount.insert(0, 0);
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Tutorial - googleflutter.com'),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: pwdController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          FloatingActionButton(
            child: Text('Add'),
            onPressed: () {
              addItemToList();
               //print(names);
            },
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      margin: EdgeInsets.all(2),
                      color: msgCount[index] >= 2
                          ? Colors.blue[400]
                          : msgCount[index] > 3
                              ? Colors.blue[100]
                              : Colors.green,
                      child: Center(
                          child: Text(
                        '${names[index]} (${pwds[index]})',
                        style: TextStyle(fontSize: 18),
                      )),
                    );
                  }))
        ]));
  }
}
