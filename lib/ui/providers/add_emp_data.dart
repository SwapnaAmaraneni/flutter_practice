import 'package:flutter_myghmc/ui/providers/EmployeeModel.dart';
import 'package:flutter_myghmc/ui/providers/emp_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AddEmpDetails extends StatefulWidget {
  const AddEmpDetails({super.key});

  @override
  State<AddEmpDetails> createState() => _AddEmpDetailsState();
}

class _AddEmpDetailsState extends State<AddEmpDetails> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _salaryController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final empStateProvider = Provider.of<EmpListProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.white,
              child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    } else {
                      return null;
                    }
                  }),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(hintText: "Salary"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter salary';
                  } else {
                    return null;
                  }
                }),
          ),
        ),
        TextButton(
            onPressed: (() {
              empStateProvider.addEmployeesData(EmployeeModel(
                  name: _nameController.text, salary: _salaryController.text));
              print("data added successfully" +
                  empStateProvider.EmployeeDetails.length.toString());
              Navigator.pop(context);
            }),
            child: Text("Add Employee"))
      ]),
    );
  }
}
