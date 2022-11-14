import 'package:flutter/material.dart';
import 'package:flutter_myghmc/ui/providers/EmployeeModel.dart';

class EmpListProvider with ChangeNotifier {
  List<EmployeeModel> _items = [];

  void addEmployeesData(EmployeeModel empData) {
    _items.add(empData);
    notifyListeners();
  }

  List<EmployeeModel> get EmployeeDetails {
    return _items;
  }
}