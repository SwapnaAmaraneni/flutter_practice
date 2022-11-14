import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppInputTextField extends StatelessWidget {
  const AppInputTextField(
      {super.key,
      required this.prefixIcon,
      required this.controller,
      required this.hintText,
      this.textColor = Colors.grey,
      this.isSecured,
      this.onTap,
      this.isVisible});
  final Widget prefixIcon;
  final TextEditingController controller;
  final String hintText;
  final Color? textColor;
  final bool? isSecured;
  final bool? isVisible;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: this.isVisible ?? false,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: this.isSecured == true
                ? GestureDetector(
                    onTap: () {
                      this.onTap!();
                    },
                    child: Icon(this.isVisible == true
                        ? Icons.remove_red_eye_outlined
                        : Icons.read_more_outlined),
                  )
                : null,
               hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            fontFamily: "poppins",
            color: textColor,
          ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.purple),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(15),
            )),

        /* decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: this.isSecured == true
              ? GestureDetector(
                  onTap: () {
                    this.onTap!();
                  },
                  child: Icon(this.isVisible == true
                      ? Icons.remove_red_eye_outlined
                      : Icons.read_more_outlined),
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            fontFamily: "poppins",
            color: textColor,
          ),
         /*  border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ), */
        
        ),
      */
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(vertical: 12.0),
    );
  }
}


/*
   if (this.isSecured == true) {
     print("ok");
   }else{
    print("no");
   }

    this.isSecured == true ? print("ok") : print("no");
    //condition ? ex1: exp2
 */