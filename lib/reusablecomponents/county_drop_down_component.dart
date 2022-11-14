import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'notifer_list.dart';

class DropDownComponent extends StatelessWidget {
  const DropDownComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15,left: 15,top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Country",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15,left: 15,top: 5),
            child: ValueListenableBuilder(
              valueListenable: selectedCountry,
              builder: (context, value, child) {
                return DropdownButton(
                  hint: value == null
                      ? Text('Please Select Country')
                      : Text(
                          value,
                          style: TextStyle(color: Colors.blue),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.blue),
                  items: ['India', 'USA', 'China'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    print(val);
                    selectedCountry.value = val;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
