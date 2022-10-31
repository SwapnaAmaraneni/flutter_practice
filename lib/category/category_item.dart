import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryListItem extends StatelessWidget {
  CategoryListItem({super.key, required this.categoryData});
  final Map categoryData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        category_row_component(
            "Category Name", categoryData["category"] ?? ""),
        category_row_component(
            "Category Id", categoryData["categoryid"] ?? ""),

            /*  Image.network(
            categoryData["imagePath"] ?? "",
            width: 50,
            height: 50,
          ), */
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 0.0,top: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Text("Category Image"), Image.network(
              categoryData["imagePath"] ?? "",
              width: 50,
              height: 50,
            ),
              ],
            ),
          )
      ]),
    );
  }

  Container category_row_component(String title, String value) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
          
             Text(title),
             Text(value),
           
          ],
        ),
      ),
    );
  }
}
