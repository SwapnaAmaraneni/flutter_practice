import 'package:flutter/material.dart';

import '../../models/viewGrievancesmodel.dart';

class CheckStatusListItem extends StatelessWidget {
  const CheckStatusListItem({super.key, required this.details});
  final ViewGrievances? details;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          category_row_component("ID", details?.id ?? ""),
          category_row_component("Category Name", details?.category ?? ""),
          category_row_component("Time stamp", details?.timestamp ?? ""),
          category_row_component("Assigned to", details?.assignedto ?? ""),
          category_row_component("Type", details?.type ?? "")
          
        ],
      ),
    );
  }
}

Container category_row_component(String title, String value) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Text(title, textAlign: TextAlign.left),
          Text(value,textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                ),
        ],
      ),
    ),
  );
}