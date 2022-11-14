import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButtonWidget extends StatelessWidget {
const MyButtonWidget(
      {super.key,
      required this.hintText,
      this.textColor = Colors.grey, this.onTap,
     });
  final String hintText;
  final Color? textColor;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
   return Container(
      child: MaterialButton(
        
        onPressed: (){
         

        },
        child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 200,
                  alignment: Alignment.topCenter,
                  color: Colors.pink,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    hintText,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
         
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(vertical: 12.0),
    );
 

  }
}