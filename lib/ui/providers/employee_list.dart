import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_myghmc/ui/providers/add_emp_data.dart';
import 'package:flutter_myghmc/ui/providers/emp_list_provider.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';
import 'add_emp_data.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
//  List<StudentModel> _studentsList = [];

  @override
  Widget build(BuildContext context) {
    final empStateProvider = Provider.of<EmpListProvider>(context);

    return Material(
      child: Scaffold(
          appBar: AppBar(title: Text("List View Using Providers")),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: empStateProvider.EmployeeDetails.length,
                itemBuilder: ((context, index) {
                  final details = empStateProvider.EmployeeDetails[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: Container(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Name: " +
                              empStateProvider.EmployeeDetails[index].name),
                              Padding(padding: EdgeInsets.only(top: 10)),
                          Text("Salary: " +
                              empStateProvider.EmployeeDetails[index].salary),
                            Padding(padding: EdgeInsets.only(top: 10)),

                        ],
                      )),
                    ),
                  );
                }),
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: (() {
              Navigator.pushNamed(context, AppRoutes.AddEmpDetails);
            }),
            tooltip: 'add',
            child: const Icon(Icons.add),
          )),
    );
  }
}
