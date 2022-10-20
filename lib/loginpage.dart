import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _emailcontroller = new TextEditingController();
  TextEditingController _pwdcontroller = new TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Login Page'),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 30, right: 30),
          child: TextField(
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText: 'Enter Your email',
            ),
            controller: _emailcontroller,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: TextField(
            obscureText: hidePassword, //show/hide password
            decoration: InputDecoration(
              labelText: 'Enter Your password',
              hintText: "password",

              //prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: hidePassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              ),
            ),
            controller: _pwdcontroller,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              validateInputs();
            },
            child: Container(
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  validateInputs() {
    if (_emailcontroller.text.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(_emailcontroller.text)) {
      showAlert("Please enter valid email");
    }
/* 
Maximum 8 characters
Minimum 1 Upper case
Minimum 1 lowercase
Minimum 1 Numeric Number
Minimum 1 Special Character
Common Allow Character ( ! @ # $ & * ~ ) */

    else if (_pwdcontroller.text.isEmpty ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(_pwdcontroller.text)) {
      showAlert("Please enter valid password");
    }
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
