import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_myghmc/reusablecomponents/AppInputTextField.dart';
import 'package:flutter_myghmc/reusablecomponents/dob_selection_component.dart';
import 'package:flutter_myghmc/reusablecomponents/notifer_list.dart';
import 'package:flutter_myghmc/ui/user_retrieve_component.dart';
import 'package:intl/intl.dart';
import '../db/database_helper.dart';
import '../models/crickers_model.dart';
import '../reusablecomponents/county_drop_down_component.dart';
import '../reusablecomponents/user_gender_component.dart';
import '../reusablecomponents/user_image_component.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Login"))),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              UserImageComponent(),

              AppInputTextField(
                  prefixIcon: Icon(Icons.person),
                  controller: _nameController,
                  hintText: "Please enter name"),
              UserGenderComponent(),

              UserDobComponent(),

              DropDownComponent(),
              
              TextButton(
                  onPressed: () async {
                    final date = DateFormat("yyyy/MM/dd").format(userDob.value);

                    final cricketerData = CrickertModel(
                        gender: userGender.value,
                        dob: date,
                        name: _nameController.text,
                        role: "",
                        country: selectedCountry.value,
                        userId: const Uuid().v1(),
                        userimage: userImagePath.value?.path ?? "");

                    print("print gender ${userGender.value}");
                    print("print image file ${userImagePath.value?.path}");
                    print("print dob ${userDob.value}");
                    print("print country ${selectedCountry.value}");
                    final DatabaseHelper databaseService =
                        DatabaseHelper.instance;
                    final saved = await databaseService.insertInto(
                        cricketerData.toJson(), "Cricketers");
                    print("data saved $saved");
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                  ),
                   TextButton(
                  onPressed: () async {
                      Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRetrieveComponent()),
                );
                  }, child: const Text(
                    "Retrieve Data", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                     )
                   )
            ],
          )),
    );
  }
}
