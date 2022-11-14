import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared_preferences/shared_preferences.dart';
import 'package:lottie/lottie.dart';

class OTPActivity extends StatefulWidget {
  const OTPActivity({super.key});

  @override
  State<OTPActivity> createState() => _OTPActivityState();
}

class _OTPActivityState extends State<OTPActivity> {
  TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
        appBar: AppBar(
          title: Text("OTP"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Lottie.asset('assets/otp_code.json',height: 150,width: 150),
              
                
               /*  Image.asset(
                  'assets/ghmc_logo_new.png',
                  height: 100,
                  width: 200,
                ), */
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'OTP',
                    ),
                    controller: _otpController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter otp";
                      }
                      return null;
                    },
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // requestLogin(context, _mobileController.text);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 200,
                    alignment: Alignment.topCenter,
                    color: Colors.pink,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: const Text(
                      'Validate OTP',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            )));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readsharedprefData(_otpController.text);
  }
}

Future<void> readsharedprefData(String otptextfield) async {
  final value = await SharedPreferencesClass().readTheData("otp");

  otptextfield = value;
  print("read value is $otptextfield");
}
