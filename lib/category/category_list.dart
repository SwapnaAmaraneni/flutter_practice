import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'category_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category list")),
      body: Container(
          child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final CategoryData = list[index];
          return CategoryListItem(categoryData: CategoryData);
        },
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTheCategoryData();
  }

  fetchTheCategoryData() async {
    String data = await rootBundle.loadString('assets/categories.json');
    final jsonResult = json.decode(data);
    setState(() {
      list = jsonResult["dashBoardDetails"];
    });
    print("Category list $jsonResult");
  }
}
