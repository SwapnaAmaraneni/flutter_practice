import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myghmc/core/api_constants.dart';

import '../routes/app_routes.dart';
import '../shared_preferences/shared_preferences.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ghmc_logo_new.png',
                height: 100,
                width: 200,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _mobileController,
                    validator: (value) {
                      final v = value ?? "";
                      if (v.isEmpty) {
                        //value!.isEmpty
                        return "Please Enter mobile number";
                      } else if (v.length != 10) {
                        return "Please enter valid mobile number";
                      } /* else if (!v.startsWith("9") ||
                          !v.startsWith("8") ||
                          !v.startsWith("7") ||
                          !v.startsWith("6") ||
                          !v.startsWith("5")) {
                            return "Please enter valid mobile number";
                          } */
                      return null;
                    }),
              ),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    requestLogin(context, _mobileController.text);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 200,
                  alignment: Alignment.topCenter,
                  color: Colors.pink,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

requestLogin(BuildContext context, String mobile) async {
  final requestUrl = ApiConstants.baseUrl + ApiConstants.loginEndpoint;

  final requestPayload = {
    "userid": "cgg@ghmc",
    "password": "ghmc@cgg@2018",
    "mobile_no": mobile,
    "macid": "02:00:00:00:00:00",
    "imei": "5657122814bedc49",
    "source": "GHMC"
  };

  final _dioObject = Dio();
  try {
    final _response = await _dioObject.post(requestUrl, data: requestPayload);
    print(_response.data);
    if (_response != null) {
      if (_response.statusCode == 200) {
        var status = _response.data['status'];
        var otp = _response.data['otp'];
        var token = _response.data['token'];

        print("status is $status");
        print("token is $token");

        if (status == "Success") {
          print("OTP is $otp");
          SharedPreferencesClass().writeTheData("otp", otp);
          SharedPreferencesClass().writeTheData("token", token);

          Navigator.pushNamed(context, AppRoutes.otpactivitity);
        }
      }
    }
  } on DioError catch (e) {
    print("error is $e");
    print("status code is ${e.response?.statusCode}");
  }
}
