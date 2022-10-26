import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget {
  const DemoItem(
      {super.key, required this.counrtyName, required this.callBackValue});
  final String counrtyName;
  //Create The Callback
  final Function(String value) callBackValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Call the callback
        callBackValue(counrtyName);
      },
      child: ListTile(
        title: Text(counrtyName),
        trailing: Icon(Icons.drive_eta_sharp),
        leading: Image.network("https://i.ibb.co/hMMFXQ0/laptop.jpg"),
        // leading: Image.asset("assets/laptop.jpeg",height: 50,width: 50),
        //https://i.ibb.co/hMMFXQ0/laptop.jpg
      ),
    );
  }
}
