import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
  
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobileControlar = TextEditingController();
  TextEditingController _pincodeControlar = TextEditingController();
  TextEditingController _nameControlar = TextEditingController();
  TextEditingController _remarksControlar = TextEditingController();
  TextEditingController _passwordControlar = TextEditingController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your mobile number...",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                controller: _mobileControlar,
                maxLength: 10,
                keyboardType: TextInputType.number,
                cursorColor: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your pincode...",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                controller: _pincodeControlar,
                maxLength: 6,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Enter Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.purple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    )),
                controller: _nameControlar,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Your remarks...",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                controller: _remarksControlar,
                maxLines: null,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                obscureText: hidePassword, //show/hide password
                decoration: InputDecoration(
                  hintText: "Enter Your password...",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
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
                controller: _passwordControlar,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
